---
title: "List all user table names in Firebird"
date: 2010-12-14 06:48:00 +0000
tags:
  - Firebird
---

Following SQL query will give you names of all the user defined tables in a Firebird database.

 
```html
SELECT rdb$relation_name AS "Table Name"
FROM rdb$relations
WHERE rdb$view_blr IS NULL AND (rdb$system_flag IS NULL OR rdb$system_flag = 0);
```

rdb$system_flag of 0 or NULL identifies a user table or view and rdb$view_blr being NULL identifies that it is a TABLE.