---
title: "Embedded Databases For Windows"
date: 2010-10-26 07:17:00 +0000
tags:
  - ITTIA DB
  - SQLCE
  - SQLite
  - Scimore DB
  - VistaDB
  - MySQL
  - Embedded Database
  - Firebird
---

An embedded database is a database management system (DBMS) which is tightly integrated with an application software. They do not require any separate installation and are hidden from the end user.

I recently consulted on a project to replace SQL Server with a lightweight embedded database. We had however kept our option open and were also looking at databases with less installation hiccups – the main motivation to get rid of SQL Server.

There are many embedded databases available today and to filter out the one you need its important to have some criteria. Following are the list of things we were looking for in the target database:

* No Installation Required (Preferably)

* SQL based.

* Performance should be as good as possible to SQL Server.

* RDBMS (So that we have less overhead when migrating from SQL Server)

* **Can work in Server as well as embedded mode.**

* Supports Stored Procedures (Not mandatory but good to have)

* Has .NET data access API.

* Costs reasonable for desktop applications with unlimited installation.

* Some renowned companies using them. This is to judge the stability.

* Easy migration path from SQL Server

Many of the requirements as you can see are for the sake of less overhead when we migrate from SQL Server. I went through many databases to find the one we needed. Many of the databases did not fit into our criteria just because they were not RDBMS or they didn’t have .NET APIs. Following databases are either non RDBMS or don’t have .NET APIs:

* MongoDB

* Casandra

* CouchDB

* Apache Derby

* Raima Database Manager

* SolidDB

* Oracle Berkley DB

* Valentina DB (ORDBMS)

* Informix Dynamic Server

Now, i will discuss the ones i really looked into.

* Firebird 

* Both embedded and server flavors.

* RDBMS

* Has .NET data provider APIs.

* Stable. Built on the InterBase source code.

* Used by many companies. Lots of resources available on the web.

* Switching between server and embedded version mostly require change of connection string only.

* Supports stored procedures.

* Supports standard SQL.

* Performance is close to SQL Server.

* Open Source. Free for development and distribution.

Scimore DB

* Both embedded and server flavors. In the embedded version, they can even be configured to run in-process and out-of-process.

* RDBMS.

* Has .NET data provider APIs.

* Not very stable.

* No big name associated. Tough to find resources on the web.

* Switching between server and embedded mostly require change of connection string only.

* Supports stored procedures.

* Supports standard SQL.

* Performance is close to SQL Server.

* Free for development and distribution. Source code is also available at reasonable cost.

Elevate DB

* Both embedded and server flavors.

* RDBMS.

* Has .NET APIs.

* Supports stored procedures.

* Support standard SQL.

* No big names associated.

* Performance is slower than SQL Server.

ITTIA DB

* Embedded and server flavors.

* RDBMS

* Has .NET APIs.

* No stored procedures (It was supposed to be coming soon, i haven’t checked)

* Supports standard SQL.

* No big names associated.

* Performance is slower than SQL Server.

Effiproz

* Only embedded.

* RDBMS

* Has .NET APIs.

* Supports stored procedures.

* Free (MSPL)

SQL CE

* Only embedded

* RDBMS

* Has .NET APIs

* No stored procedures

* Free for distribution

* Supports standard SQL

* Performance of SELECT queries is considerably slower than SQL Server for large databases.

SQLite

* Only embedded

* RDBMS

* Has .NET APIs

* No stored procedures.

* Free for development and distribution

* Supports standard SQL

* Many big companies using it. Stable.

* Performance of SELECT queries is slower than SQL Server for large databases.

Vista DB

* Only embedded

* RDBMS

* Has .NET API. In fact, the database itself is in managed code.

* Supports stored procedures.

* Supports standard SQL.

* Performance is slower than SQL Server.

Empress Embedded Database

* Only embedded.

* RDBMS.

* Has .NET APIs.

* Supports stored procedure.

* Supports standard SQL

* Performance is slower than SQL Server.

InterBase

* Embedded edition only ideal for MySQL

* Not embedded

* RDBMS

* Has .NET API

* Supports stored procedures

* Supports standard SQL

* Performance is close to SQL Server.

* Not free when your application is not open.

Note that some databases might have enhanced their features so i would also suggest to check their latest set of supported features for any enhancements they might have come up with.