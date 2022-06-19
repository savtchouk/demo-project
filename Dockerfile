FROM node:latest

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

WORKDIR /home/app

COPY ./app /home/app

RUN npm install

CMD ["node", "server.js"]
