---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-downloadSentinelRegion
title: downloadSentinelRegion
excerpt: Download Sentinel granule meta data using region
image: 
rootprocid: SentinelProcess
subprocid: downloadSentinelRegion
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
  <parameters cloudmax="xyz" copycomp="txtstring" enddate="YYYYMMDD" enddoy="xyz" granuleoverlap="xyz.abc" orbitdirection="txtstring" platformname="txtstring" prodtype="txtstring" startdate="YYYYMMDD" startdoy="xyz" tablesearchid="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | systemregion |
| tablesearchid | process | parameters | text | attribute | no | regionid |
| granuleoverlap | process | parameters | real | attribute | no | 0.1 |
| orbitdirection | process | parameters | text | attribute | yes | B |
| platformname | process | parameters | text | attribute | yes | Sentinel-2 |
| prodtype | process | parameters | text | attribute | yes | S2MSI1C |
| cloudmax | process | parameters | integer | attribute | yes | 30 |
| startdate | process | parameters | date | attribute | yes | 20140401 |
| enddate | process | parameters | date | attribute | yes | 20300101 |
| startdoy | process | parameters | integer | attribute | no | 1 |
| enddoy | process | parameters | integer | attribute | no | 365 |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| datfiletype | process | srcpath | text | attribute | no | shp |
