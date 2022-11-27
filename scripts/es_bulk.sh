#!/bin/bash

echo "Inserindo documentos em lote - data_bulk_generated_1000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_1000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_2000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_2000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_3000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_3000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_4000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_4000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_5000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_5000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_6000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_6000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_7000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_7000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_8000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_8000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_9000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_9000.json | jq .

echo "Inserindo documentos em lote - data_bulk_generated_10000.json"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk_generated_10000.json | jq .