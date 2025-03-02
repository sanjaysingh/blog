---
title: "What Firebird assemblies to ship with embedded Firebird .NET App?"
date: 2011-01-30 20:25:00 +0000
tags:
  - Firebird
---

For a .NET application that uses embedded Firebird, I would suggest to ship all of the following with you .NET app.

 
1. All the *.dll in the embedded Firebird directory. Downloaded Firebird embedded zip file from Firebirdsql.org if you have not already downloaded. To be precise, following are the assemblies with respect to v2.5 of Firebird.
2. **intl **and **udf **directory. Both of these directory should be there in Firebird embedded zip file you downloaded.

 

Note that all of these files/folders mentioned above should be at the exe location of your .NET application. Some of these assemblies might not be used at all in the application, but i found issues when i only shipped fbembedd.dll. Shipping all of the stuff mentioned above has been quite stable.