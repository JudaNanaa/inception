# Use Alpine Linux 3.20 as the base image
FROM alpine:3.20

# Install vsftpd and other dependencies
RUN apk update && apk add vsftpd

# Create a new user and set a password
RUN adduser -D ftpuser && echo "ftpuser:test" | chpasswd

RUN mkdir -p /home/ftpuser/ftp && chown -R ftpuser:ftpuser /home/ftpuser/ftp

# Modify vsftpd.conf for local user authentication
RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf && \
    echo "user_sub_token=$USER" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_root=/home/$USER/ftp" >> /etc/vsftpd/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf

# Expose the FTP port
EXPOSE 21

# Run vsftpd in the foreground
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
