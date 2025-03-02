---
title: "Understanding Dispatcher in WPF"
date: 2010-11-01 06:54:00 +0000
tags:
  - WPF
---

* Dispatcher is an instance of the class System.Windows.Threading.Dispatcher.  Dispatcher maintains a prioritized queue of work items for a specific thread.  When the Dispatcher is created on a thread, it becomes the only Dispatcher that can be associated with the thread, even if the Dispatcher is shut down.  If you attempt to get the CurrentDispatcher for the current thread and a Dispatcher is not associated, a Dispatcher will be created.  If a Dispatcher is shut down, it cannot be restarted.  In WPF, a DispatcherObject can only be accessed by the Dispatcher it is associated with. Note that every visual (Textbox, Combobox etc) inherits from DispatcherObject. For this reason, a background thread cannot update the content of a Button that is associated with the Dispatcher on the UI thread. This is accomplished using either Invoke or BeginInvoke. Invoke is synchronous and BeginInvoke is asynchronous. The operation is added to the queue of the Dispatcher at the specified DispatcherPriority.

 

Following code generates exception “The calling thread cannot access this object because a different thread owns it”.

 

public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
            Thread mythread = new Thread(() => this.MyButton.Content = "New Value");
            mythread.Start();
        }
    }

Here MyButton is a Button added to window1 and we are trying to set its content from a different thread. As mentioned above, this is illegal.
Following is the correct way of doing this. Note the use of Dispatcher.

```javascript
public partial class Window1 : Window
{
    public Window1()
    {

        InitializeComponent();
        Thread mythread = new Thread(() => this.MyButton.Dispatcher.Invoke((Action)(() => this.MyButton.Content = "New Value"),DispatcherPriority.Normal));
        mythread.Start();
    }
}
```