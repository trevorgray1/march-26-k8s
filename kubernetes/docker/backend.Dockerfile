# Node.js backend Dockerfile
FROM node:20-alpine
WORKDIR /app
COPY app/backend/package.json ./
RUN npm install
COPY app/backend/index.js ./
EXPOSE 4000
CMD ["npm", "start"]
