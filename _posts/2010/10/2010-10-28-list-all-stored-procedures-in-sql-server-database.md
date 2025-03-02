---
title: "List all stored procedures in SQL Server database"
date: 2010-10-28 05:28:00 +0000
tags:
  - SQL Server
---

Following SQL query gives you names of all the stored procedures in the active database:

 
```html
SELECT SystemObjects.Name
FROM SYS.OBJECTS SystemObjects 
WHERE SystemObjects.type = 'p' 
ORDER BY SystemObjects.Name;
```