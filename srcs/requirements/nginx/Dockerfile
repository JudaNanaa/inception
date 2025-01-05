FROM alpine:3.20

# Install Nginx, OpenSSL, and Socat
RUN apk add --no-cache nginx openssl socat

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Auto-generate SSL certificates with OpenSSL
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/selfsigned.key -x509 -days 365 -out /etc/nginx/ssl/selfsigned.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

# Copy Nginx configuration file
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
