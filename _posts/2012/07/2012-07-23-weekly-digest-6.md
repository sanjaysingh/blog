---
title: "Weekly digest #6"
date: 2012-07-23 00:03:00 +0000
tags:
  - uncategorized
---

[Mutexes, Semaphores, Monitors, ReaderWriterLocks, AutoResetEvents & ManualResets oh my, Abhijeet Patel:](http://geekswithblogs.net/abhijeetp/archive/2012/07/15/mutexes-semaphores-monitors-readerwriterlocks-autoresetevents--manualresets-oh-my.aspx) Up until a few years ago, mainstream programming for the most part did not involve asynchrony and/or parallelism except for the most performance demanding applications. In the multi core world we live in today async and parallel programming have become common place. Libraries such as TPL which provide first class framework level support and keywords like async/await built on TPL provide language support for writing elegant asynchronous code. Win8 Metro style apps built on the WinRT programming model is inherently async to help keep Metro style UIs responsive and fluid. As easy as it might appear to write async programs using these new features we should not forget our roots and the primitive constructs in the .NET framwework that TPL uses behind the scenes. This post provides a quick primer on the synchronization primitives that exist in the framework and the use cases of ech of them.

 

[.NET Memory Management Basics, Chris Farrell:](http://www.simple-talk.com/dotnet/.net-framework/.net-memory-management-basics/) .NET memory management is designed so that the programmer is freed from the chore of consciously having to allocate and dispose of memory resources. It is optimized to work best with the most common patters of usage. However, the more conscious you become of scalability and performance, the more useful an understanding of NET memory management becomes.

 

[MODEL BINDING WITH ASP.NET 4.5 AND VISUAL STUDIO 2012, Jalpesh P. Vadgama:](http://weblogs.asp.net/jalpeshpvadgama/archive/2012/07/17/model-binding-with-asp-net-4-5-and-visual-studio-2012.aspx) In earlier version of the asp.net we have to bind controls with data source control like SQL Data source, Entity Data Source, Linq Data Source if we want to bind our server controls declaratively. Some developers prefer to write whole data access logic and then bind the data source with databind method. Model binding is something similar to asp.net mvc binding. 

 

[Dependency Injection with ASP.NET Web API and Autofac, Ron Cain:](http://blogs.msdn.com/b/roncain/archive/2012/07/16/dependency-injection-with-asp-net-web-api-and-autofac.aspx) In WebApi, we define the basic verbs of our API in a class derived from ApiController.  When an Http request is received, WebApi uses the request URL and the application’s routing tables to map the request to a specific public method in a specific ApiController class.  All parameters for that method are satisfied using normal model binding.  Those parameter values typically come from the URL or from the request body, but model binding allows them to come from almost anywhere.

 

[Using the ASP.NET Web API UrlHelper, Ron Cain:](http://blogs.msdn.com/b/roncain/archive/2012/07/17/using-the-asp-net-web-api-urlhelper.aspx) This article describes how to use the UrlHelper class in WebApi to create URL’s that can be used to invoke ApiController methods.   This UrlHelper class uses the application’s route tables to compose the URL, avoiding the need to hard-code specific URL’s into the app.

 

[Choosing an ORM strategy, Jimmy Bogard:](http://lostechies.com/jimmybogard/2012/07/20/choosing-an-orm-strategy/) One of the mistakes I see people make (and have made myself) is assuming that you must choose exactly one ORM strategy for an entire database/application/system. It’s simply not the case. You can (and should) tailor your ORM strategy to your use case, and make sure you’re picking the right tool (or feature of the tool) for the job.