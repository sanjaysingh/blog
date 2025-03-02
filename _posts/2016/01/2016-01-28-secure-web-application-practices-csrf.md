---
title: "Secure Web Application Practices - CSRF"
date: 2016-01-28 09:18:00 +0000
tags:
  - uncategorized
---

A Cross Site Request Forgery (CSRF) attack forces an authenticated victim's browser to send a request to a vulnerable web application, which then performs chosen action on behalf of the victim. The malicious code is often not on the vulnerable application, that is why it is called Cross Site. This vulnerability is known by several other names such as Session Riding, One-Click Attacks, Cross Site Reference Forgery and Automation Attacks.

Following are some of the practices that can be used to mitigate the risk of CSRF attacks.

1. Introduce randomness to a page response by including anti forgery token pair -  one in the page and another in the cookie. The form token and cookie token both needs to be sent when form is submitted for it to be successful. The idea is that an attacker site might be able to make the request on behalf of the vulnerable application and this send the anti forgery token in the cookie but it will not be able to send the token on the page and thus the request will fail.
2. CSRF is not limited to form submissions, API requests (like Ajax calls from the page) is equally a candidate for attack so the same mechanism needs to be applied here as well. Usually, APIs should also expect an anti forgery token in the header that can then be validated by the server by matching it with the one sent with the cookie.
3. Aspnet makes it very easy to handle this with the help of [Html.AntiForgeryToken](https://msdn.microsoft.com/en-us/library/dd470175(v=vs.118).aspx) html helper and [ValidateAntiForgeryToken](https://msdn.microsoft.com/en-us/library/system.web.mvc.validateantiforgerytokenattribute(v=vs.118).aspx) attribute filter.
4. Validate referrer header to prevent cross domain requests. Note however that referrer header is not guaranteed to be set by all clients and can also be manipulated. The idea again is to have multiple levels of defenses. Here for example, it can be implemented so that you either allow referrer to be the same domain or not be there at all so that browsers who don't send this header can still work.
5. Re-authenticate before sensitive data or value transactions. This adds another level of defense. For instance, ask user to re-authenticate before they transfer money. This mitigates the risk of CSRF attacks to these sensitive transactions.
6. A related form of attack to CSRF is [Clickjacking ](https://www.owasp.org/index.php/Clickjacking)in which an attacker hijacks the clicks of the victim meant for their page and routes it to the vulnerable site. It is usually done by attacker web application hosting the vulnerable application into an iFrame using transparent layer and then tricking the victim into clicking some button that results into posting to the vulnerable application. All the anti forgery token defense will not work here because it is valid request/response and browser will happily send anti forgery token in the cookie as well as one on the form.