from neo4j import GraphDatabase
from neo4j.graph import Relationship, Node
from typing import Optional, List
import json
import os
import logging


def upload_cytoscape_to_neo4j(
    cytoscape_data: str | dict,
    neo4j_uri: Optional[str] = None,
    neo4j_user: Optional[str] = None,
    neo4j_password: Optional[str] = None,
):
    """
    Upload Cytoscape JSON data to Neo4j using the bolt driver
    Args:
        cytoscape_data (str | dict): Cytoscape formatted JSON data in either a string or dict representation
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

    nodes = cytoscape_data.get("elements", {}).get("nodes", [])
    edges = cytoscape_data.get("elements", {}).get("edges", [])
    logging.info(f"Uploading {len(nodes)} nodes and {len(edges)} edges...")

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

            logging.info(f"Created {len(nodes)} nodes")

            # Create relationships
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

            logging.info(f"Created {len(edges)} relationships")

            return True
    except Exception as e:
        print(f"Error uploading Cytoscape data to Neo4j: {str(e)}")
        return e


def download_neo4j_to_cytoscape(
    node_labels: List[str],
    relationship_types: List[str],
    neo4j_uri: Optional[str] = None,
    neo4j_user: Optional[str] = None,
    neo4j_password: Optional[str] = None,
):
    """
    Download data from Neo4j and convert it to Cytoscape JSON format
    Args:
        node_labels (List[str]): Labels of nodes to download
        relationship_types (List[str]): Types of relationships to download
        neo4j_uri (str): URI for Neo4j database connection
        neo4j_user (str): Neo4j username
        neo4j_password (str): Neo4j password

    Returns:
        str: Cytoscape JSON data
    """
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
            # Create a Cypher query to fetch data
            query = f"""
            MATCH (n:{'|'.join(node_labels)})-[r:{'|'.join(relationship_types)}]->(m)
            RETURN *
            """

            # Execute the query - returns a tuple of (records, summary, keys)
            records, _, _ = driver.execute_query(query)

            # Convert Neo4j result to Cytoscape format
            nodes = []
            edges = []

            for record in records:

                rv = record.values()

                for i in rv:
                    if isinstance(i, Node):
                        print("Node: ", i)
                        print("Node as dict:", i.__dict__)
                        print("element_id: ", i.element_id)
                        print("labels: ", list(i.labels))
                        print("node data: ", i._properties)

                        # Set node to user assigned data
                        node_data = i._properties

                        # Update with required fields, overwriting id and label for consistency
                        node_data.update(
                            {
                                "id": i.element_id,
                                "label": list(i.labels)[0],
                            }
                        )
                        nodes.append({"data": node_data})
                    elif isinstance(i, Relationship):
                        print("Relationship: ", i)
                        edge_data = i._properties
                        edge_data.update(
                            {
                                "id": i.element_id,
                                "source": i.start_node.element_id,
                                "target": i.end_node.element_id,
                                "label": i.type,
                            }
                        )
                        edges.append({"data": edge_data})

            # # Return in Cytoscape format
            # # Additional key-values stubs added for compatibility with NetworkX for importing
            return {
                "data": [],
                "directed": False,
                "multigraph": False,
                "elements": {"nodes": nodes, "edges": edges},
            }
    except Exception as e:
        print(f"Error downloading data from Neo4j: {str(e)}")
        return e
