# Use Alpine Linux 3.20 as the base image
FROM alpine:3.20

# Update package repositories and upgrade busybox
RUN apk update && \
    apk upgrade busybox=1.36.1-r29 busybox-extras=1.36.1-r29 busybox-ssl_client=1.36.1-r29

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package.json package-lock.json* ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY graphserver.js UScities.json ./

# Expose the port the app runs on
EXPOSE 4000

# Define the command to run the application
CMD ["node", "graphserver.js"]
