# Capture of events of provenance
The main goal of this project is to capture provenance events to analyze the use and importance of this information. For that purpose, Apache NiFi is used.

In here, you can find three files:
- The docker-compose with all the services needed for the deployment of the scenario.
- The NiFi template named CarrefourData-Processing with all the processors needed to proccess and change the data ingested.
- The NiFi template named ProvenanceEventsToNeo4j with the processors that send the information to Neo4j.
