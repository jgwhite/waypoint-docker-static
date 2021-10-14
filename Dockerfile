FROM node:lts-alpine3.14

COPY . /work

WORKDIR /work

RUN yarn install
RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]
