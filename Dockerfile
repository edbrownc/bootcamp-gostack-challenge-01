FROM ferdinandyanto/docker-node-oracle:10.16.0

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
