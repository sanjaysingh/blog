---
title: "Get all foreign key constraints in SQL Server database"
date: 2010-10-28 06:15:00 +0000
tags:
  - SQL Server
---

Often we need to get all the Foreign Key constraints so that you can drop them by making dynamic queries and then re-add them. This is usually needed when you are writing some custom data migration tool in which case you drop all the foreign key constraints first, then populate data, and then you add the constraints again.

 

Whatever be the use case, following SQL query will give you details of all the foreign key constraints in the active database:

 
```html
SELECT OBJECT_NAME(ForeignKeyColumn.Constraint_Object_ID) AS 'ForeignKey', OBJECT_NAME(ForeignKeyColumn.Parent_Object_ID) AS 'ForeighKeyTable', ParentColumn.name AS 'ForeighKeyColumn', OBJECT_NAME(ForeignKeyColumn.Referenced_Object_ID) AS 'PrimaryKeyTable', ReferencedColumn.Name AS 'PrimaryKeyColumn' 
FROM Sys.Foreign_Key_Columns ForeignKeyColumn
INNER JOIN Sys.All_Columns ParentColumn 
ON ForeignKeyColumn.Parent_Object_ID = ParentColumn.Object_ID
AND ForeignKeyColumn.Parent_Column_ID = ParentColumn.Column_ID
INNER JOIN Sys.All_Columns ReferencedColumn 
ON ForeignKeyColumn.Referenced_Object_ID = ReferencedColumn.Object_ID
AND ForeignKeyColumn.Referenced_Column_ID = ReferencedColumn.Column_ID 
ORDER BY OBJECT_NAME(ForeignKeyColumn.Referenced_Object_ID);
```