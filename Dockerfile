FROM node:12

RUN apt-get update
RUN apt-get install -y alien libaio1
RUN wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.8-basiclite-19.8.0.0.0-1.x86_64.rpm
RUN wget http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.8-sqlplus-19.8.0.0.0-1.x86_64.rpm
RUN alien -i --scripts oracle-instantclient19.8-basiclite-19.8.0.0.0-1.x86_64.rpm
RUN alien -i --scripts oracle-instantclient19.8-sqlplus-19.8.0.0.0-1.x86_64.rpm
RUN rm -f oracle-instantclient19.8*.rpm

ENV ORACLE_HOME=/usr/lib/oracle/19.8/client64
ENV PATH=$ORACLE_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib

WORKDIR /app
COPY  . /app
RUN chown -R node:node .

USER node

RUN yarn

EXPOSE 8080

ENTRYPOINT ["yarn", "start"]
