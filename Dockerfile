# Stage 1

# Use an existing base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Copy application files from host to container
COPY . .

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Set the default command to execute when the container starts
CMD ["python3", "app.py"]

#stage 2
FROM node:latest AS node
WORKDIR /app
COPY . .
RUN npm install

# stage 2
FROM nginx:latest
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
