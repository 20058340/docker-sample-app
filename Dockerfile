# Use official Node.js runtime as a base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 8080
EXPOSE 8080

# Start the app
CMD ["node", "app.js"]

