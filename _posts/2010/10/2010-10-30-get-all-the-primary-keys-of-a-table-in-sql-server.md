---
title: "Get all the Primary Keys of a table in SQL Server"
date: 2010-10-30 08:50:00 +0000
tags:
  - SQL Server
---

Following SQL query can be used to list all the primary keys of a table. In this given example, we assume that table name is ‘Employee’.

 
```html
SELECT SysColumns.Name
FROM SysIndexes SysIndexes
JOIN SysObjects SysObjects ON SysIndexes.Id = SysObjects.Id
JOIN SysObjects PrimaryKey ON SysIndexes.Name = PrimaryKey.Name
AND PrimaryKey.Parent_Obj = SysIndexes.Id
AND PrimaryKey.Xtype = 'PK'
JOIN SysIndexKeys SysIndexKeys on SysIndexes.Id = SysIndexKeys.Id
AND SysIndexes.IndId = SysIndexKeys.IndId
JOIN SysColumns SysColumns ON SysIndexKeys.Id = SysColumns.Id
AND SysIndexKeys.ColId = SysColumns.ColId
WHERE SysObjects.name = 'Employee'
ORDER BY SysIndexKeys.keyno
```