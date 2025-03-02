---
title: "Forcefully delete a service"
date: 2010-10-24 08:38:00 +0000
tags:
  - uncategorized
---

I needed that when i saw that even after i had uninstalled SQL Server from my machine, the service was still showing in Windows services. This is a sign that SQL was not uninstalled correctly and some of the pieces are still lying around. In this case you have to manually delete the service and do the file system and registry cleanup.

 

Windows has a command line utility called “sc” (I assume it stands for Service Controller) that gives us the APIs to talk to Windows services. Following command deletes SQLExpress service from the computer, for example.

 

**sc delete MSSQL$SQLExpress**

 

To know the actual name of the service, you can go to the properties (Right click and select properties) of that service from Windows Services window (Start—>Run—>Services.msc) and check the service name.