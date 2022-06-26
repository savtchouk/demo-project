#!/bin/bash

export REGISTRY=docker.io/objectscale
export DOCKER_REGISTRY_SECRET=demo-project-registry

kubectl create secret docker-registry $DOCKER_REGISTRY_SECRET \
	--docker-username=alexeysavchuk \
	--docker-password=thisismynewpassword \
	--docker-email=sav.alex1917@gmail.com

helm install csi-baremetal-operator csi/csi-baremetal-operator \
	--set global.registry=$REGISTRY \
	--set global.registrySecret=$DOCKER_REGISTRY_SECRET

helm install csi-baremetal csi/csi-baremetal-deployment \
	--set scheduler.patcher.enable=true \
	--set driver.drivemgr.type=loopbackmgr \
	--set driver.drivemgr.deployConfig=true \
	--set global.registry=$REGISTRY \
	--set global.registrySecret=$DOCKER_REGISTRY_SECRET \
	--set driver.log.level=debug \
	--set scheduler.log.level=debug \
	--set nodeController.log.level=debug
