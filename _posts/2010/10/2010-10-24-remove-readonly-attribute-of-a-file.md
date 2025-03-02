---
title: "Remove ReadOnly attribute of a file"
date: 2010-10-24 20:43:00 +0000
tags:
  - C#
---

```html
string fileName = @"C:\ReadOnlyFile.txt";
File.SetAttributes(fileName, File.GetAttributes(fileName) & ~FileAttributes.ReadOnly);
```

Above C# code ensures that fileName does not have ReadOnly attribute set. SetAttribute static method takes fileName as the first parameter and FileAttributes enumeration as the second parameter. FileAttributes is a Flags enumeration meaning that we can combine multiple FlagAttributes values and set that as attribute of the file.

In the above code, we derive the FileAttributes to set by getting actual file attribute and doing a bitwise AND (operator &) with complement (operator ~) of ReadOnly attribute. This ensures that ReadOnly bit is set to zero leaving all the other attributes of the file as they were.

If you are unclear about logical operators, look at the following link for details:

[http://msdn.microsoft.com/en-us/library/6a71f45d(VS.71).aspx](http://msdn.microsoft.com/en-us/library/6a71f45d(VS.71).aspx)