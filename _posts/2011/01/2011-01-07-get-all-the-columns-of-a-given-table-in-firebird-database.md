---
title: "Get all the columns of a given table in Firebird database"
date: 2011-01-07 07:39:00 +0000
tags:
  - Firebird
---

Following sql script gives all the columns of a given table (‘Employee’ in this example) in a Firebird database.

 
```html
SELECT Fields.RDB$FIELD_NAME "Column Name" FROM RDB$RELATION_FIELDS Fields
WHERE Fields.RDB$RELATION_NAME = 'EMPLOYEE' and Fields.RDB$SYSTEM_FLAG = 0
ORDER BY Fields.RDB$FIELD_POSITION
```