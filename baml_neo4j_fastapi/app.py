from fastapi import FastAPI
import os
from baml_client import b
from baml_client.types import Message, Role
from fastapi.responses import StreamingResponse
from .cytoscape2neo4j import upload_cytoscape_to_neo4j, download_neo4j_to_cytoscape
from typing import List
import asyncio
import requests
import html2text
import json

from dotenv import load_dotenv

load_dotenv()

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "BAML + Neo4j Server running"}


@app.post("/url_agenda")
async def extract_url_of_events(urls: list[str]):
    """Extract agenda of sessions and speakers from a list of urls"""

    h = html2text.HTML2Text()
    h.ignore_links = False

    markdown_contents = []
    for url in urls:
        try:
            response = requests.get(url)
            response.raise_for_status()
            html_content = response.text
            markdown_content = h.handle(html_content)
            markdown_contents.append(markdown_content)
        except Exception as e:
            markdown_contents.append(f"Error processing {url}: {str(e)}")

    combined_markdown = "\n\n".join(markdown_contents)
    output = b.ExtractEvents(combined_markdown)
    return {"Speakers and Talks": output}


@app.post("/url_to_graph")
async def extract_url_content(urls: list[str]):
    """General purpose conversion of contents from a list of urls to a graph"""
    h = html2text.HTML2Text()
    h.ignore_links = False

    markdown_contents = []
    for url in urls:
        try:
            response = requests.get(url)
            response.raise_for_status()
            html_content = response.text
            markdown_content = h.handle(html_content)
            markdown_contents.append(markdown_content)
        except Exception as e:
            markdown_contents.append(f"Error processing {url}: {str(e)}")

    combined_markdown = "\n\n".join(markdown_contents)

    json_output = b.GenerateCytoscapeGraph(combined_markdown)
    json_str = str(json_output.model_dump_json())
    json_dict = json.loads(json_str)

    finished = upload_cytoscape_to_neo4j(json_dict)
    return {"finished": finished}


@app.post("/url_agenda_to_graph")
async def extract_url_of_agenda_content(urls: list[str]):
    """Converts a list of urls containing event agendas into a graph of events"""

    h = html2text.HTML2Text()
    h.ignore_links = False

    markdown_contents = []
    for url in urls:
        try:
            response = requests.get(url)
            response.raise_for_status()
            html_content = response.text
            markdown_content = h.handle(html_content)
            markdown_contents.append(markdown_content)
        except Exception as e:
            markdown_contents.append(f"Error processing {url}: {str(e)}")

    combined_markdown = "\n\n".join(markdown_contents)

    # Extract events
    events = b.ExtractEvents(combined_markdown)
    events_str = "\n".join([str(event.model_dump_json()) for event in events])

    combined_str = events_str + "\n\n" + combined_markdown

    json_output = b.GenerateCytoscapeGraph(combined_str)
    json_str = str(json_output.model_dump_json())
    json_dict = json.loads(json_str)

    finished = upload_cytoscape_to_neo4j(json_dict)
    return {"finished": finished}


@app.post("/neo4j_to_cytoscape")
async def download_graph_from_neo4j(
    nodes: List[str],
    relationships: List[str],
):
    """Download a graph from Neo4j and convert it to Cytoscape format"""

    json_output = download_neo4j_to_cytoscape(
        node_labels=nodes, relationship_types=relationships
    )

    return json_output


@app.get("/resume_to_graph")
async def extract_resume():
    """Converts a preloaded resume into a graph"""

    resume = """
    John Doe
    1234 Elm Street 
    Springfield, IL 62701
    (123) 456-7890

    Objective: To obtain a position as a software engineer.

    Education:
    Bachelor of Science in Computer Science
    University of Illinois at Urbana-Champaign
    May 2020 - May 2024

    Experience:
    Software Engineer Intern
    Google
    May 2022 - August 2022
    - Worked on the Google Search team
    - Developed new features for the search engine
    - Wrote code in Python and C++

    Software Engineer Intern
    Facebook
    May 2021 - August 2021
    - Worked on the Facebook Messenger team
    - Developed new features for the messenger app
    - Wrote code in Python and Java
    """

    json_output = b.GenerateCytoscapeGraph(resume)
    json_str = str(json_output.model_dump_json())
    json_dict = json.loads(json_str)

    finished = upload_cytoscape_to_neo4j(json_dict)
    return {"finished": finished}
