---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-downloadSentinelData
title: downloadSentinelData
excerpt: Download Sentinel data from entrieds in db
image: 
rootprocid: SentinelProcess
subprocid: downloadSentinelData
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
  <parameters cloudmax="xyz" downloaded="txtstring" orbitdirection="txtstring" platformname="txtstring" prodtype="txtstring" tiles="True/False"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| tiles | process | parameters | bool | attribute | no | True |
| orbitdirection | process | parameters | text | attribute | yes | B |
| platformname | process | parameters | text | attribute | yes | Sentinel-2 |
| downloaded | process | parameters | text | attribute | no | N |
| prodtype | process | parameters | text | attribute | yes | S2MSI1C |
| cloudmax | process | parameters | integer | attribute | no | 30 |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
