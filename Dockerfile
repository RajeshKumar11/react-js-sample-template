# Use the official Node.js image to build the React app
FROM node:16-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the React app files to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Use Node.js for serving the app
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Install 'serve' globally
RUN npm install -g serve

# Copy the build output from the previous stage
COPY --from=build /app/build ./build

# Expose the port on which the app will run
EXPOSE 3000

# Start the app using 'serve'
CMD ["serve", "-s", "build", "-l", "3000"]
