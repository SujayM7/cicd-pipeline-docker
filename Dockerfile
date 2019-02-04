FROM node:carbon  /*fromwhich server*/
WORKDIR /usr/src/app
COPY package*.json ./ /*Ex:POM file in JAVA*/
RUN npm install /*installing into the imaga*/
COPY . .  /*copying from the machine to the inage* can give/
Expose 8080
CMD ["npm"."start"] /*basic command to run thr application*/
