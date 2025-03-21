# Orders_Real_Time_Ingestion

Real time ingestion of orders and payments data from GCP topic to Cassandra table

- Python Version    3.12.4
- cassandra-driver  3.29.2

### Initial Steps for Pub-Sub
-------------------------------

1. Make sure Google cloud sdk is installed to access gcloud cli commands
2. Create Pub-Sub topics named as orders_data, payments_data and dlq_payments_data with default subscribers
3. Before publishing/consuming data in pub-sub topic, make sure gcp account is authenticated from terminal
4. Use this command to authenticate "gcloud auth application-default login"
5. Once done then default auth config will get created on the location vim /Users/user/.config/gcloud/application_default_credentials.json in case of mac
   and \Users\user\AppData\Roaming\gcloud\application_default_credentials.json for windows
6. Open IAM & Admin service, create new service account and add pub-sub producer and pub-sub subscriber role for the same
7. Create keys for this newly create service account, json file will get download. Copy the content of that json file and replace it under application_default_credentials.json

### Python Package For Installation
-------------------------------

- pip3 install google-cloud-pubsub
- pip3 install cassandra-driver

### Docker command to start cassandra
----------------------------------

Make sure Virtualization is enabled ( Check in BIOS and turn windows features on or off )
* docker compose -f docker-compose-cassandra.yml up -d
* Once cassandra container started, open the terminal of docker container
* type cqlsh on terminal
* cqlsh shell will be opened and now cassandra related commands can be executed

### Cassandra table Creation
-------------------------------
```
CREATE KEYSPACE IF NOT EXISTS ecom_store WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
```

```
CREATE TABLE ecom_store.orders_payments_facts (
    order_id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    item TEXT,
    quantity BIGINT,
    price DOUBLE,
    shipping_address TEXT,
    order_status TEXT,
    creation_date TEXT,
    payment_id BIGINT,
    payment_method TEXT,
    card_last_four TEXT,
    payment_status TEXT,
    payment_datetime TEXT
);
```
