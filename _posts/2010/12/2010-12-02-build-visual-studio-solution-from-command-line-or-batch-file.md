---
title: "Build Visual Studio solution from command line or batch file"
date: 2010-12-02 08:11:00 +0000
tags:
  - C#
  - Batch Script
---

Following simple batch file can be used to build a solution in Visual Studio 2010. Here I use devenv.exe to build the solution from command line so that we get the same behavior as if building from IDE. Save below given batch script into a .bat file, update the solution file path and you are all set to build.

 
```html
echo off

call "C:\Program Files\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
devenv "C:\SampleWinApplication\SampleWinApplication.sln" /build

pause
```

vcvars32.bat sets up environment for Visual Studio Tools. Note that this same batch file is called when you invoke Visual Studio command prompt (Start->Programs->Microsoft Visual Studio 2010->Visual Studio Tools—>Visual Studio Command Prompt (2010). This is important to correctly invoke devenv from command line.