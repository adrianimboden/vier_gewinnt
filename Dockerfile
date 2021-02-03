FROM ubuntu:focal

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs


ENV CI=true
COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .
RUN npm run-script build
#RUN npm test
