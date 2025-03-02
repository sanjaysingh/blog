---
title: "Get all the stored procedures and their definitions in SQL Server"
date: 2010-10-28 05:41:00 +0000
tags:
  - SQL Server
---

Following SQL query will list all the stored procedures and their definition in the active database:

 
```html
SELECT SysObject.Name, SysModule.Definition
FROM Sys.Objects SysObject INNER JOIN Sys.Sql_Modules SysModule
ON SysObject.Object_ID = SysModule.Object_ID
WHERE SysObject.Type = 'p'
ORDER BY SysObject.Name;
```