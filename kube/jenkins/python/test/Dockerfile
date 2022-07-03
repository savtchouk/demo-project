FROM ubuntu

RUN apt update
RUN apt upgrade --assume-yes

# Install docker
RUN apt install --assume-yes ca-certificates curl gnupg lsb-release

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
	https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update
RUN apt install --assume-yes docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Install nodejs, npm
RUN apt update
RUN apt install --assume-yes nodejs npm

# Install python
RUN apt install --assume-yes python3-pip python-is-python3
RUN pip install kubernetes

WORKDIR /work/
COPY deploy_from_yaml /usr/local/bin/

CMD ["sleep", "30d"]
