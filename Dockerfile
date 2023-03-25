FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

COPY --from=0 /app/.next ./.next

EXPOSE 9002

CMD ["npm", "start"]
