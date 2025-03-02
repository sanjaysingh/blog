---
title: "Error Copying File or Folder. Cannot Copy. There is not enough free disk space."
date: 2010-11-15 03:49:00 +0000
tags:
  - Error
---

I got this error recently when i was trying to copy a large file (~8GB) to my external USB hard drive. This did not make any sense to me as i had 120+ GB available free space on my hard disk.

 

I spent some time and it turns out i am not able to copy file because my hard disk was formatted with FAT32 format. FAT32 has 4GB file size limit and this is why i was not able copy this large file. So the solution is to convert your FAT32 to NTFS format. I already had lot of data on my hard disk so formatting with NTFS was not an option. Luckily, i found that Windows gives us  a **convert **command to convert FAT32 drives to NTFS while keeping all your data intact. You can use following command on the DOS prompt.

 
```
convert  /FS:NTFS /X
```

Here  is the drive (for example, F:) that you want to convert to NTFS. In my case, i got another error that it found some error on the drive and suggested to run CHKDSK. I ran CHKDSK as follows and then re-ran **Convert **command as given above and everything worked like a charm.

```
chkdsk  /F /X
```

Here  is the drive (for example F:) that you want to CHKDSK.