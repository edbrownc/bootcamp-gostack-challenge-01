FROM node:12-buster-slim

WORKDIR /opt/oracle
RUN apt-get update
RUN apt-get install -y alien libaio1 wget unzip
RUN wget https://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip && \
    unzip instantclient-basic-linuxx64.zip && \
    rm -f instantclient-basic-linuxx64.zip && \
    cd instantclient* && \
    rm -f *jdbc* *occi* *mysql* *jar uidrvci genezi adrci && \
    echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig && \
    mv /opt/oracle/instantclient* /opt/oracle/instantclient

ENV LD_LIBRARY_PATH=/opt/oracle/instantclient

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
