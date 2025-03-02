---
title: "Thread Synchronization Techniques – MethodImplAttribute"
date: 2010-11-11 08:06:00 +0000
tags:
  - Threading
---

* This is one more thread synchronization technique where you decorate a method with a particular attribute. We use attribute MethodImplAttribute with option of MethodImplOptions.Synchronized to make the whole method thread safe.
 * MethodImplAttribute is in [System.Runtime.CompilerServices](http://msdn.microsoft.com/en-us/library/system.runtime.compilerservices.aspx) namespace.
 * This attribute option ensures that the method can be executed by only one thread at a time.
 * Note that this class lies under CompilerServices namespace. So when you compile your app, compiler inserts **lock **statements around the body of the method to make the whole method thread safe. For the instance method it uses **lock(this) **and for the static methods it uses **lock(typeof(classname)). **Because of this, the use of this approach for thread synchronization is discouraged. Note that it is usually not a good practice to use **lock **on publicly visible objects/types. This is because somebody else might, in the future, use the same object/type to lock some other code segment, thus decreasing concurrency and increasing the chance of deadlock.

 

Following code snippet shows the use of MethodImplAttribute to synchronize two threads. We have a DataStore class which is accessed by two threads to store data. In the AddData method of DataStore, we simulate a delay in data processing by using Thread.Sleep. Here if we remove the MethodImplAttribute from the AddData method, you will randomly get System.ArgumentException. Following is the sample application:

 
```python
using System;
using System.Threading;
using System.Reflection;
using System.Diagnostics;
using System.IO;
using System.Runtime.CompilerServices;
using System.Collections.Generic;

namespace ConsoleApplication1
{
    class DataStore
    {
        private Dictionary dataCollection = new Dictionary();
        private const int StoreLimit = 100000;

        [MethodImplAttribute(MethodImplOptions.Synchronized)]
        public void AddData(string data)
        {
            if (!dataCollection.ContainsKey(data) && dataCollection.Count < StoreLimit)
            {
                Thread.Sleep(1000); // simulate some delay for data processing
                dataCollection.Add(data, data);

            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            (new Thread(ReceiveDataFromServer1)).Start();
            (new Thread(ReceiveDataFromServer2)).Start();
        }

        private static Random rand = new Random();
        private static DataStore store = new DataStore();
        private static void ReceiveDataFromServer1()
        {
            while (true)
            {
                string data = rand.Next(10, 20).ToString();
                store.AddData(data);
                Console.WriteLine("First thread data - " + data);
            }
        }

        private static void ReceiveDataFromServer2()
        {
            while (true)
            {
                string data = rand.Next(10, 20).ToString();
                store.AddData(data);
                Console.WriteLine("Second thread data - " + data);
            }
        }
    }
}
```