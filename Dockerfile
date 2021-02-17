FROM ubuntu:focal

RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /src

COPY package.json /src/package.json
COPY package-lock.json /src/package-lock.json

RUN npm install

COPY . /src/
RUN npm run-script build
RUN CI=true npm test
