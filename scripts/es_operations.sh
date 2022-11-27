#!/bin/bash

echo "Conectando no Elasticsearch"
curl -s -XGET "http://clientes.us-east-1.es.localhost.localstack.cloud:4566"

echo "Health Check do Elasticsearch"
curl -s -XGET "http://clientes.us-east-1.es.localhost.localstack.cloud:4566/_cluster/health" | jq .

echo "Criando indice sem Mapping"
curl -s -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index"

echo "Criando indice com Mapping"
curl -s -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index" -H 'Content-Type: application/json' --data-binary @mapping.json | jq .

echo "Listando o Mapping"
curl -s -XGET "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_mapping?pretty" | jq .

echo "Criando um documento"
curl -s -XPOST "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_doc/1000?pretty" -H 'Content-Type: application/json' --data-binary @data_create.json | jq .

echo "Buscando um documento"
curl -s -XGET  "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_doc/1000?pretty" | jq .

echo "Buscando todos os documentos"
curl -s -XGET  "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_search?pretty" | jq .

echo "Atualizando um documento"
curl -s -XPOST "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_update/1000?pretty" -H 'Content-Type: application/json' --data-binary @data_update.json | jq .

echo "Excluindo um documento"
curl -s -XDELETE "clientes.us-east-1.es.localhost.localstack.cloud:4566/clientes-index/_doc/1000?pretty" | jq .

echo "Inserindo documentos em lote"
curl -s -XPUT "clientes.us-east-1.es.localhost.localstack.cloud:4566/_bulk" -H 'Content-Type: application/json' --data-binary @data_bulk.json | jq .
