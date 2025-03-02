---
title: "RabbitMQ Connection String Gotcha"
date: 2016-05-01 08:54:00 +0000
tags:
  - RabbitMQ
---

RabbitMQ connection strings looks like following

[amqp://username:password@myrabbitserver.com/myvhost](amqp://username:password@myrabbitserver.com/myvhost)

or for amqp over SSL/TLS it looks like following

[amqps://username:password@myrabbitserver.com/myvhost](amqps://username:password@myrabbitserver.com/myvhost)

One very important thing to always keep in mind is that username, password and vhost should be [pct-encoded](https://en.wikipedia.org/wiki/Percent-encoding). If the password, for example, is #asd49d$ then the amqp connection string will become as follows-

[amqp://username:%23asd49d%24@myrabbitserver.com/myvhost](amqp://username:%23asd49d%24@myrabbitserver.com/myvhost)

It is very well documented [here](https://www.rabbitmq.com/uri-spec.html).