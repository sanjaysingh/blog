---
title: "AspNet Core&#58; Appsettings from environment variables gotcha"
date: 2017-07-04 11:10:00 +0000
tags:
  - uncategorized
---

Changes to environment variables are not refreshed until you restart the Visual Studio. This can be frustrating if you make some change and expect it to reflect in the application.

This is not new to AspNet core but rather a generic Visual Studio (or any Windows Process for that matter) behavior but it is more visible in the AspNet core because Environment Variables configuration is initialized by default and it is easy to forget the gotcha of restarting. Re-running the application does not help.