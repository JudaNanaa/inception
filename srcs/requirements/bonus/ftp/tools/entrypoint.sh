#!/bin/sh

# Enable error handling
set -e

# Create required directories with proper permissions
mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

# Create log file
touch /var/log/vsftpd.log
chmod 644 /var/log/vsftpd.log

# Create FTP user if it doesn't exist
if ! id "${FTP_USR}" >/dev/null 2>&1; then
    adduser -D -h /var/www/html "${FTP_USR}"
    echo "${FTP_USR}:${FTP_PWD}" | chpasswd
fi

# Set directory permissions
mkdir -p /var/www/html
chmod 755 /var/www/html
chown -R "${FTP_USR}:${FTP_USR}" /var/www/html

# Create vsftpd user list
touch /etc/vsftpd.userlist
echo "${FTP_USR}" > /etc/vsftpd.userlist
chmod 644 /etc/vsftpd.userlist

# Start vsftpd in foreground mode
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf