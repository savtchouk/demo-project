#!/bin/bash

command="cat /var/run/secrets/additional/chart-admin-password"

kubectl exec --namespace jenkins service/jenkins -- $command
