---
title: "Check if given table or stored procedure exists in SQL Server database"
date: 2010-10-29 05:40:00 +0000
tags:
  - SQL Server
---

Following SQL statement can be used to check if stored procedure named “SelectEmployee” exists in the active database and drop it if exists.

```html
IF EXISTS (SELECT SystemObjects.Name
FROM SYS.OBJECTS SystemObjects 
WHERE SystemObjects.type = 'p' AND SystemObjects.Name = 'SelectEmployee')
BEGIN
DROP PROCEDURE SelectEmployee
END
```

Following SQL statement can be used to check if table name “Employee” exists in the database and drop it if exists.

```html
IF EXISTS (SELECT * FROM Sys.Tables
WHERE name = 'Employee')
BEGIN
DROP TABLE Employee;
END
```