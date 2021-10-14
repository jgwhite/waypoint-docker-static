FROM node:lts-alpine3.14

WORKDIR /work

COPY . /work
RUN yarn install
RUN yarn build

CMD ["yarn", "start"]
