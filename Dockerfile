FROM centos:7

# Install lastest NodeJS relase
ENV NODE_VER="8.2.1"
ENV NODE_HOME="/usr/local/nodejs"
WORKDIR /opt
RUN curl "https://nodejs.org/download/release/v$NODE_VER/node-v$NODE_VER-linux-x64.tar.gz" | tar xz && \
	mv "node-v$NODE_VER-linux-x64" "$NODE_HOME"
ENV PATH="${PATH}:$NODE_HOME/bin"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install && npm cache clean --force
COPY . /usr/src/app

EXPOSE 8081 
CMD [ "npm", "start" ]

