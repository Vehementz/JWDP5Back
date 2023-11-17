# Use an official Node runtime as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source inside the Docker image
COPY . .

# Set a non-root user and switch to it
RUN adduser -D nonrootuser
USER nonrootuser

# Your app binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 45500

# Define the command to run your app using CMD which defines your runtime
CMD [ "node", "server.js" ]