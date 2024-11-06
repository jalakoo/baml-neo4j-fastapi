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

1. Run `poetry install`
2. Add your env vars to a .env.sample file, then rename to .env
3. Run `poetry run baml-cli generate` to create/update baml client files
4. Run `poetry run uvicorn baml_neo4j_fastapi.app:app --reload`
5. Curl the endpoint to test:
   ```
   curl -X GET -H "Content-Type: application/json" http://localhost:8000/resume_to_graph
   ```
   Or run http://localhost:8000/docs to run FastAPIs interactive docs.
