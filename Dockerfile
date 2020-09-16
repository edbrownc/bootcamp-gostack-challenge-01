FROM ferdinandyanto/docker-node-oracle:10.16.0

WORKDIR /app
COPY . /app

RUN npm install

EXPOSE 8080

CMD npm start
