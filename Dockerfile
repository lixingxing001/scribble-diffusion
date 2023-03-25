# 使用官方 Node.js 14 镜像作为基础镜像
FROM node:14

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到容器中
COPY package*.json ./

# 安装依赖
RUN npm install

# 将整个本地项目复制到容器中
COPY . /app

# 打包应用程序
RUN npm run build

# 暴露容器的 80 端口
EXPOSE 9002

# 运行应用程序
CMD ["npm", "run","dev"]
