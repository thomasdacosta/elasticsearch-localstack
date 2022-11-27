#!/bin/bash

echo "1 - Criando dominio no Elasticsearch"
awslocal es create-elasticsearch-domain --domain-name clientes
RESULT=`awslocal es describe-elasticsearch-domain --domain-name clientes | jq ".DomainStatus.Processing"`
echo $RESULT

while $RESULT = "true"
do
	echo "2 - Esperando a criação do dominio"
	RESULT=`awslocal es describe-elasticsearch-domain --domain-name clientes | jq ".DomainStatus.Processing"`
done

echo "3 - Dominio criado"
echo "4 - Conectando no Elasticsearch"
curl -s XGET http://clientes.us-east-1.es.localhost.localstack.cloud:4566 | jq .
echo "5 - Health Check do Elasticsearch"
curl -s XGET http://clientes.us-east-1.es.localhost.localstack.cloud:4566/_cluster/health | jq .
