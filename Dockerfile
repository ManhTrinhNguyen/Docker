FROM node:20-alpine

RUN mkdir -p /home/app

COPY ./app /home/app

WORKDIR /home/app 

RUN npm install 

CMD ["node", "server.js"]


