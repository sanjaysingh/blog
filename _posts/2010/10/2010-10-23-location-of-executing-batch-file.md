---
title: "Location of executing batch file"
date: 2010-10-23 08:20:00 +0000
tags:
  - Batch Script
---

Often in the batch script we need to change to the directory from where the batch file is executing. Mainly when you are shipping the batch file with your application, you may want to launch some executable from the batch file, for example. So, if you put batch file where the executable is, following batch script will do the job for you:
**cd %~dp0****MyApplication.exe**
First statement changes current directory to the location of batch file and then second statement launches the application.