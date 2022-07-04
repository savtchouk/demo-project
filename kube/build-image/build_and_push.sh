#!/bin/bash

IMAGE_NAME=alexeysavchuk/pipeline-python

docker build -t $IMAGE_NAME $(dirname $0)
docker push $IMAGE_NAME
