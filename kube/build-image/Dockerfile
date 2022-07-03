FROM ubuntu

RUN apt update
RUN apt install --assume-yes python3-pip python-is-python3
RUN pip install pyyaml kubernetes

COPY apply_deployment_from_yaml /usr/local/bin/
