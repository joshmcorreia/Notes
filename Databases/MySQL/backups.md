# Database Backups

## Back up the entire database
[4.5.4 mysqldump - A Database Backup Program](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html)
```
$ mysqldump -u root -h obsidian.lan --port=3306 -p cgc_certificate_tracker > 12_12_2023_backup.sql
Enter password:
```
