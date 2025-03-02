---
title: "Secure Web Application Practices – SQL Injection"
date: 2016-01-24 09:43:00 +0000
tags:
  - security
  - sql injection
---

SQL Injection is still the top web application security risk today according to [OWASP top 10](http://owasptop10.googlecode.com/files/OWASP%20Top%2010%20-%202013.pdf). 

Injection flaws, such as SQL, OS, and LDAP injection occur when untrusted data is sent to an interpreter as part of a command or query. The attacker’s hostile data can trick the interpreter into executing unintended commands or accessing data without proper authorization.

Below are the best practices that you should follow or look for when reviewing an application for SQL Injection vulnerability.

1. Always use parameterized query. Most of the SQL injection attacks are done when application is building the SQL query by concatenating untrusted data.**"SELECT * FROM accounts WHERE custID='" + request.getParameter("id") + "'";
2. Prefer use of ORM. Although Security is hardly the main reason for choosing to use an ORM framework like Entity framework, we should understand that it is a great tool for mitigating SQL injection risks. These tools make use of parameterized queries and so help mitigate SQL injection risks to a great extent. Following query for instance mititgates the SQL Injection risk that was shown above.DbContext.Customers.Where (cust => cust.CustID == request.getParameter(“Id”));
3. Use stored procedures. Stored procedures promote parameterization and thus avoid the SQL Injection risks that can arise out of concatenating queries.
4. Stored procedures have risks as well. Look for query concatenation and dynamic queries inside an stored procedures. Check presence of EXEC statements that is used to execute dynamic queries. That is usually a smell for injection risks.
5. Follow principle of least privileges. An application should have access to only the the data it needs and also only the kind of access it needs. It might mean that you will have to maintain multiple logins and there is a maintenance trade off.
6. Validate untrusted data. Security is all about having multiple layers of defense so that multiple layers of vulnerabilities are required to get access to sensitive data. Untrusted data should be properly validated. Also prefer white listing rather than blacklisting. You never know enough about what data is bad.
7. Implement proper error handling. Internal errors should not propagate to the end users. They disclose hell lot of information that is often used by malicious attackers for SQL injection attacks. Attackers can still use [Blind SQL Injection](https://www.owasp.org/index.php/Blind_SQL_Injection) attacks which is much harder than error based SQL injection attacks.
8. Encrypt sensitive data. Hash passwords. This is another layer of defense that should always be considered. Passwords should always be hashed and also any other sensitive data should be encrypted.
9. Isolate database network segment. A proper network segment should be created and firewall rules should be put in place so that only designated network segments have access to the data. A typical network segment divides network into Untrusted, Semi-Trusted and Trusted zones where database is placed into Trusted zone. Only certain applications in Semi-Trusted zone is allowed access to the data. This is again about applying another layer of defense and mitigating the security risks.
10. Keep Software patched and current. Attackers usually use known vulnerabilities in software to attack certain applications. Many a times websites continue to use older versions of software multiple months after risks have been identified and this makes the attack vector really easy. It is always better to be current and patched.
11. Ensure OS level commands like xp_cmdshell** are disabled. Modern SQL Server keeps them disabled by default which is what it should be -  secure by default. This is a very powerful command because an attacker if they have access can run any OS level command using this.

There are many automation tools that help identify many of the vulnerabilities quite easily. Following are some of the tools that you can use to make your job easier.

1. SQL Inject Me (Firefox plugin): [https://addons.mozilla.org/en-US/firefox/addon/sql-inject-me/](https://addons.mozilla.org/en-US/firefox/addon/sql-inject-me/)
2. Fuzz Testing with Burp Suite.
3. Data extraction with SqlMap: [http://sqlmap.org/](http://sqlmap.org/)
4. Security scanning with Netsparker: [https://www.netsparker.com/web-vulnerability-scanner/](https://www.netsparker.com/web-vulnerability-scanner/)