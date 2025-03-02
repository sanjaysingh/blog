---
title: "Thread Synchronization Techniques – Auto/ManualResetEvent"
date: 2010-11-03 08:37:00 +0000
tags:
  - Threading
---

AutoResetEvent and ManualResetEvent are what is called Wait Handles that is used to signal the state of one thread to another thread. Threads can use wait handles to notify other threads that they need exclusive access to a resource. Other threads must then wait to use this resource until the Wait Handle is no longer in use. Wait Handles have two states signaled and nonsignaled. A Wait Handle that is not owned by any thread is in the signaled state. A Wait Handle that is owned by a thread is in the nonsignaled state.

 
 * Threads request ownership of a wait handle by calling one of the wait methods, such as WaitOne, WaitAny, or WaitAll. All of these methods are blocking calls. If no other thread owns the wait handle, the call immediately returns true, the wait handle’s status is changed to nonsignaled, and the thread that owns the wait handle continues to run.
 * Threads that own a wait handle call the Set method when they are done.
 * Other threads can reset the status of a wait handle to nonsignaled by calling the reset method.
 * Once it has been signaled ManualResetEvent remains signaled until it is manually reset. That is calls to WaitOne return immediately.
 * AutoResetEvent resets automatically after each release. For example, let’s assume that we have three threads waiting on a manual reset event wait handle. As soon as we signal (Set) this ManualResetEvent, all the three threads are released. In contrast, had it been AutoResetEvent, it would release only one thread, resetting the state automatically.

 

Following sample class simulates processing of network data. Methods ReceiveData and ProcessData run on two different threads. Note that here we are achieving synchronization between the thread using AutoResetEvent. The ReceiveData thread is continuously generating data and pushing it into buffer. It also signals the AutoResetEvent as soon as some data is received. The ProcessData thread waits on the AutoResetEvent and processes the data as soon as signaled.

 

Note that we do not need to reset the AutoResetEvent, as it is automatically done after every set. Look at the example now:

 
```javascript
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace ConsoleApplication1
{
    public class NetworkDataSimulator
    {
        private AutoResetEvent autoResetEvent = new AutoResetEvent(false);
        private List buffer = new List();
        private Random rand = new Random(100);

        public void ReceiveData()
        {
            while (true)
            {
                // Simulate arrival of some data
                string data = rand.Next().ToString();

                // let us put the data in buffer
                lock (buffer)
                {
                    buffer.Add(data);
                    Console.WriteLine(string.Format("Data Received - {0}", data));
                    autoResetEvent.Set();
                }

                // simualte some delay
                Thread.Sleep(2000);
            }
        }

        public void ProcessData()
        {
            while (true)
            {
                autoResetEvent.WaitOne();
                lock (buffer)
                {
                    // Process received data
                    foreach (string dataElement in buffer)
                    {
                        Console.WriteLine(string.Format("Data Processed - {0}",dataElement));
                    }
                    buffer.Clear();
                }
                Thread.Sleep(2000);
            }
        }
    }
}
```

Call these two threads as follows and check the behavior of how they synchronize.

```python
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            NetworkDataSimulator nds = new NetworkDataSimulator();
            (new Thread(nds.ProcessData)).Start();
            (new Thread(nds.ReceiveData)).Start();
            
        }
    }
}
```