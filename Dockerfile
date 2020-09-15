FROM node:12

WORKDIR /opt/oracle

RUN apt-get update && apt-get install -y alien libaio1 \
&& wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.8-basic-19.8.0.0.0-1.x86_64.rpm \
&& alien -i --scripts oracle-instantclient*.rpm \
&& rm -f oracle-instantclient*.rpm && apt-get -y autoremove && apt-get -y clean

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
