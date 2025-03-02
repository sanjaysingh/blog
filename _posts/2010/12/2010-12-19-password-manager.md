---
title: "Password Manager"
date: 2010-12-19 05:34:00 +0000
tags:
  - uncategorized
---

Often times we store our passwords in one or other kind of files on our personal computers. When you have too many passwords it becomes increasingly difficult to manage them. At the same time if you write them to a txt file, you also have the risk of it being read by someone else.

 

I made a very simple Password Manager C# .NET windows app that stores the password in encrypted format on your local file system. Its really simple. Following is summary of what it does.

 
 * When you run the application first time, it will ask you to configure your master password.
 * All the passwords are stored in encrypted format (using Rijndael symmetric algorithm) using your master password as the key in a file Password.dat at the exe location. Note that this file can only decrypted with your master password and so is secure even if someone gets his hand on your password data file.
 * It has a a Form that shows your password in a grid and gives you a search text box which show real time search results as you type.

 

Source and executable can be downloaded from following locations:

 

[http://sourceforge.net/projects/managepassword/files/](http://sourceforge.net/projects/managepassword/files/)