FROM --platform=linux/x86_64 node:14.18.2-alpine

RUN apk add git python3 make g++ krb5-dev libressl-dev hugo && \
	ln -s $(which python3) /usr/local/bin/python

COPY . .

RUN npm install
RUN hugo version
CMD [ "npm", "build" ]