---
title: "Thread Synchronization"
date: 2010-11-02 05:00:00 +0000
tags:
  - Threading
---

In a multithreaded applications, you often need to synchronize individual threads with other parts of your program. Synchronization techniques are used to control following two things:

 
 * To control the order in which code runs whenever task must be performed in a specific sequence.
 * To prevent the problems that can occur when two threads share the same resources at the same time.

 

For example, in a networking application, one thread might continuously listen on the socket for incoming packets and adds whatever it receives to the Queue. Second thread on the other hand is waiting on the Queue and it process the message as soon as it gets something. We need synchronization here because both threads are using the same shared resource “the Queue”.

 

There are several thread synchronization techniques to address these issues. I will discussing those techniques one by one in later articles.