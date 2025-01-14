FROM alpine:3.20

RUN apk update && apk add --no-cache \
    python3

WORKDIR /website

COPY web/ .

EXPOSE 8000

CMD ["python3", "-m", "http.server", "8000", "--bind", "0.0.0.0"]