---
title: "List all Default constraints of a table in SQL Server"
date: 2010-10-30 08:09:00 +0000
tags:
  - SQL Server
---

Following SQL query can be used to list all the default constraints of a tabled named ‘Department’:

 
```html
SELECT DefaultConstraints.Name 'Constraint Name', DefaultConstraints.Definition 'Default Value' 
FROM Sys.Default_Constraints DefaultConstraints INNER JOIN Sys.Objects SystemObjects 
On SystemObjects.Object_Id = DefaultConstraints.Parent_object_Id
Where SystemObjects.Name = 'Department'
```