---
title: "SQL Server - Windows Installer Service Error (Error Code 1601)"
date: 2010-10-27 05:08:00 +0000
tags:
  - SQL Server
---

Sometimes, you get this error when installing SQL Server 2005. Following is what has fixed the issue for me:

 
 * Go to windows services (Start->Run->services.msc) and start Windows Installer service if it is not already started.  If you are not able to start Windows Installer service, run **msiexec /regserver **command from command prompt.