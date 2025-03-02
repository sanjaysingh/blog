---
title: "Finding permutations"
date: 2010-10-24 08:12:00 +0000
tags:
  - Algorithms
---

Here, I am going to present a very compact recursive c# code to compute all the permutations of a given string. Look at the following c# method: 

 
```html
public void PrintPermutations(string stringToPermute, string prefix)
{
   if (stringToPermute.Length <= 0)
   {
       Debug.WriteLine(prefix);
   }
   else
   {
       for(int i=0;i<stringToPermute.Length;i++)
           PrintPermutations(stringToPermute.Replace(stringToPermute[i].ToString(), ""), prefix + stringToPermute[i]);
   }
}
```

To find all the permutations of the string “ABC”, for example, you will call the method as follows:
PrintPermutations("ABC", "");
Also note that, I assume that stringToPermute parameter is a string containing non-repeating characters.