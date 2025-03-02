---
title: "Azure VM capture is not what it sounds like"
date: 2015-09-04 08:18:00 +0000
tags:
  - azure
  - vm
---

I learnt it the hard way. I was trying to capture a snapshot of my VM so that i can reuse to later create a fresh VM in case this one goes bad in anyway. I saw that Azure portal gives you a Capture option for the VM. Without reading any details and going by the name, i went ahead to capture the image. It asked me to run sysprem on the machine, which i did and shutdown the machine. When i went back to capture the image, it warned that it will DLETE this VM after the capture!!! That's what was a huge setback for me. That's not what I had expected a CAPTURE to be.

I did not want to delete that VM so thought to not go ahead with the capture. Guess what, i cannot RDC to my VM any more. Since i could not RDC, i thought may be capturing the image and creating another VM with that image would work. But it did not and the same issue that I could no longer RDC continued even with the machine created with the captured image. I was screwed.

That is very bad. A simple thing, like 'putting the warning that VM would be deleted' before i ran sysprep could have never caused this mess.

Note that i did put effort googling to see if there was any way out but no luck there as well.

Be careful with VM capture on Azure.