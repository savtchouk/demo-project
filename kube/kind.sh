#!/bin/bash

command=$1

if [ $command == "create" ]
then
    kind create cluster \
        --name test \
        --image kindest/node:v1.19.11 \
        --config $(dirname $0)/kind.yaml
elif [ $command == "delete" ]
then
    kind delete cluster --name test
else
    echo "Invalid command entered. Try 'create' or 'delete'"
fi
