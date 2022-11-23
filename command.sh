STEP 1: GET CASSANDRA USING DOCKER
 docker pull cassandra:latest

STEP 2: START CASSANDRA
 docker network create cassandra-network
 docker run --rm -d --name cassandra --hostname cassandra-host --network cassandra-network cassandra

STEP 3: CREATE FILES //
 

STEP 4: LOAD DATA WITH CQLSH
 docker run --rm --network cassandra-network -v "$(pwd)/data.cql:/scripts/data.cql" -e CQLSH_HOST=cassandra -e CQLSH_PORT=9042 -e CQLVERSION=3.4.5 nuvo/docker-cqlsh

STEP 5: INTERACTIVE CQLSH
 docker run --rm -it --network cassandra-network nuvo/docker-cqlsh cqlsh cassandra 9042 --cqlversion='3.4.5'

STEP 6: READ SOME DATA
 SELECT * FROM store.shopping_cart;

STEP 7: WRITE SOME MORE DATA
 INSERT INTO store.shopping_cart (userid, item_count) VALUES ('4567', 20);

STEP 8: CLEAN UP
 docker kill cassandra
 docker network rm cassandra