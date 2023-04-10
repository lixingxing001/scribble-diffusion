FROM node:14 AS builder

WORKDIR /app

COPY package*.json ./
COPY .env.local ./

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]
