---
title: "Secure Web Application Practices - XSS"
date: 2016-01-24 20:55:00 +0000
tags:
  - XSS
  - security
---

Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted web sites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it.

An attacker can use XSS to send a malicious script to an unsuspecting user. The end user’s browser has no way to know that the script should not be trusted, and will execute the script. Because it thinks the script came from a trusted source, the malicious script can access any cookies, session tokens, or other sensitive information retained by the browser and used with that site.

Following are the some of the practices that helps mitigate the risk of XSS in a web application.

1. HTML Escape before inserting untrusted data into HTML element content. Untrusted data can be malicious scripts that when put into html context can cause it to execute and do nasty things. 
2. Attribute escape before Inserting untrusted data into HTML common attributes
3.