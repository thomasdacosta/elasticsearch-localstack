#!/bin/bash

curl -s -H "Content-Type: application/json" "$@" | jq .