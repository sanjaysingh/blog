---
title: "Thread Synchronization Techniques - Interlocked"
date: 2010-11-07 01:20:00 +0000
tags:
  - Threading
  - C#
---

* Windows follows what is called preemtive multithreading where a thread can be suspended after loading a value from memory address, but before having a chance to alter it and store it. Thus calls like following is not guaranteed to be atomic:

 
> ```
> x += 1;
> ```

* Interlocked class provides methods that synchronize access to a variable that is shared by multiple threads.
Interlocked operations are atomic meaning the entire operation is a unit that cannot be interrupted by another interlocked operation on the same variable.

Following is example of some of the commonly used Interlocked methods -

```html
// 5 is added to variable variableToBeAdded and value is stored in it, as an atomic operation.
Interlocked.Add(ref variableToBeAdded, 5);

// Increments a specified variable variableToBeIncremented by 1 and stores the result in it, as an atomic operation.
Interlocked.Increment(ref variableToBeIncremented);

// Decrements a specified variable valueToBeDecremented by 1 and stores the result in it, as an atomic operation.
Interlocked.Decrement(ref valueToBeDecremented);

// Assigned 10 to variableToBeAssigned as an atomic operation.
Interlocked.Exchange(ref variableToBeAssigned, 10);

// Checks to see if variableToBeCompared is 2 and if it is then assigns 3 to it.
Interlocked.CompareExchange(ref variableToBeCompared, 3, 2);
```

Also note that all of these methods have overloads for different types of variables like int, long, float, double etc.