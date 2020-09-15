FROM node:12

WORKDIR /opt/oracle

RUN apt-get update && apt-get install -y alien libaio1 \
&& wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient18.5-basic-18.5.0.0.0-3.x86_64.rpm -P /opt/oracle/ \
&& alien -i --scripts oracle-instantclient*.rpm \
&& rm -f oracle-instantclient*.rpm && apt-get -y autoremove && apt-get -y clean \
&& mv /opt/oracle/instantclient_18_5 /opt/oracle/instantclient

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
