---
title: "List all stored procedures in a Firebird database"
date: 2010-12-14 07:05:00 +0000
tags:
  - Firebird
---

Following SQL query gives you all the user define stored procedures in a Firebird database.

 
```html
SELECT rdb$Procedure_name as "Procedure Name" FROM rdb$procedures
WHERE rdb$system_flag IS NULL OR rdb$system_flag = 0;
```