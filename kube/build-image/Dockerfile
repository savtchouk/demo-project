FROM ubuntu

RUN apt update
RUN apt install --assume-yes python3-pip python-is-python3
RUN pip install pytime pyyaml kubernetes

COPY apply_deployment_from_yaml /usr/local/bin/
COPY rollout_deployment_status /usr/local/bin/
