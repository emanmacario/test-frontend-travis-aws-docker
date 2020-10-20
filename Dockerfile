# Set base Node.js image
FROM node:alpine as builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json, then install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and project files, and build
COPY . ./
RUN npm run build

# Set base Nginx image
FROM nginx:alpine

# Configure Nginx, and copy the build from previous stage
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/build /usr/share/nginx/html

# Expose container port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]