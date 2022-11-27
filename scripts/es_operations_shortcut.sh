#!/bin/bash

echo "Conectando no Elasticsearch"
./es.sh -XGET "http://clientes.us-east-1.es.localhost.localstack.cloud:4566"

echo "Health Check do Elasticsearch"
./es.sh -XGET "http://clientes.us-east-1.es.localhost.localstack.cloud:4566/_cluster/health"

echo "Criando indice sem Mapping"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index"

echo "Criando o Mapping"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index" --data-binary @mapping.json

echo "Listando o Mapping"
./es.sh -XGET "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_mapping?pretty"

echo "Criando um documento"
./es.sh -XPOST "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_doc/1000?pretty" --data-binary @data_create.json

echo "Buscando um documento"
./es.sh -XGET  "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_doc/1000?pretty"

echo "Buscando todos os documentos"
./es.sh -XGET  "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_search?pretty"

echo "Atualizando um documento"
./es.sh -XPOST "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_update/1000?pretty" --data-binary @data_update.json | jq .

echo "Excluindo um documento"
./es.sh -XDELETE "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_doc/1000?pretty"

echo "Inserindo documentos em lote"
./es.sh -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" --data-binary @data_bulk.json | jq .