---
title: "Large file transfer in WCF  in IIS 7 - There was no endpoint listening at xxx that could accept the message"
date: 2011-03-10 08:05:00 +0000
tags:
  - uncategorized
---

I had hosted a WCF web service on IIS 7 that needed to transfer large files (~100 MB) to and from the service. I had all of **maxReceivedMessageSize, maxBufferSize, maxItemsInObjectGraph, maxRequestLength **configured to sufficiently large values, but still i was getting above mentioned exception when transferring greater than 30 MB files.

 

In IIS 7, there is one more setting called maxAllowedContentLength which is by default 30000000 byte (just over 28 MB). You need to tweak this value according to your need. Following snippet shows where it should be placed in the web.config file.

 
```html

  
    
      
        
      
    
  

```

 
This setting is not directly available from IIS manager, so if you need to change this using GUI tool you can download [IIS 7.0 Admin Pack.](http://www.iis.net/download/AdministrationPack) You will find this setting from selecting your website and then going to Request Filtering –> Edit Feature Settings –> Maximum allowed content length (Bytes).