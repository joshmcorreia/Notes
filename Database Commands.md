A list of useful database commands.

---
# SQL:
Note: SQL commands are not case sensitive; `CREATE` is the same as `create`

### Create a database:
```
CREATE DATABASE my_project;
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

### Delete a table:
```
DROP People;
```

### Add to a table:
```
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
```

### Replace the values in a table:
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
