# BAML+Neo4j FastAPI Starter

Simple FastAPI server using BAML and Neo4j to parse incoming data and upload as a graph to Neo4j.

## Setup

Open this project up in VSCode (we recommend only opening this folder, and not at the root, or VSCode may not detect the python environment and you may not get type completions for BAML functions).

Ensure your `settings.json` has:

```
{
  "python.analysis.typeCheckingMode": "basic"
}
```

## Update BAML

1. Run `poetry run baml-cli generate`

## Running

1. Run `poetry install`
2. Copy the .env.sample file to .env
3. Add your OpenAI and Neo4j credentials to the .env file
4. Run `poetry run baml-cli generate` to create/update baml client files
5. Run `poetry run uvicorn baml_neo4j_fastapi.app:app --reload`
6. Curl the endpoint to test:
   ```
   curl -X GET -H "Content-Type: application/json" http://localhost:8000/resume_to_graph
   ```
   Or run http://localhost:8000/docs to run FastAPIs interactive docs.
