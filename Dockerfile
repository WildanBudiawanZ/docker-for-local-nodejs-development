# Use small base image with nodejs 10
FROM node:10.13-alpine

# set current work dir
WORKDIR /my-app

# Copy package.json, packge-lock.json into current dir
COPY ["package.json", "package-lock.json*", "./"]

# install dependencies
RUN npm i
RUN npm install --global nodemon
RUN chown -R node:node node_modules
# copy sources
COPY . .

# open default port
EXPOSE 3000

# Run app
CMD ["node", "start"]