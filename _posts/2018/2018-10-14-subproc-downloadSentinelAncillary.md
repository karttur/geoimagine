---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-downloadSentinelAncillary
title: downloadSentinelAncillary
excerpt: Download Sentinel granule meta data using vectors
image: 
rootprocid: SentinelProcess
subprocid: downloadSentinelAncillary
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
  <parameters cloudmax="xyz" enddate="YYYYMMDD" enddoy="xyz" granuleoverlap="xyz.abc" orbitdirection="txtstring" platformname="txtstring" prodtype="txtstring" startdate="YYYYMMDD" startdoy="xyz" tablesearchid="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| tablesearchid | process | parameters | text | attribute | no | searchid |
| granuleoverlap | process | parameters | real | attribute | no | 0.1 |
| orbitdirection | process | parameters | text | attribute | yes | B |
| platformname | process | parameters | text | attribute | yes | Sentinel-2 |
| prodtype | process | parameters | text | attribute | yes | S2MSI1C |
| cloudmax | process | parameters | integer | attribute | yes | 30 |
| startdate | process | parameters | date | attribute | yes | 20140401 |
| enddate | process | parameters | date | attribute | yes | 20180821 |
| startdoy | process | parameters | integer | attribute | no | 1 |
| enddoy | process | parameters | integer | attribute | no | 365 |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | zip |
| datfiletype | process | dstpath | text | attribute | no | zip |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| datfiletype | process | srcpath | text | attribute | no | shp |
| anyid | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid |
| source | srccomp | anyid | text | attribute | no | --- |
| product | srccomp | anyid | text | attribute | no | --- |
| folder | srccomp | anyid | text | attribute | yes | vector |
| band | srccomp | anyid | text | attribute | yes | vector |
| prefix | srccomp | anyid | text | attribute | yes | vector |
| suffix | srccomp | anyid | text | attribute | no | --- |
| system | srccomp | anyid | text | attribute | no | region |
