Backup Container
This container automates the backup of your MariaDB database and WordPress files at regular intervals using a Bash script and cron job.

Features
Automated Backups: Periodically backs up the MariaDB database and WordPress files.
Customizable Schedule: Configure the frequency of backups via cron.
Retention Policy: Automatically deletes backups older than a specified number of days.
Prerequisites
Docker installed on your system.
Running MariaDB and WordPress containers with accessible volumes.

Restoring Backups
To restore a backup:

Locate the desired backup files in your backup directory.

Use mysql to restore the database:

mysql -h mariadb_host -u your_db_user -p your_db_name < /path/to/db_backup.sql

tar -xzf /path/to/wp_backup.tar.gz -C /path/to/wordpress/html
