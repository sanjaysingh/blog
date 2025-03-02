---
title: "List all tables in SQL Server database"
date: 2010-10-28 05:20:00 +0000
tags:
  - SQL Server
---

Following SQL query gives you names of all the tables in the currently active database:

 
```html
SELECT Name FROM Sys.Tables
```