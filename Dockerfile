FROM node:16.15.0-alpine3.15 AS builder


WORKDIR /app

COPY . .
COPY package*.json ./
RUN npm install

FROM nginx:latest as production

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8000
CMD ["node", "server.js"]
CMD ["nginx", "-g", "daemon off;"]

