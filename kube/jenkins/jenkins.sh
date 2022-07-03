#!/bin/bash

dir=$(dirname $0)

kubectl create namespace jenkins

helm upgrade --install jenkins jenkins/jenkins \
	-f $dir/jenkins.values \
	--set namespaceOverride="jenkins" \
	--set tagOverride="lts-jdk11"
