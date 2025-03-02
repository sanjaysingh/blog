---
title: "Thread Synchronization Techniques - ReaderWriterLockSlim"
date: 2010-11-08 04:40:00 +0000
tags:
  - Threading
  - C#
---

* If you haven’t read ReaderWriterLock, i would suggest read that first at [http://www.sanjaysingh.net/2010/11/thread-synchronization-techniques_9866.html](http://www.sanjaysingh.net/2010/11/thread-synchronization-techniques_9866.html)
 * This class was introduced in .NET framework 3.5. This is similar to ReaderWriterLock but it has simplified rules for recursive locks and for upgrading and downgrading lock state and this avoids many cases of potential deadlocks.
 * Microsoft recommends it for all future development.
 * By default, new instances of ReaderWriterLockSlim are created with LockRecursionPolicy.NoRecusrion and therefore do not allow recursive lock calls. Contrast this with ReaderWriterLock which defaults to allowing recursive locks making your code more prone to deadlocks. For example, if the current thread entered read mode and it makes another call to acquire read lock, LockRecursionException is thrown. But remember that ReaderWriterLockSlim can also be instantiated to allow for recursive locks, and in that case this call will be allowed.
 * A thread can enter lock in three modes -  read mode, write mode and upgradable read mode.
 * Regardless of the recursion policy, only one thread can be in write mode at any given time. When one thread is in write mode, no other thread can enter the lock in any mode.
 * Only one thread can be in upgradable mode at any given time.
 * Any number of threads can be in read mode.

 

Below, i will give the same BookStore example explained in the above link using ReaderWriterLockSlim class. Behavior of the class remains same. Note the difference of use.

 
```python
public class Book
{
    public string Title { get; private set; }
    public string Publisher { get; private set; }
    public string Author { get; private set; }
    public uint PublishYear { get; private set; }

    public Book(string title, string publisher, string author, uint publishYear)
    {
        this.Title = title;
        this.Publisher = publisher;
        this.Author = author;
        this.PublishYear = publishYear;
    }
}

public class BookStore
{
    private List Books = new List();
    private ReaderWriterLockSlim BooksLock = new ReaderWriterLockSlim();

    public BookStore()
    {
        // Populate Books
    }

    public void AddBook(Book newBook)
    {
        if (this.BooksLock.TryEnterWriteLock(2000))
        {
            try
            {
                this.Books.Add(newBook);
                Console.WriteLine("Book Added");
            }
            finally
            {
                this.BooksLock.ExitWriteLock();
            }
        }
    }

    public Book GetBook(string title, string author)
    {
        Book requiredBook = null;

        if (this.BooksLock.TryEnterReadLock(2000))
        {
            try
            {
                foreach (Book currBook in this.Books)
                {
                    if (currBook.Title.Equals(title) && currBook.Author.Equals(author))
                    {
                        requiredBook = currBook;
                        break;
                    }
                }
            }
            finally
            {
                this.BooksLock.ExitReadLock();
            }
        }
        return requiredBook;
    }

    public int GetBooksCount()
    {
        int count = 0;

        if (this.BooksLock.TryEnterReadLock(2000))
        {
            try
            {
                count = this.Books.Count;
            }
            finally
            {
                this.BooksLock.ExitReadLock();
            }
        }
        return count;
    }
}
```