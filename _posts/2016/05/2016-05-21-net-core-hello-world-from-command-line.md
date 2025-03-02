---
title: ".Net Core - Hello World from command line"
date: 2016-05-21 21:26:00 +0000
tags:
  - .net
  - dotnet
  - dotnetcore
  - .netcore
---

.Net Core is now RC2 and is hopefully going to be stable and not see major changes. Some very basic developmental structural changes happened across RC1 and RC2 so this is never guaranteed though. RC2 has much cleaner and consistent (with other programming languages) development experience which usually is something like following.

1. Download and install the language
2. Create a program
3. Compile and run it

You can follow these steps below to get up and running with your first .Net core Hello World project.

1. Download and install .Net core from [https://www.microsoft.com/net/core#windows](https://www.microsoft.com/net/core#windows)
2. Open command prompt and create a new directory and 'cd' to that directory
3. Create a new .Net core project in the 'newproject' directory that we created above.
4. Restore all the dependencies for the project
5. Compile and run

That is all. You have your first .Net Core Hello World! program up and running.

I have created a [chocolatey ](https://chocolatey.org/)pacage so that .Net core SDK can be installed from command like itself. This package is located [here](https://chocolatey.org/packages/dotnetcoresdk/1.0.0-RC2).

With chocolatey, the steps then become as follows.

1. Install .Net core. Note the -pre that is required because it is a prelease version of .net core. It will install latest .Net core which is RC2 as of this post. This installs .net core and updates the PATH so that 'dotnet' command is available from the command prompt.
2. Refresh PATH for current command prompt session. Chocolatey comes up with pretty neat command for this.
3. Create a new project directory and go to that directory
4. Create new project
5. Restore all the dependencies for the project
6. Compile and run

That's it. You have a.net core application running while never had to leave the command prompt.