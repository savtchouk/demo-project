#!/bin/bash

dir=$(dirname $0)

bash $dir/baremetal/deploy-csi.sh
bash $dir/mongodb/apply.sh
bash $dir/jenkins/jenkins.sh
