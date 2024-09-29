# Use an official Node.js image as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json for installing dependencies
COPY ../react-and-spring-data-rest/package*.json ./

# Install the dependencies
RUN npm install

# Copy the frontend code into the container
COPY ../react-and-spring-data-rest/src/js/ ./src/js/

# Build the React app
RUN npm run build

# Serve the built app with a static server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose the port to run the app on
EXPOSE 3000
