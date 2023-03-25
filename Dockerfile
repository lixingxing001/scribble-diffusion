FROM node:14 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY --from=builder /app/.next ./.next
EXPOSE 9002
CMD ["npm", "start"]
