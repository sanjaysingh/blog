---
title: "Weekly digest #2"
date: 2012-06-23 18:07:00 +0000
tags:
  - uncategorized
---

[SignalR – Group Notifications, Dane-Garrin Balia](http://www.codeproject.com/Articles/404662/SignalR-Group-Notifications): The aim of what we will be trying to accomplish in this tutorial is to create a sample Broadcast Notification System using SignalR where specific groups can receive "notifications" in real time, from an external application.

 

[ExecutionContext vs SynchronizationContext, Stephen Toub](http://blogs.msdn.com/b/pfxteam/archive/2012/06/15/executioncontext-vs-synchronizationcontext.aspx): I’ve been asked a few times recently various questions about ExecutionContext and SynchronizationContext, for example what the differences are between them, what it means to “flow” them, and how they relate to the new async/await keywords in C# and Visual Basic.  I thought I’d try to tackle some of those questions here.

 

[The Three Models of ASP.NET MVC Apps, Dino Esposito:](http://www.simple-talk.com/dotnet/asp.net/the-three-models-of-asp.net-mvc-apps/) When you use the standard project template for creating ASP.NET MVC 3 applications in Visual Studio 2010, the newly created project comes with a predefined folder named Models. The Models folder goes hand-in-hand with two other predefined folders called Views and Controllers. Models, Views, and Controllers form the triad of roles that underlie any application that conforms to the popular MVC (Model-View-Controller) design pattern.

 

[C# 5.0 Async Tips and Tricks Part 1, Jérôme Laban](http://jaylee.org/post/2012/06/18/CSharp-5-0-Async-Tips-and-Tricks-Part-1.aspx): This article is a discussion about how C#5.0 async captures the executing context when running an async method, which allows to easily stay on the UI Thread to access UI elements, but can be problematic when running CPU-bound work. Off of the UI thread, an async method may jump from thread to thread, breaking thread context dependent code along with it.

 

[IIS Best Practices, CenkIscan:](http://blogs.msdn.com/b/cenkiscan/archive/2012/06/20/iis-best-practices.aspx) For a very long time, I have been asked for a document on IIS best practices. There are some blogs/articles on the Internet but I could not find a complete one. Actually, the main problem here is that there can not be “best practices” for a web server. A web server is just a hosting platform for applications, and, each and every application has its own needs. Therefore, in many cases, you will not have one universal best practice.

 

[A Gentle Reintroduction to the Reactive Extensions for JavaScript Part 1, Matthew Podwysocki:](http://codebetter.com/matthewpodwysocki/2012/06/20/a-gentle-reintroduction-to-the-reactive-extensions-for-javascript-part-1/) In the previous post, I briefly covered that yes, the Reactive Extensions for JavaScript is alive, with two releases to show for it.  Before going into the depths of what’s in the box for V1 and V2, I want to step back and cover some of the basics and why you might care about this library.  It’s great to talk about APIs and general capabilities, but let’s first cover asynchronous and event-based programming in JavaScript today.

 

[Getting started with Lucene.NET–Searching, Ricci Gian Maria:](http://www.codewrecks.com/blog/index.php/2012/06/21/getting-started-with-lucene-netsearching/) In the previous part I’ve showed how easy is to create an index with lucene.net, but in this post I’ll start to explain how to search into it, first of all what I need is a more interesting example, so I decided to download a dump of stack overflow, and I’ve extracted the Posts.Xml file (10 GB of XML file), then I wrote this simple piece of text to create the lucene index.

 

[The theory behind covariance and contravariance in C# 4, Tomáš Petříček:](http://tomasp.net/blog/variance-explained.aspx) In C# 4.0, we can annotate generic type parameters with out and in annotations to specify whether they should behave covariantly or contravariantly. This is mainly useful when using already defined standard interfaces. Covariance means that you can use IEnumerable in place where IEnumerable is expected. Contravariance allows you to pass IComparable as an argument of a method taking IComparable.