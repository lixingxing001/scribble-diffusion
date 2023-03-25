# 设置基础镜像
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install -g cnpm
RUN cnpm install
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html/

EXPOSE 9002
CMD ["nginx", "-g", "daemon off;"]
