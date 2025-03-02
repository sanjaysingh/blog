---
title: "Thread Synchronization Techniques – Monitor"
date: 2010-11-02 06:54:00 +0000
tags:
  - Threading
  - C#
---

Monitor is the most fundamental thread synchronization technique in the .NET Framework. This can be used to synchronize access to what is called critical section by multiple threads. I am going to present an example first and then we will discuss that:

 
```python
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace WpfApplication1
{
    public class Person
    {
        public string Name
        {
            get;
            private set;
        }

        public string Age
        {
            get;
            private set;
        }

        public void SetData(string name, string age)
        {
            try
            {
                Monitor.Enter(this);
                this.Name = name;
                this.Age = age;
            }
            finally
            {
                Monitor.Exit(this);
            }
        }
    }
}
```

Look at the SetData method. Here, setting name and age of the person is an atomic operation for us. This is also a critical section for us that we want to make thread safe. Note that if we do not synchronize this section in a multithreaded application, then we may end up having corrupt name and age values for a person object.
Monitor.Enter method acquires an exclusive lock on “this” object if it is not already acquired. If the second thread tries to enter this method while first thread is still executing it, it will block at Monitor.Enter call. Note that the lock is identified by the Object that is passed to the enter method, so take extreme care in deciding what object to use to acquire lock -  particularly when your contains multiple critical sections. Otherwise, you may end up in deadlock.
Each call to Monitor.Enter should be complemented with a call to Monitor.Exit to release the lock. The idea is that only one thread can be inside the Monitor at any one time.
C# .NET also provides a language specific construct “lock” to be used in this scenario. Following is the implementation of the above method “SetData” using “lock” construct:

```html
public void SetData(string name, string age)
{
    lock (this)
    {
        this.Name = name;
        this.Age = age;
    }
}
```

This implementation of “SetData” is exactly same as the implemented using Monitor. “lock” is C# language construct which get translated to Monitor calls in the compiled code.