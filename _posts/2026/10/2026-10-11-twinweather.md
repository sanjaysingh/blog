---
layout: single
title: "Twinweather: Celsius and Fahrenheit on the Same Screen"
date: 2026-10-11 17:30:00 +0000
categories: [Tools, Web]
tags: [weather, celsius, fahrenheit, open-meteo]
---

I wanted a weather page that shows Celsius and Fahrenheit at the same time. I also wanted the name of a day to mean the daytime.

Both scales are part of daily life for anyone who lives across more than one culture. Family in one country, work in another, a recipe in Fahrenheit and a forecast in Celsius. Most weather apps make you pick a unit and remember which one you picked. Twinweather keeps both on the screen. There is no switch. Fahrenheit is calculated from the Celsius reading, so `18°C | 64°F` is one temperature, written twice.

The second reason showed up after I started using it. A forecast will call the day rainy because it rained at two in the morning, then stay clear from sunrise to sunset. The calendar date got wet. The hours I actually spend outside did not. When I decide whether to go out, I care about the time between sunrise and sunset.

The night is still on the page. The next 24 hours are each hour on its own, including the ones after dark. The seven-day row is the daytime. The icon, the word, and the rain chance come from sunrise up to sunset. Rain before sunrise or after sunset stays on the hourly row. It does not change the day.

Inside those hours, the day is whichever sky lasts the longest. One light-drizzle hour at 2% does not turn a sunny day into a wet one. Precipitation takes the label when it covers more of the daylight than any other sky, or when the chance is at least 15%. The percent belongs to that same kind of precipitation, so a brief shower is not stuck beside a heavier word from a different hour.

Try it at [twinweather.sanjaysingh.net](https://twinweather.sanjaysingh.net). Source is on [GitHub](https://github.com/sanjaysingh/twinweather).
