FROM --platform=linux/x86_64 node:14.18.2-alpine

RUN apk add git python3 make g++ krb5-dev libressl-dev hugo nginx && \
	ln -s $(which python3) /usr/local/bin/python

WORKDIR /blog

COPY . .

RUN npm install
RUN npm run build

COPY ./docker/default.conf /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]