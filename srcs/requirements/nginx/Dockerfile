FROM alpine:3.20

WORKDIR /app

RUN apk update \
	&& apk add nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]