# stage 1
FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# stage 2
# FROM nginx:latest
# COPY --from=node /app/dist/angular-app /usr/share/nginx/html
