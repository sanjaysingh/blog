---
title: "How to use gfix on Windows"
date: 2011-04-05 06:13:00 +0000
tags:
  - Firebird
---

gfix -user SYSDBA -password masterkey localhost:C:\MyDatabase.fdb -v -f
gfix is Firebird’s command line tool for administration issues like data repair, sweeping etc. Above is the syntax for how to use this tool on a Windows machine.

* gfix.exe is located in your Firebird installation directory.

* -v option in the above example specifies that we want to validate the database.

* -f options means full to mean all records and pages and release unassigned record fragments.

* localhost specifies that database is located on this machine only.

Following page has details of all the options that can be used with gfix.

[http://www.destructor.de/firebird/gfix.htm](http://www.destructor.de/firebird/gfix.htm)