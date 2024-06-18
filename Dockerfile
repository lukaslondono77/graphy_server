# Use an official Node.js runtime based on Alpine Linux
FROM node:22.2-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY graphserver.js UScities.json ./

# Expose the port the app runs on
EXPOSE 4000

# Define the command to run the application
CMD ["node", "graphserver.js"]
