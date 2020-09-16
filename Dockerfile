FROM ferdinandyanto/docker-node-oracle

WORKDIR /app
COPY . /app

RUN yarn

EXPOSE 3333

CMD ["yarn", "start"]
