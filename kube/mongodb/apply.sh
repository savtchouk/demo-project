#!/bin/bash

yamls=(
  mongo-secret.yaml
  mongo.yaml
  mongo-configmap.yaml
  mongo-express.yaml
)

for yaml in ${yamls[@]}
do
  kubectl apply -f $(dirname $0)/$yaml
done
