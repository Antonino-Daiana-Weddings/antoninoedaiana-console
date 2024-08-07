# Use an official Node runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in package.json
RUN npm install

# Build the project for production
RUN npm run build

# Install `serve` to serve your app on port 5000
RUN npm install -g serve

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run `serve` to serve the build directory
CMD ["serve", "-s", "dist", "-l", "5000"]