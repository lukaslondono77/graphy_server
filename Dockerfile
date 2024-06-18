# Use an official Node.js runtime as a parent image
FROM node:22.2-bookworm-slim

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to leverage Docker cache for npm install step
COPY package.json package-lock.json* ./

# Install any needed packages specified in package.json
RUN apt-get update && apt-get upgrade -y && npm install

# Copy the rest of the application code
COPY graphserver.js UScities.json ./

# Expose the port the app runs on
EXPOSE 4000

# Define the command to run the application
CMD ["node", "graphserver.js"]
