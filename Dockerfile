FROM node:14 AS builder

WORKDIR /app

COPY ./package*.json /app
COPY ./.env.local /app
RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]
