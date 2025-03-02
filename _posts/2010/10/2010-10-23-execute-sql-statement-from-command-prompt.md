---
title: "Execute SQL statement from command prompt"
date: 2010-10-23 07:54:00 +0000
tags:
  - SQL Server
---

Many a time we run into requirement of executing simple SQL scripts using command prompt. Microsoft gives us a utility called "sqlcmd" just for that.
Following is a very simple query executed using this tool:
**sqlcmd -S .\SQLEXPRESS -E -Q "Drop Database SampleDB"**
Where SampleDB is the database name i want to drop, -S switch specifies the server instance, -E switch specifies that i want to use trusted connection and -Q switch specifies the SQL query i want to execute.
This tool is quite powerful and there are several switches that you can use to meet different requirements.  You can open command prompt and see help (sqlcmd /?) for all the different switches that it supports.