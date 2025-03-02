---
title: "Thread Synchronization Techniques - ReaderWriterLock"
date: 2010-11-07 08:59:00 +0000
tags:
  - Threading
  - C#
---

* ReaderWriterLock class defines a lock that supports single writer and multiple readers. This is used to synchronize access to a resource. In situations where resource is changed infrequently, a ReaderWriterLock provides better throughput than normal locks like Monitor.  A thread can hold a reader lock or a writer lock but not both.  Every call to acquire a lock increases the lock count. So you have to call release lock as many times as you call acquire lock.  Readers and Writers are queued separately. When a thread releases a writer lock, all threads waiting in the reader queue are granted reader locks. When all of those reader locks have been released, the next thread waiting in the writer queue, if any, is granted the writer lock, and so on.  When a thread in the writer queue is waiting for active readers locks to be released, threads requesting new reader locks accumulate in the reader queue. This helps protect writers against indefinite blockage by readers.  Most methods for acquiring locks on ReaderWriterLock accept time-out values. Use time-out to avoid deadlocks in your application.

 

Below, i will show the use of ReaderWriterLock class. We have a BookStore class and a Book class. BookStore class maintains a collection of Books. ReaderWriterLock makes perfect sense here because in BookStore write operation is less frequent than read operation (You get new books less frequently than number of customers that you have to cater to).

 
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
    private ReaderWriterLock BooksLock = new ReaderWriterLock();

    public BookStore()
    {
        // Populate Books
    }

    public void AddBook(Book newBook)
    {
        this.BooksLock.AcquireWriterLock(2000);
        try
        {
            this.Books.Add(newBook);
        }
        finally
        {
            this.BooksLock.ReleaseWriterLock();
        }
    }

    public Book GetBook(string title, string author)
    {
        Book requiredBook = null;
        this.BooksLock.AcquireReaderLock(2000);
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
            this.BooksLock.ReleaseReaderLock();
        }
        return requiredBook;
    }

    public int GetBooksCount()
    {
        int count = 0;
        this.BooksLock.AcquireReaderLock(2000);
        try
        {
            count = this.Books.Count;
        }
        finally
        {
            this.BooksLock.ReleaseReaderLock();
        }
        return count;
    }
}
```

AddBook method acquires writer lock and GetBook and GetBookCount method acquires reader lock. Note that we release lock in the finally block to ensure that lock is released whatever the case be.