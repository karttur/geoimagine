---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-downloadSentinelTile
title: downloadSentinelTile
excerpt: Download Sentinel data from entrieds in db
image: 
rootprocid: SentinelProcess
subprocid: downloadSentinelTile
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
  <parameters cloudmax="xyz" downloaded="txtstring" orbitdirection="txtstring" platformname="txtstring" prodtype="txtstring" tileid="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| tileid | process | parameters | string | attribute | yes | tileid |
| orbitdirection | process | parameters | text | attribute | no | B |
| platformname | process | parameters | text | attribute | no | Sentinel-2 |
| downloaded | process | parameters | text | attribute | no | N |
| prodtype | process | parameters | text | attribute | no | S2MSI1C |
| cloudmax | process | parameters | integer | attribute | no | 30 |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
