---
title: "Thread Synchronization Techniques – Semaphore"
date: 2010-11-09 08:30:00 +0000
tags:
  - Threading
---

* Semaphore is another class based (derives from) on WaitHandle. Other classes that are based on WaitHandle and i have discussed them in my previous posts are AutoResetEvent, ManualResetEvent and Mutex.  Semaphore is used to control number of threads that can access a shared resource concurrently.  Threads enter the Semaphore by calling WaitOne method and release the Semaphore by calling Release method.  Semaphore is initialized by specifying the number of concurrent threads that it should allow. The count on Semaphore is decremented each time a thread enters the Semaphore and incremented each time a thread releases the Semaphore. When the count is zero, subsequent calls block until other threads release the Semaphore. When all threads release the Semaphore, the count is maximum value specified when the Semaphore was created.  There is no guaranteed order in which blocked thread enter the Semaphore.  A thread can enter Semaphore multiple times by calling WaitOne method repeatedly. But each of the WaitOne calls must be matched with corresponding Release call. There is also an overload of Release that takes an integer specifying number of entries to be release.  If the count on the Semaphore is full (no thread is entered), and a thread calls Release on that Semaphore, SemaphoreFullException is thrown.  Semaphore are of two types: local Semaphores and named system Semaphores. Named system Semaphores are visible throughout the operating system and can be used to synchronize the activities of processes. You can create multiple semaphores that represent the same named system semaphore and you can use OpenExisting method to open an existing named system semaphore.

 

Now, below i am going to give an example for use of Semaphore. We use semaphore in the following console application to allow for only two simultaneous instances of this application. Following is the code snippet:

 
```python
using System;
using System.Threading;
using System.Reflection;
using System.Diagnostics;
using System.IO;

namespace ConsoleApplication1
{
    class Program
    {
        const string ApplicationID = "B45CFE7E-8E19-4a83-8782-859E006AD576";
        static void Main(string[] args)
        {
            Semaphore semaphore = null;
            string appName = Path.GetFileName(Process.GetCurrentProcess().MainModule.FileName);
            try
            {
                semaphore = Semaphore.OpenExisting(ApplicationID);
            }
            catch(WaitHandleCannotBeOpenedException)
            {
                semaphore = new Semaphore(2, 2, ApplicationID);
            }

            if (semaphore.WaitOne(0))
            {
                Console.WriteLine(string.Format("{0} is running", appName));
                Console.WriteLine("Press enter to exit.");
                Console.ReadLine();
                semaphore.Release();
            }
            else
            {
                Console.WriteLine(string.Format("Two Instances of {0} are already running.",appName));
                Console.WriteLine("Press enter to exit.");
                Console.ReadLine();
            }
        }
    }
}
```

This might not be the best scenario in which Semaphore should be used, but by this example i just want to show the concepts behind Semaphore and its potential use.