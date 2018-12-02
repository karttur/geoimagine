---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-specimensoil
title: specimensoil
excerpt: Extracts the local soil conditions in close proximity to a specimen point
image: 
rootprocid: specimen
subprocid: specimensoil
author: Thomas Gumbricht
comments: True
share: True
---

<h1 class='foot-description'>Process XML structure and parameters</h1>
```
For details on parameters see the table below
<?xml version="1.0" ?>
<process>
  <!--Generated from python-->
  <userproj plotid="yourplotid" projectid="yourprojectid" siteid="yoursiteid" system="systemid" tractid="yourtractid" userid="youruserid"/>
  <period endday="DD" endmonth="MM" endyear="YYYY" seasonendday="DD" seasonendmonth="MM" seasonstartday="DD" seasonstartmonth="MM" startday="DD" startmonth="MM" startyear="YYYY" timestep="timestep"/>
  <parameters maxsoillinestderr="xyz.abc" radius="xyz" slmethod="txtstring" soilline="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| radius | process | parameters | integer | attribute | no | 100 |
| maxsoillinestderr | process | parameters | real | attribute | no | 2 |
| soilline | process | parameters | text | attribute | no | scene |
| slmethod | process | parameters | text | attribute | no | pvipbidefault |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | pvipbi |
| band | process | srccomp | text | attribute | no | pvi |
| prefix | process | srccomp | text | attribute | no | pvi |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
