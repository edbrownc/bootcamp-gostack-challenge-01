FROM node:12-buster-slim

WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y alien libaio1 wget
RUN wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.8-basic-19.8.0.0.0-1.x86_64.rpm
RUN alien -i --scripts oracle-instantclient*.rpm
RUN rm -f oracle-instantclient19.8*.rpm

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
