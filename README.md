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

In addition to these four containers needed to capture the data, two new services are created to define two instances of Apache NiFi:
- One of these instances will receive the data to make all the modifications defined. Therefore, it is enough to define the access port to NiFi's interface NIFI_WEB_HTTP_PORT and expose it for access from local.
- The other instance of Apache NiFi will be responsible for receiving the generated provenance events and storing them in the Neo4j database. Again, it will be necessary to configure the port of access to the interface and expose it for access from local. In addition, the necessary parameters must be configured to establish SiteToSite connections between the two instances: the IP address of the container (NIFI_REMOTE_INPUT_HOST) and the port that enables the socket, which is also exposed to the local machine (NIFI_REMOTE_INPUT_SOCKET_PORT). Finally, in this container it will be necessary to copy the files that enable the Neo4j processors in Apache NiFi.

Since it is necessary to establish connections between each of the deployed containers, a network has been defined within the docker-compose file. Each of the containers is assigned an IP address of the network, thus ensuring the possible connection between them and also optimizing the necessary steps in the configuration of the entire deployed environment.

### Script
It is necessary to subscribe to Orion Context Broker to receive the update data from the database. To do this, we use a script with a CURL request in which the URL for the subscription must be included: http://172.18.1.14:5051/v2/notify. The indicated IP is the address that we have assigned to the instance of NiFi that will be responsible for loading the data in the system.

### CarrefourDate-Processing


### ProvenanceEventsToNeo4j

### Neo4j
To enable access from any IP address, you must configure the dbms.connectors.default_listen_address parameter with the address 0.0.0.0. It is verified that it is possible to access the database from a browser using the local IP address with the URL http://x.x.x.x:7474/browser/ (x.x.x.x is the IP address of your host).
