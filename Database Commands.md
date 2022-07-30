A list of useful database commands.

---
# SQL:
Note: SQL commands are not case sensitive; `CREATE` is the same as `create`

### Create a database user:
```
CREATE USER 'josh'@'localhost' IDENTIFIED BY 'my_new_password';
```

### Set a database user password:
```
SET PASSWORD FOR 'josh'@'localhost' = 'my_new_password';
```

### Create a database:
```
CREATE DATABASE my_project;
```

### List all databases:
```
SHOW DATABASES;
```

### Use/open a database:
```
USE my_project;
```

### Print a table's contents:
```
SELECT * FROM People;
```

### Pretty print a table's contents:
```
SELECT * FROM People \G
```

### Delete all entries in a table:
```
DELETE FROM People;
```
or
```
TRUNCATE People;
```

### Create a table:
[Source](https://www.w3schools.com/mysql/mysql_create_table.asp)
```
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
```

### Delete a table:
```
DROP People;
```

### Add to a table:
```
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
```

### Update the values in a table:
```
UPDATE Person SET FirstName="John" WHERE LastName="Smith";
```

### Replace the values in a table:
Note: This is similar to an UPDATE except it won't error out if the row doesn't exist yet, and will create it instead
```
REPLACE INTO table_name (column1, column2) VALUES (value1, value2);
```

### Add constraints/validation to fields in a table:
Note: the `CHECK` field needs to be added at the end of the table, it can't be in the middle
```
CREATE TABLE Persons (
    Age int,
    CHECK (Age >= 18)
);

OR

CREATE TABLE Persons (
    UserID VARCHAR(128),
    CHECK (length(UserID) >= 3)
);
```
