---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-downloadbulkmeta
title: downloadbulkmeta
excerpt: Download bulk metadata from USGS per sensor or for all
image: 
rootprocid: LandsatProc
subprocid: downloadbulkmeta
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
  <parameters collection="txtstring" daysago="xyz" enddate="YYYYMMDD" filetype="txtstring" sensat="txtstring" startdate="YYYYMMDD"/>
  <dstpath volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | yes | --- |
| startdate | process | parameters | date | attribute | yes | --- |
| enddate | process | parameters | date | attribute | no | --- |
| collection | process | parameters | text | attribute | yes | --- |
| filetype | process | parameters | text | attribute | yes | csv |
| daysago | process | parameters | integer | attribute | no | 7 |
| volume | process | dstpath | text | attribute | yes | --- |
