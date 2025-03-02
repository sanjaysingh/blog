---
title: "Update different rows on different conditions in SQL Server"
date: 2010-10-31 08:45:00 +0000
tags:
  - SQL Server
---

Here I will show you how to write an UPDATE statement in SQL Server to update different rows on different conditions. 

 

Following UPDATE sql statement updates salaries of the Employee table, giving 20% raise to the employees having salary less than or equal to 5000, 10% raise to the employees having salary between 5000 and 10000, 5% raise to the employees having salary between 10000 and 20000, and no raise for the employees with salary greater then or equal to 30000.

 
```html
UPDATE EMPLOYEE
SET Salary = CASE
                WHEN Salary <= 5000 THEN Salary* 1.20
                WHEN Salary <= 10000 THEN Salary * 1.10
                WHEN Salary <= 20000 THEN Salary * 1.05
                ELSE Salary
            END
```