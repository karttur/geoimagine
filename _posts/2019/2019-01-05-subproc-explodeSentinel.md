---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-explodeSentinel
title: explodeSentinel
excerpt: Explode Sentinel tiles from entried in db
image: 
rootprocid: SentinelProcess
subprocid: explodeSentinel
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
  <parameters cloudmax="xyz" exploded="txtstring" granuleoverlap="xyz.abc" orbitdirection="txtstring" platformname="txtstring" prodtype="txtstring" set0tonull="True/False" setcloudmask="True/False" setdefectask="True/False" setdetfoomask="True/False" setnodatamask="True/False" setsaturamask="True/False" settecquamask="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| granuleoverlap | process | parameters | float | attribute | no | 0.1 |
| orbitdirection | process | parameters | text | attribute | no | B |
| platformname | process | parameters | text | attribute | yes | Sentinel-2 |
| exploded | process | parameters | text | attribute | no | N |
| prodtype | process | parameters | text | attribute | yes | S2MSI1C |
| cloudmax | process | parameters | integer | attribute | no | 0 |
| setcloudmask | process | parameters | boolean | attribute | no | True |
| setdetfoomask | process | parameters | boolean | attribute | no | True |
| setnodatamask | process | parameters | boolean | attribute | no | True |
| setdefectask | process | parameters | boolean | attribute | no | True |
| setsaturamask | process | parameters | boolean | attribute | no | True |
| settecquamask | process | parameters | boolean | attribute | no | --- |
| set0tonull | process | parameters | boolean | attribute | no | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | zip |
| datfiletype | process | srcpath | text | attribute | no | zip |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | tif |
