FROM alpine:3.20

WORKDIR /app

RUN apk update \
	&& apk add lighttpd php82 fcgi php82-cgi

EXPOSE 9000