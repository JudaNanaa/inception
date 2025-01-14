FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/

COPY tools/ftp.sh /home/

RUN chmod +x /home/ftp.sh

CMD [ "/home/ftp.sh" ]