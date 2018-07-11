# docker_env


docker exec kafka-connect curl -X POST -H "Content-Type: application/json" \
    --data '{  "name": "hdfs-sink",  "config": {    "connector.class": "io.confluent.connect.hdfs.HdfsSinkConnector",    "tasks.max": "1",    "topics": "wzh_filebeat",    "hdfs.url": "hdfs://namenode:9000",    "flush.size": "3",    "name": "hdfs-sink",    "hive.integration": "true",    "hive.metastore.uris": "thrift://namenode:9083",    "schema.compatibility": "BACKWARD"  } }' \
    http://kafka-connect:8083/connectors


docker-compose exec kafka-connect curl -X POST -H "Content-Type: application/json" \
    --data '{     "name": "hdfs-sink",     "config": {         "connector.class": "io.confluent.connect.hdfs.HdfsSinkConnector",         "tasks.max": "1",         "topics": "wzh_filebeat",         "hdfs.url": "hdfs://namenode:9000",         "flush.size": "1",         "name": "hdfs-sink",         "key.converter": "org.apache.kafka.connect.storage.StringConverter",         "key.converter.schemas.enable": "false",         "value.converter": "org.apache.kafka.connect.json.JsonConverter",         "value.converter.schemas.enable": "false"  } }' \
    http://kafka-connect:8083/connectors


==============================

file source

docker-compose exec kafka-connect curl -X POST -H "Content-Type: application/json" \
    --data '{"name":"local-file-source","config":{"connector.class":"FileStreamSource","tasks.max":"1","topic":"wzh_file_log","name":"local-file-source","file":"/mnt/auth.log"}}' \
    http://kafka-connect:8083/connectors

hdfs sink

docker-compose exec kafka-connect curl -X POST -H "Content-Type: application/json" \
    --data '{"name":"hdfs-sink","config":{"connector.class":"io.confluent.connect.hdfs.HdfsSinkConnector","tasks.max":"1","topics":"wzh_file_log","hdfs.url":"hdfs://namenode:9000","flush.size":"1","name":"hdfs-sink","hive.integration":"true","hive.metastore.uris":"thrift://namenode:9083","schema.compatibility":"BACKWARD"}}' \
    http://kafka-connect:8083/connectors


 docker-compose exec kafka-connect curl -s -X GET http://kafka-connect:8083/connectors/hdfs-sink/status