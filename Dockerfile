FROM ubuntu

RUN apt-get update && apt-get install -y build-essential libssl-dev

RUN apt-get update && apt-get install -y git

RUN apt-get update && apt-get install -y wget

RUN apt-get update && apt-get install -y curl

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#ENV NVM_DIR ~/.nvm
#ENV NODE_VERSION 6.2.1

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
    &&  source ~/.nvm/nvm.sh \
    &&  nvm install node 
    #&&  nvm alias default $NODE_VERSION \
    #&&  nvm use default

ENV NODE_PATH ~/.nvm/v6.2.1/lib/node_module
ENV PATH      ~/.nvm/versions/node/v6.2.1/bin:$PATH

RUN ln -s  ~/.nvm/version/node/v6.2.1/bin/node /usr/bin/node

WORKDIR /srv/hello

RUN rm -rf /srv/hello

RUN git clone https://github.com/zackliu/nodetest .


#RUN npm install

EXPOSE 8888

CMD ["node", "/srv/hello/test.js"]