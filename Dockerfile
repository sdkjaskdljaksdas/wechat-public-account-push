# 使用官方 Node.js 16 镜像作为基础镜像
FROM node:16

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装项目依赖
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && cnpm install && cnpm install pm2 -g

# 复制项目文件到工作目录
COPY . .

# 暴露应用运行的端口（假设应用在3000端口运行）
EXPOSE 3000

# 使用 PM2 启动应用
CMD ["pm2-runtime", "start", "pm2.json"]