---
title: "SQL Server Setup cannot install files to compressed or encrypted folder"
date: 2010-10-27 05:02:00 +0000
tags:
  - SQL Server
---

This SQL Server installation error occurs when you have applied compression on the installation folder. To fix this issue do the following:

 
1. Right click [Program Files]\Microsoft SQL Server  Go to properties.  Uncheck ‘Compress contents to save disk space’. This option is at different places on XP and Vista (Win 7) machines. But you should be able to find this from this screen.