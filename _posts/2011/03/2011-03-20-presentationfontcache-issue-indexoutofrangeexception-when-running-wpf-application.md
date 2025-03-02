---
title: "PresentationFontCache issue – IndexOutOfRangeException when running WPF application"
date: 2011-03-20 23:43:00 +0000
tags:
  - WPF
---

A few days back, I came across this IndexOutOfRangeException with PresentationFontCache when running our WPF application on a Windows 7 machine. I tried disabling and enabling .NET framework from Add/Remove components but nothing seemed to fix this.

 

PresentationFontCache service optimizes performance of WPF applications by caching commonly used font data.

 

One of the following two fixes seem to work for different peoples.

 
1. PresentationFontCache data is stored at [Windows]\ServiceProfiles\LocalService\AppData\Local\FontCache*.dat. Some of the guys have fixed this problem after deleting this file from here and restarting **Windows Presentation Font Cache** service.  Disabling Windows Presentation Font Cache service worked for me. I don’t know why but just stopping the service did not work for me.

 

Refer to following thread for some more discussions - 

 

[http://social.msdn.microsoft.com/Forums/en/wpf/thread/2e47b80a-1423-466f-873a-8536a64ebe3c](http://social.msdn.microsoft.com/Forums/en/wpf/thread/2e47b80a-1423-466f-873a-8536a64ebe3c)