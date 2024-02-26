# Database Backups

## Back up the entire database
[4.5.4 mysqldump - A Database Backup Program](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html)
```
$ mysqldump -u root -h obsidian.lan --port=3306 -p cgc_certificate_tracker > 12_12_2023_backup.sql
Enter password:
```

## Import the database from a backup file
[How to import an SQL file using the command line in MySQL?](https://stackoverflow.com/a/17666279)
```
$ mysql -u root -h obsidian.lan --port=3306 -p cgc_certificate_tracker < 12_12_2023_backup.sql
Enter password:
```
