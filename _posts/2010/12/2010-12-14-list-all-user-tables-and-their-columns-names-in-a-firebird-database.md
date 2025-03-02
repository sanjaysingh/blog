---
title: "List all user tables and their columns names in a Firebird database"
date: 2010-12-14 07:34:00 +0000
tags:
  - Firebird
---

Following SQL query gives list of all the table names and their column names in a Firebird database.

 
```html
SELECT Relations.RDB$RELATION_NAME "Table Name", Fields.RDB$FIELD_NAME "Column Name" FROM RDB$RELATION_FIELDS Fields
JOIN RDB$RELATIONS Relations ON
Fields.RDB$RELATION_NAME = Relations.RDB$RELATION_NAME
WHERE
(Relations.RDB$SYSTEM_FLAG IS NULL OR Relations.RDB$SYSTEM_FLAG = 0)
AND
(Relations.RDB$VIEW_BLR IS NULL)
ORDER BY 1;
```

As noted before, RDB$System_Flag is used to filter out user tables as against system tables and RDB$View_BLR is used to filter Views.