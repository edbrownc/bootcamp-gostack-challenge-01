FROM node:12

WORKDIR /opt/oracle

RUN apt-get update && apt-get install -y alien libaio1 \
&& wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm \
&& alien -i --scripts oracle-instantclient*.rpm \
&& rm -f oracle-instantclient*.rpm && apt-get -y autoremove && apt-get -y clean

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
