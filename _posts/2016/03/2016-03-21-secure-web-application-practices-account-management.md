---
title: "Secure Web Application Practices - Account Management"
date: 2016-03-21 09:34:00 +0000
tags:
  - uncategorized
---

In this post, I am going to cover some of the best practices around account management. Account Management covers things like 'account registration', 'forget password', 'remember me', 'password storage', etc.

Following are account management practices that one should consider to minimize the risk of breach.

* **Password Storage: **Always use cryptographically strong password hashing (not encryption) to store passwords. There are only a few cases you want to store password in encrypted (and not hashed) format. Always use some random credential-specific salt with the hashing algorithm you are using. This makes the hashes non-predictable and hard to reverse even if you are using simple algorithms like MD5. For the hashing algorithm, prefer from one of the followings (in the order of preference):

* Argon2

* PBKDF2 

* scrypt

* bcrypt 

**
    [https://www.owasp.org/index.php/Password_Storage_Cheat_Sheet](https://www.owasp.org/index.php/Password_Storage_Cheat_Sheet) 

* Registration: **

* There are pros and cons to whether to use email address or free text username for the login id. While there is privacy concern for the use of email, requiring a different username is a little bit of inconvenience on the user end. Some sites do allow both which is a better option because it leaves the option in the user's hand.

* Require strong password with a mix of alphanumeric and special characters. Do not limit users with use of any special characters as much as possible. Always have a limit of the minimum length of the password. It is always better to have a very high maximum limit on the length of the passwords. It allows for people to use pass phrases and use super strong passwords. If one is using any password manager, then length of the password does not matter anyway because you don't have to remember it. 

* Do not disable pasting of password from clipboard. There is almost no valid reason to disallow users from pasting a password. It in fact discourages users to select a strong password, particularly when you use some kind of password manager to generate a strong password first and then want to use that.

* Verify account via email. Always require the user to verify the account by sending some email to their account and then requiring them to verifying by going to some auto generated unique link. This prevents spammers and also ensure authenticity of the user. You don't want somebody else registering using your email address!

* Protect against account enumeration. Do not disclose the existence of a user account. Always throw a generic message that do not disclose whether or not the user being registered exists or not. While in some cases it might be a privacy concern because somebody can find if you are registered in a dating site for instance, in other cases it might be used for a brute force attacks.

* Use CAPTCHA for anti automation. It is very easy to automate Http requests to a website and that is true for automate the registration using some common names and flood the server. Use of CAPTCHA will protect against this kind of attacks.

**Logon:**

* Protect against account enumeration attacks. You should not disclose existence of a user account in the login error messages. "Login for User foo: invalid password", "Login failed, invalid user ID", "Login failed; account disabled", "Login failed; this user is not active" are bad messages. The correct message would be "Login failed; Invalid userID or password" irrespective of whether password is incorrect or the userid is not registered.

* [https://www.owasp.org/index.php/Authentication_Cheat_Sheet](https://www.owasp.org/index.php/Authentication_Cheat_Sheet)

Protect against brute force: Use CAPTCHA to prevent automated logins. Also, have some minimum duration between two login attempts. For instance, do not allow login request if last login attempt was less than 30 seconds away. The idea is to introduce some kind of limit or delay when you see brute force kind of attack on the server.
Employ two-factor authentication: This option can be employed optionally to better secure the user login. In the mechanism, you use user's phone or secondary email address to send a temporary one time password that you require before they can login. This adds little bit of inconvenience to the user but can optionally be provided for users so that they can selectivity opt in.

**Remember Me:**

* The first choice will be to see if you can live without this feature. Remember Me is usually not a good option for high value applications. For this reason you don't see remember me feature on bank websites.

* Use a specific Secure HttpOnly cookie for Remember Me. Do not store username/password in the cookie. 

* Set cookie expiry to be as minimal as you can afford for your application. 

* Require user to re-authenticate before they can perform any sensitive operation. For instance, ask user to provide 'old password'  when they try to change their password.

**Password Reset:**

* Do not send password in the email. That is true for both when registering a new user or when resetting password. Emails are unsafe and usually lie in unencrypted form on the servers.

* Use time limited reset token. Generate a link to send this to user to the registered email and they have to click on this link to set the new password. Link should expire after the first use or when the validity time period (should be very less, may be an hour) has expired.

* Use security questions. This is another approach that can be taken to verify authenticity of the user before you allow them to change the password.

**Log Off:**

* Expire session on the server. See if you can keep some kind of expiry for user sessions. For instance, it might be reasonable to log off user after 20 minutes of inactivity. As with everything else, it depends on the nature of the site. It might be inconvenience of some sites, like social media sites for instance.

* Protect against CSRF. As with Login and other forms, this is also a probable candidate for CSRF attacks and this should be protected against CSRF attacks.