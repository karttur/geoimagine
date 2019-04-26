---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-downloadSentinelDataRegion
title: downloadSentinelDataRegion
excerpt: Download Sentinel data from entries in db
image: 
rootprocid: SentinelProcess
subprocid: downloadSentinelDataRegion
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
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
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
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| datfiletype | process | srcpath | text | attribute | no | shp |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
