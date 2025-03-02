---
title: "SQL Server Express – Error Installing MSXML 6.0"
date: 2010-10-26 08:25:00 +0000
tags:
  - SQL Server
---

This is one of the most common errors occurring when installing SQL Server Express 2005. This error occurs in different scenarios on different machine configurations. 

One solution that works in all or most of the cases is to uninstall MSXML 6.0 and then install SQL Server. But this solution is not trivial either. Because, you cannot uninstall MSXML 6.0 from add/remove programs. Microsoft had published an utility called (msicuu2.exe) but they have recently removed this utility and I could not find any reliable source to download it from.

There is however a tool [msizap](http://msdn.microsoft.com/en-us/library/aa370523(VS.85).aspx) that you can download and then use the following command to uninstall MSXML 6.0.

**MsiZap T! {1A528690-6A2D-4BC5-B143-8C4AE8D19D96}**

**

**

If you package SQL Server with you application, then you can put this command in the batch file and even automate this process.

There is also scenario where above command does not work. In that case i would suggest using some Install Cleanup utility. One of the tools that i have used and works quite well is [Your Uninstaller.](http://www.ursoftware.com/download.php)