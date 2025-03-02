---
title: "Secure Web Application Practices - HTTP Headers"
date: 2016-01-29 08:37:00 +0000
tags:
  - uncategorized
---

HTTP Headers play a very important role in security of a web application. Some of the headers pose a security risk and so should be removed while others help prevent against different kinds of attacks so should be added.

Following are same best practices with respect to HTTP headers.

1. Remove headers revealing too much information about server. Revealing information about server increases your attack surface and makes the attacker job easier in case a vulnerability is found on the given server. These headers usually do not add any value to the application so they should better be turned off. Following are some headers for Aspnet MVC application that can safely be stripped.

X-AspNet-Version

```
>
  httpRuntime enableVersionHeader="false" />
system.web>
```

```
X-AspNetMvc-Version
**
**X-Powered-By
Server
```

1. **
**

###