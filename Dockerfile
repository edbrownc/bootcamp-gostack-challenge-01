FROM node:12-buster-slim

WORKDIR /opt/oracle
RUN apt-get update
RUN apt-get install -y alien libaio1 wget unzip
RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basic-linuxx64.zip && \
    unzip instantclient-basic-linuxx64.zip && \
    rm -f instantclient-basic-linuxx64.zip && \
    cd instantclient* && \
    echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig && \
    mv /opt/oracle/instantclient* /opt/oracle/instantclient

ENV LD_LIBRARY_PATH=/opt/oracle/instantclient

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
