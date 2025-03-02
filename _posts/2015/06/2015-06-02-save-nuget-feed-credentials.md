---
title: "Save nuget feed credentials"
date: 2015-06-02 08:10:00 +0000
tags:
  - uncategorized
---

When working we custom Nuget feeds that require authentication, Visual Studio keeps prompting for user name and passwords and you are not able to save the password. This is really frustrating. You can run following command to save your credentials to the nuget.config file.

nuget sources update -name "My Feed Name" -source "[https://nuget.sanjaysingh.net/PackageFeeds/Stable/nuget](https://nuget.ext.geicoddc.net/PackageFeeds/Stable/AIM/nuget)" -UserName "dev\sanjay" -Password "password"

Ensure that you have nuget.exe downloaded and your PATH variable is updated with its directory. You can download nuget.exe from following location.

[https://www.nuget.org/nuget.exe](https://www.nuget.org/nuget.exe)

This command updated the machine wide config which is located at %APPDATA%\NuGet\NuGet.Config