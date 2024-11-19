# 使用 Node.js 官方镜像作为基础镜像
FROM node:16-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json (如果存在)
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 全局安装 @adonisjs/cli
RUN npm install -g @adonisjs/cli

# 复制项目文件
COPY . .

# 创建 .env 文件
RUN cp .env .env

# 暴露端口 (默认 3333)
EXPOSE 3333

# 设置环境变量
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3333

# 启动应用
CMD ["npm", "start"]
