---
title: "IoT Hello World -  Control LED using Raspberry Pi"
date: 2015-06-13 23:03:00 +0000
tags:
  - uncategorized
---

I used my Raspberry Pi B+ model to control a Led just to quickly see how easy or difficult it was. It turned out to be pretty straightforward once you have the hardware thins required.

1. A two pin Led
2. Two wires

After i installed Raspebian on the Pi using the standard guide that i have got. I installed WiringPi from [https://projects.drogon.net/raspberry-pi/wiringpi/download-and-install/](https://projects.drogon.net/raspberry-pi/wiringpi/download-and-install/)

For reference to GPIO pin layout, i referred [http://pi4j.com/pins/model-b-plus.html](http://pi4j.com/pins/model-b-plus.html). Connect long leg (+ve) of the LED to pin 11 (GPIO 0) and connect short leg (-ve) to any Ground (I connected to pin 6).

**Note that you should also use a resistor on the ground wire to limit the amount of current being passed to the LED otherwise it might damage your LED or even the board. I learnt that usually that happens if you are going to use it for prolonged time but for my 2 sec demo it did not cause any issue without resistor. So do at your own risk.**

[*](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi5Xeww89GKNhit_VUOZK4tJnJjYgQphXipQWyic5GjlhoyUFqgXw3mjUIoIy7NF_OXrdUlW2cGWYSdCoGHQdpmvVuf47xAevOPwdYjfFOuG6FqyHqFAV7l-YAcCLuUdfUFkpXTKg/s1600/3.jpg)

[![](/assets/images/iot-hello-world-control-led-using-raspberry-pi-2.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEge28CyxLcSmMyVw9W8WTlHo1-ijZO-3RE6__ZftmjDgf_RwtdGLTPqs6zqUmTU2jHJWGUSrvtuUeIDX_XI-OaA5dCiE-ao3u9a2dqBRI66b7GOlLcrbupOanl6QPwom9jxm4l3Yw/s1600/4.jpg)

GPIO pins can be programmatically controlled to be in either input or output mode. I saw that most of them are IN by default. I ran following to see pins status.
[![](/assets/images/iot-hello-world-control-led-using-raspberry-pi-3.PNG)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIdnrBKZusLKjgMVRmN8O30e2e9RHdgJe82tMnMn0r2PvNsXcBHd1VNID7bgcHRqgF9xaOgtFG4og9TZGI6PkrT3-SsgaSxnjWHOMad89YrFJH_9GLiZvOOY1bj_xNAPphoDLniA/s1600/1.PNG)

gpio readall*

*
*

See that pin Gpio 0 is in IN mode. Change its mode to OUT as follows-

*gpio mode 0 out*

*
*

Now you are ready to turn on/off the light. Use the following two commands.

For turning on the light - 

*gpio write 0 1*

*
*

[*](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj_gIEAQ5gGZY0_Df7BfZS7WZNOqFsL4hi3SMQ9msjO5_yNjNik2rQnY2WbFZZ-qtH3950BTJ19yVBa3ewD5Zb8PnQAS9LetFq_a5nFTgW9x7CXMy37bl8po_Nmwe8zL8bRkfPTyQ/s1600/6.jpg)

*

*
*

For turning off the light

gpio write 0 0

[![](/assets/images/iot-hello-world-control-led-using-raspberry-pi-5.PNG)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhpmoTMwkUUt8cUCsAnKf0t7amuvX3qKuL3p9Tfnn3p5VFEnmRESaPnD3m6wh7yOPgDO-l33r0GMOq2Pi2hxEF93ZupMHa_Q350PTiDSqM9ZGaIx1r-J8tEV8mjRDxN5mllCY-rPQ/s1600/2.PNG)