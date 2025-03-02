---
title: "Check if given column exists in a table in SQL Server database"
date: 2010-10-29 05:24:00 +0000
tags:
  - SQL Server
---

Following SQL statement checks to see if column “Address” exists in the “Employee” table. If the column does not exist it adds that column.

 
```html
If Not Exists (Select * From Information_Schema.Columns 
               Where Table_Name = 'Employee' And Column_Name = 'Address')
Begin
    Alter Table Employee Add Address nvarchar(200)
End
```