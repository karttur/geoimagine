---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-reorganisesentinel
title: reorganisesentinel
excerpt: Reorganize Sentinel tiles and granules
image: 
rootprocid: SentinelProcess
subprocid: reorganisesentinel
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
  <parameters platformname="txtstring" prodtype="txtstring" searchpath="txtstring" tiles="True/False"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| searchpath | process | parameters | string | attribute | yes | --- |
| tiles | process | parameters | bool | attribute | no | True |
| platformname | process | parameters | text | attribute | yes | Sentinel-2 |
| prodtype | process | parameters | text | attribute | yes | S2MSI1C |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
