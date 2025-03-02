---
title: "Thread Synchronization Techniques - Mutex"
date: 2010-11-05 09:57:00 +0000
tags:
  - Threading
---

* Mutex is a synchronization technique that grants exclusive access to the shared resource to only one thread. If a thread acquires a mutex, second thread that wants to acquire that mutex is suspended until the first thread releases the mutex.
 * The thread that own a mutex can request the same mutex without blocking its execution.
 * You can use **WaitOne **method to request ownership of a mutex. **ReleaseMutex **should be called to release ownership of a mutex. If you acquire same mutex multiple times, you will have to call **ReleaseMutex **as many times to release the mutex.
 * If a thread terminates while owning a mutex, the state of the mutex is set to signaled and the next waiting thread gets ownership.
 * A mutex are of two types – local mutex, which are unnamed and named mutex. A local mutex exists only within your process. It can be used by any thread in your process that has reference to the Mutex object that represents the mutex. Named mutex objects are visible throughout the operating system and can be used to synchronize the activities of processes.

 

Following example uses mutex to make an application single-instance. As said above, named mutex can be used for cross process synchronization, we take advantage of this to achieve single instance behavior for our application. Here is the sample application.

 
```python
using System;
using System.Threading;
using System.Reflection;

namespace ConsoleApplication1
{
    class Program
    {
        const string ApplicationID = "B45CFE7E-8E19-4a83-8782-859E006AD576";
        static void Main(string[] args)
        {
            string applicationName = Assembly.GetEntryAssembly().GetName().Name;
            Mutex startupMutex = new Mutex(false, ApplicationID);
            if (startupMutex.WaitOne(1))
            {
                Console.WriteLine(string.Format("{0} is running.",applicationName));

                // do your stuff
                Console.ReadLine();
            }
            else
            {
                Console.WriteLine(string.Format("{0} is already running.Exiting..",applicationName));
                Console.ReadLine();
            }
            
        }
    }
}
```