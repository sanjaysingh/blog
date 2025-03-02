---
title: "How to create list of anonymous types"
date: 2011-08-07 16:35:00 +0000
tags:
  - uncategorized
---

I was writing a method and I needed to loop through a collection of objects, collecting a couple of fields of those objects based on some business conditions and store them into a temporary data structure. Anonymous type came into my mind right away. But how to store those anonymous types into a list? I googled without giving much thought and guess what – there is indeed a way and i liked it.

 
```
var listOfAnonymoustTypes = new[] { new { Id=1, Name="Name" }}.ToList();
```

```
That’s it. It is that easy and intuitive. Following contains the detailed discussion on this topic.
```

```
[http://kirillosenkov.blogspot.com/2008/01/how-to-create-generic-list-of-anonymous.html](http://kirillosenkov.blogspot.com/2008/01/how-to-create-generic-list-of-anonymous.html)
```