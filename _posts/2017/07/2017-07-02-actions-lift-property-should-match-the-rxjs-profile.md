---
title: "Actions lift property should match the RxJs profile"
date: 2017-07-02 20:14:00 +0000
tags:
  - uncategorized
---

There is a breaking change in TypeScript version 2.4.1+ and it breaks the hosted VSTS projects if you have not specifically specified typescript version in the package.json file.

Fix the typescript version to 2.4.0 to fix this.

-    "typescript": "^2.2.1"

+    "typescript": "2.4.0"

See a related thread here

[https://github.com/ngrx/effects/issues/161](https://github.com/ngrx/effects/issues/161)