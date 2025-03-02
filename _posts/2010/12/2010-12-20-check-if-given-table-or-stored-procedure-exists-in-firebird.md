---
title: "Check if given table or stored procedure exists in Firebird"
date: 2010-12-20 03:03:00 +0000
tags:
  - Firebird
---

Following SQL checks to see if table named Employee exists in the database and if it does, drops it.

 
```python
SET TERM ^ ;
EXECUTE BLOCK AS BEGIN
if (exists(select 1 from rdb$relations where rdb$relation_name = 'EMPLOYEE')) then 
execute statement 'drop table employee;';
END^
SET TERM ; ^
```

Note that conditional operator IF cannot be used outside of PSQL so we have to place this call inside BLOCK as shown above. Also we cannot put DDL statements inside PSQL, so above thing cannot even be placed inside stored procedure.In the same way, following SQL checks to see if stored procedure Sel_Employee exists and drops it if it does.

```python
SET TERM ^ ;
EXECUTE BLOCK AS BEGIN
if (exists(select 1 from RDB$PROCEDURES where rdb$Procedure_name = 'SEL_EMPLOYEE')) then 
execute statement 'drop procedure SEL_EMPLOYEE;';
END^
SET TERM ; ^
```