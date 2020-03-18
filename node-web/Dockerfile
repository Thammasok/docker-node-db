FROM node:12.16.1

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add /usr/src/app/node_modules/.bin to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json

RUN npm install

COPY . /usr/src/app

RUN npm run build

# start app
CMD ["node", "./service/app.js"]