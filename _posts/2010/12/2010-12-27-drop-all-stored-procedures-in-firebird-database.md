---
title: "Drop all stored procedures in Firebird database"
date: 2010-12-27 07:47:00 +0000
tags:
  - uncategorized
---

In my last post, I gave the SQL script to delete all stored procedures from a SQL Server database. Following is the link to post - 

 

[http://www.sanjaysingh.net/2010/12/drop-all-stored-procedures-from-sql.html](http://www.sanjaysingh.net/2010/12/drop-all-stored-procedures-from-sql.html)

 

Now, following SQL script can be used to delete all the stored procedures from a Firebird database.

 
```html
SET TERM ^ ;
EXECUTE BLOCK
AS
DECLARE procName varchar(100);
begin

FOR SELECT rdb$Procedure_name FROM rdb$procedures WHERE rdb$system_flag IS NULL OR rdb$system_flag = 0 INTO :procName
    DO
    begin
        EXECUTE STATEMENT 'DROP PROCEDURE ' || procName;
    end
end^

SET TERM ; ^
```