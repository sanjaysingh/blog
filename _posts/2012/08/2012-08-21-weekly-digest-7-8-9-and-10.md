---
title: "Weekly digest #7, #8, #9 and #10"
date: 2012-08-21 10:46:00 +0000
tags:
  - uncategorized
---

It has been very tough last month so i could not publish anything. Following is what’s been interesting in these four weeks in the .Net world.

 

[How to migrate an existing ASP.NET Website Project to Windows Azure, zafarx:](http://blogs.msdn.com/b/zkap/archive/2012/07/29/how-to-migrate-an-existing-asp-net-website-to-windows-azure.aspx) In this blog we will discuss how to migrate an existing ASP.NET Website project to Windows Azure.

 

[Why TCP is evil and HTTP is king, Ayende @ Rahien:](http://ayende.com/blog/157282/why-tcp-is-evil-and-http-is-king?key=e3ca0477-7b77-4695-b3b6-788e857003ce) I got asked why RavenDB uses HTTP for transport, instead of TCP. Surely binary TCP would be more efficient to work with, right?

 

[Rich JavaScript Applications – the Seven Frameworks (Throne of JS, 2012), Steven Sanderson:](http://blog.stevensanderson.com/2012/08/01/rich-javascript-applications-the-seven-frameworks-throne-of-js-2012/) t’s no longer good enough to build web apps around full page loads and then “progressively enhance” them to behave more dynamically. Building apps which are fast, responsive and modern require you to completely rethink your approach.

 

[Task vs IObservable: when to use what?, Flavien Charlon:](http://blogs.msdn.com/b/flaviencharlon/archive/2012/08/06/task-lt-t-gt-vs-iobservable-lt-t-gt-when-to-use-what.aspx) The Task class was integrated with the .NET Framework in .NET 4.0, as part of what is known as the Task Parallel Library. The main purpose of the TPL was to facilitate writing parallel code, making it easier to run code on multiple cores, for instance. That is why the class itself was called Task, it represented a piece of program you could run in parallel with other pieces of program. Task, however, is much more versatile than that. In .NET 4.5 (now RTM, and on MSDN next week), Task will be the primary actor for working with the new async/await language feature.

 

[Where does ASP.NET Web API Fit?,  Rick Strahl:](http://www.west-wind.com/weblog/posts/2012/Aug/07/Where-does-ASPNET-Web-API-Fit) With the pending release of [ASP.NET MVC 4](http://www.asp.net/mvc) and the new [ASP.NET Web API](http://www.asp.net/web-api), there has been a lot of discussion of where the new Web API technology fits in the ASP.NET Web stack. There are a lot of choices to build HTTP based applications available now on the stack - we've come a long way from when WebForms and Http Handlers/Modules where the only real options. Today we have WebForms, MVC, ASP.NET Web Pages, ASP.NET AJAX, WCF REST and now Web API as well as the core ASP.NET runtime to choose to build HTTP content with.

 

[Simple.Web and Nancy, MARKRENDLE:](http://blog.markrendle.net/2012/08/07/simple-web-and-nancy/) Several people have asked me what the difference is between [Simple.Web](https://github.com/markrendle/Simple.Web) and [Nancy](https://github.com/NancyFx/Nancy/), so I’m going to try and outline it here, and share some more of my motivation for writing Simple.Web in the first place.

 

[Properties in JavaScript: definition versus assignment, Dr. Axel Rauschmayer:](http://www.2ality.com/2012/08/property-definition-assignment.html) Did you know that defining a property is not the same as assigning to it? This blog post explains the difference and its consequences. It has been triggered by an [email](https://mail.mozilla.org/pipermail/es-discuss/2012-July/024227.html) from Allen Wirfs-Brock on the es-discuss mailing list.

 

[Knockout.js pro tips – working with templates, Filip W.:](http://www.strathweb.com/2012/08/knockout-js-pro-tips-working-with-templates/) Just like last time, when we [discussed observable arrays](http://www.strathweb.com/2012/07/knockout-js-pro-tips-working-with-observable-arrays/), I wanted to share a few (hopefully) useful tips about working with templates in Knockout. This is not going to be a comprehensive look into templating with knockout – there are plenty of resources that cover that – but rather a collection of smaller pieces of advice that could make you life easier.

 

[Performance Tips: System.Text.StringBuilder and String.Concat, Feng Yuan:](http://blogs.msdn.com/b/fyuan/archive/2012/08/12/performance-tips-system-text-stringbuilder-and-string-concat.aspx) Much has been written about the benefits of using StringBuilder over string concatenation. So much so that there seems to be overuse of StringBuilder class, causing performance issues again.

 

[A Tool to Remove Source Control Bindings from Visual Studio Solutions and Projects, Saveen Reddy:](http://blogs.msdn.com/b/saveenr/archive/2012/08/11/a-tool-to-remove-source-control-bindings-from-visual-studio-solutions-and-projects.aspx) Ever need to share your Visual Studio solution or projects with someone? You ZIP up a folder with your code and send it. If your project is under source control – one that is integrated with Visual Studio – you will likely hear from the recipient of your code. They will be complaining that the get weird warnings from Visual Studio when they load the solution and projects.

 

[Reliable job scheduling with NServiceBus and Quartz.NET, Jimmy Bogard:](http://lostechies.com/jimmybogard/2012/08/13/reliable-job-scheduling-with-nservicebus-and-quartz-net/) One of the more interesting features of NServiceBus is the ability to [schedule messages](http://nservicebus.com/Scheduling.aspx) and send messages in the future. The default implementation works well for simple cases, where you have messages that need to be sent every X seconds. But for many of our scenarios, we are more calendar based.

 

[Caching LINQ Results, Chris Eargle:](http://www.kodefuguru.com/post/2012/08/13/Caching-LINQ-Results.aspx) Christopher Nolan’s recent films have earned him a place among the pantheon of geek heroes. The grittiness of his Batman films corrected the campiness of the previous series, and his movie Inception represents recursion with artistic flair that should make Douglas Hofstadter proud. However, before Nolan’s recent slate of successful films is another film with analogies in programming.

 

[OData support in ASP.NET Web API, Alex D James:](http://blogs.msdn.com/b/alexj/archive/2012/08/15/odata-support-in-asp-net-web-api.aspx) Earlier versions [ASP.NET Web API](http://www.asp.net/web-api) included basic support for the [OData](http://www.odata.org/), allowing you to use the OData Query Options $filter, $orderby, $top and $skip to shape the results of controller actions annotated with the **[Queryable]**attribute. This was very useful and worked across formats. That said true support for the OData format was rather limited.  In fact we barely scratched the surface of OData, for example there was no support for creates, updates, deletes, $metadata and code generation etc.

 

[Using JSHint inside Visual Studio – the basics, Steven Sanderson:](http://blog.stevensanderson.com/2012/08/17/using-jshint-inside-visual-studio-the-basics/) **JSHint is great**. It’s a linting tool for JavaScript: a simple tool that can very often spot your mistakes before you do. It can save you from a lot of tedious debugging, lets you refactor JavaScript code with greater confidence, and reduces the chances of you deploying broken code to your production server.