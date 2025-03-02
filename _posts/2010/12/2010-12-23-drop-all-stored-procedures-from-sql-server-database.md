---
title: "Drop all stored procedures from SQL Server database"
date: 2010-12-23 07:50:00 +0000
tags:
  - SQL Server
---

Following SQL script drops all user stored procedures from a SQL Server database.

 
```html
USE TestDatabase

DECLARE @CurrStoredProcedureName SYSNAME
DECLARE StoredProceduresCursor CURSOR FOR
    SELECT name FROM sys.objects WHERE type = 'P'

OPEN StoredProceduresCursor
FETCH NEXT FROM StoredProceduresCursor INTO @CurrStoredProcedureName
WHILE @@FETCH_STATUS = 0
BEGIN
    EXECUTE('DROP PROCEDURE ' + @CurrStoredProcedureName)
    FETCH NEXT FROM StoredProceduresCursor INTO @CurrStoredProcedureName
END

CLOSE StoredProceduresCursor
DEALLOCATE StoredProceduresCursor

GO
```

Replace database name with your database name in the above script. Mainly we are doing following two things:

1. Get all the user stored procedures in a CURSOR.
2. Loop through the cursor, build a DROP PROCEDURE query for each stored procedure and execute it.