---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-findgranuletiles
title: findgranuletiles
excerpt: Find mgrs tiles covered by granulue
image: 
rootprocid: SentinelProcess
subprocid: findgranuletiles
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
  <parameters cloudmax="xyz" downloaded="txtstring" granuleoverlap="xyz.abc" mgrsversion="txtstring" platformname="txtstring" prodtype="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| granuleoverlap | process | parameters | float | attribute | no | 0.1 |
| platformname | process | parameters | text | attribute | no | Sentinel-2 |
| downloaded | process | parameters | text | attribute | no | N |
| prodtype | process | parameters | text | attribute | no | GRD |
| mgrsversion | process | parameters | text | attribute | no | NGA |
| cloudmax | process | parameters | integer | attribute | no | 100 |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
