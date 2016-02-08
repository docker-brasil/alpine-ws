FROM mhart/alpine-node:0.12.9

MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"

#
# Esta imagem contém Bash, Node JS, NPM e servidor WebSocket
#

RUN apk add --update bash

RUN npm install -g ws

WORKDIR /src

RUN npm install ws

ADD . .

# If you have native dependencies, you'll need extra tools
# RUN apk add --update make gcc g++ python

# If you need npm, don't use a base tag
# RUN npm install ...

# If you had native dependencies you can now remove build tools
# RUN apk del make gcc g++ python
RUN rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp

EXPOSE 8025
CMD ["node", "WSServer.js"]
