---
title: "Azure - Consuming Queue storage from .Net"
date: 2015-06-14 08:42:00 +0000
tags:
  - azure
  - C#
---

Azure Queue storage is a service for storing large numbers of messages that can be accessed from anywhere in the world via authenticated calls using HTTP or HTTPS. A single queue message can be up to 64 KB in size, and a queue can contain millions of messages, up to the total capacity limit of a storage account.

Common uses of Queue storage include:

* Creating a backlog of work to process asynchronously

* Passing messages from an Azure Web role to an Azure Worker role

I have unit test driven repository on Github to show common uses of queue storage.

[https://github.com/sanjaysingh/azure-samples/tree/master/QueueStorageTest](https://github.com/sanjaysingh/azure-samples/tree/master/QueueStorageTest)