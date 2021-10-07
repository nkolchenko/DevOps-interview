# It is a good practice to _fix_ base image version, I randomly choose a latest for node14-alpine
FROM node:14.18-alpine3.11
# Some Node frameworks and libraries enable production optimization only with the NODE_ENV variable set to production.
ENV NODE_ENV production

WORKDIR /usr/src/app

# Installing app dependencies.
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Assuming that we are building the code for production, we can use a few optimisations here
RUN npm ci --only=production && npm cache clean --force

# Bundling app's source. I have the .dockerignore to cover us here
COPY . .

EXPOSE 3000
CMD [ "node", "server.js" ]