---
title: "ThreadAbortException&#58;Thread was being aborted in IIS 7"
date: 2011-03-06 23:41:00 +0000
tags:
  - WCF
---

Recently i was developing a WCF web service in IIS 7 on Windows Server 2008 and started getting this exception quite weirdly. Weirdly in the sense that the exception was not consistently being reported at the same call stack.

 

My web service was using App_Data to store some application specific data which was also being added/modified/deleted during runtime.

 

After doing a lot of searching and study, the behavior of writing to the App_Data turned out to be the culprit. It is really hard to guess what may be wrong. In fact, I learnt that heavily modifying application subdirectory shuts down the appdomain.

 

Following are two references that explain this thing - 

 

[http://blogs.msdn.com/b/toddca/archive/2005/12/01/499144.aspx](http://blogs.msdn.com/b/toddca/archive/2005/12/01/499144.aspx)

 

[http://forums.iis.net/t/1121400.aspx](http://forums.iis.net/t/1121400.aspx)

 

It seems that it has nothing to do with IIS 7 though and can happen even with IIS 6.