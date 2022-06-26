#!/bin/bash

kind create cluster \
	--name test \
	--image kindest/node:v1.19.11 \
	--config kind.yaml
