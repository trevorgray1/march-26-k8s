# Simple static frontend Dockerfile
FROM node:20-alpine AS builder
WORKDIR /app
COPY app/frontend/package.json ./
RUN npm install
COPY app/frontend/ ./

FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
