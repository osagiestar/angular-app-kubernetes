# stage 1
#FROM node:latest
#WORKDIR /app
#COPY . .
#RUN npm install
#RUN npm run build

# stage 2
# FROM nginx:latest
# COPY --from=node /app/dist/angular-app /usr/share/nginx/html

# stage 1
# Use base image
FROM node:18-alpine
# Set working directory
WORKDIR /usr/src/app
# Copy dependencies and install
COPY package*.json ./
RUN npm install
# Copy source code
COPY .
# Expose port and start app
EXPOSE 3000
CMD ["npm", "start"]
