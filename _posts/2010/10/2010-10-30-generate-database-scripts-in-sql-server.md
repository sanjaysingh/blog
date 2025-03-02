---
title: "Generate database scripts in SQL Server"
date: 2010-10-30 20:02:00 +0000
tags:
  - SQL Server
---

SQL Server gives a very useful tool ‘Database Publish Wizard’ that can be used to script and publish SQL Server database. For SQL Server 2005 installation, this tool is usually located at **[Program Files]\Microsoft SQL Server\90\Tools\Publishing\SqlPubWiz.exe. **This tool has both command line as well as GUI interface.

Here I am going to show some sample command line queries that can be used to generate database scripts. For the sake of example, let us assume that database name is “MyDatabase” which is hosted on SQL Server instance “SQLEXPRESS” on the local machine.

Following command will give you script for schema (not data) of the database. The script is output to a text file C:\Script.txt.

```
SqlPubWiz.exe script -S .\SQLEXPRESS -d MyDatabase -schemaonly -f C:\Script.txt
```

Option “-S” specifies the SQL Server instance. Options “-d” specifies the database to script. Options “-schemaonly” specifies that we want to script only schema. Options “-f” specifies the output file.

SqlPubWiz by default works in windows authentication mode. So if your Server does not allow for windows authentication, you will also need to specify user name and password with “-U” and “-P” option respectively.

In the same way as above command, following command will generate script for all the data of the database. It will not contain any schema script.

```
SqlPubWiz.exe script -S .\SQLEXPRESS -d MyDatabase -dataonly -f C:\Script.txt
```

We can even use Management Studio to generate database scripts (Right click database, select Task and then select Generate Scripts). However, there is no options in management studio to generate “dataonly” scripts in which case this tool comes handy.