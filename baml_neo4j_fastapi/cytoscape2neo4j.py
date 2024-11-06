from neo4j import GraphDatabase
from typing import Optional
import json
import os


def upload_cytoscape_to_neo4j(
    cytoscape_data: dict,
    neo4j_uri: Optional[str] = None,
    neo4j_user: Optional[str] = None,
    neo4j_password: Optional[str] = None,
):
    """
    Upload Cytoscape JSON data to Neo4j using the bolt driver

    Args:
        cytoscape_data (dict | str): GraphSON formatted JSON data or str representation of JSON data
        neo4j_uri (str): URI for Neo4j database connection
        neo4j_user (str): Neo4j username
        neo4j_password (str): Neo4j password
    """
    if cytoscape_data is None:
        raise ValueError("graphson_data is required")
    if isinstance(cytoscape_data, str):
        cytoscape_data = json.loads(cytoscape_data)

    if neo4j_uri is None:
        neo4j_uri = os.getenv("NEO4J_URI")
    if neo4j_user is None:
        neo4j_user = os.getenv("NEO4J_USER", "neo4j")
    if neo4j_password is None:
        neo4j_password = os.getenv("NEO4J_PASSWORD")

    if neo4j_uri is None:
        raise ValueError("NEO4J_URI is required")
    if neo4j_password is None:
        raise ValueError("NEO4J_PASSWORD is required")

    try:
        # Connect to Neo4j using a context manager
        with GraphDatabase.driver(
            neo4j_uri, auth=(neo4j_user, neo4j_password)
        ) as driver:

            elements = cytoscape_data.get("elements")
            if not elements:
                raise ValueError("No elements found in Cytoscape data")
            if len(elements) != 2:
                raise ValueError(
                    "Expected exactly 2 elements in Cytoscape data. Got {}".format(
                        len(elements)
                    )
                )
            nodes = elements.get("nodes", [])
            if len(nodes) == 0:
                raise ValueError("No nodes found in Cytoscape data")
            edges = elements.get("edges", [])

            # Create nodes
            # TODO: Handle duplicate nodes
            # TODO: Replace with UNWIND
            for node in nodes:
                node_data = node.get("data", {})
                label = node_data.get("label")
                node_id = node_data.get("id")
                if label is None:
                    raise ValueError("Node 'label' missing")
                if node_id is None:
                    raise ValueError("Node 'id' missing")

                # Create properties string from remaining data
                properties = {k: v for k, v in node_data.items() if k != "label"}

                # Prevent duplicate Nodes
                query = f"MERGE (n:`{label}`{{id:$id}}) SET n = $properties"
                driver.execute_query(
                    query_=query,
                    parameters_={"id": node_id, "properties": properties},
                )

            # Create relationships
            # TODO: Replace with UNWIND
            for edge in edges:
                edge_data = edge.get("data", {})
                source = edge_data.get("source")
                target = edge_data.get("target")
                rel_type = edge_data.get("label", "RELATED_TO")

                # Create properties string from remaining data
                properties = {
                    k: v
                    for k, v in edge_data.items()
                    if k not in ["source", "target", "label"]
                }

                driver.execute_query(
                    query_="""
                    MATCH (source), (target)
                    WHERE source.id = $source AND target.id = $target
                    CREATE (source)-[r:`{}`]->(target)
                    SET r = $properties
                    """.format(
                        rel_type
                    ),
                    parameters_={
                        "source": source,
                        "target": target,
                        "properties": properties,
                    },
                )
            return True
    except Exception as e:
        print(f"Error uploading Cytoscape data to Neo4j: {str(e)}")
        return e
