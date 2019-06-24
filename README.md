# Capture of provenance events
The main goal of this project is to capture provenance events to analyze the use and importance of this information. For that purpose, Apache NiFi is used.

In here, you can find four files:
- The docker-compose with all the services needed for the deployment of the scenario. There are two instances of NiFi defined: one to ingests the supermarket data and the other one to captura and store provenance events into Neo4j. 
- The script to get a subscription to the Carrefour data.
- The NiFi template named CarrefourData-Processing with all the processors needed to proccess and change the data ingested.
- The NiFi template named ProvenanceEventsToNeo4j with the processors that send the information to Neo4j.

The data ingested is defined in the following github: https://github.com/ging/carrefour_basket_data_challenge.

### Docker-compose
In this file, the necessary containers to receive all the data are described:
- The dataset is stored in an instance of MongoDB, which is executed with the container ging/mongo-dataset.
- To capture this data in Apache NiFi it is necessary to send them to Orion Context Broker, which sends notifications with the updates in the dataset of each subscription. To do this, you need three containers: fiware/orion for the Orion Context Broker instance, mongo:3.4 to connect the database with Orion Context Broker and ging/dataset to send the data to Orion Context Broker.



### Script

### CarrefourDate-Processing

### ProvenanceEventsToNeo4j
