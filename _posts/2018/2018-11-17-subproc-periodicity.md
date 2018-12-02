---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-periodicity
title: periodicity
excerpt: Sets the peridocity element tags
image: 
rootprocid: Periodicity
subprocid: periodicity
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
  <period addons="xyz" averagets="True/False" endday="xyz" endmonth="xyz" endyear="xyz" maxdaysaddons="xyz" seasonalts="True/False" seasonendday="xyz" seasonendmonth="xyz" seasonstartday="xyz" seasonstartmonth="xyz" startday="xyz" startmonth="xyz" startyear="xyz" timestep="txtstring"/>
  <srcperiod addons="xyz" maxdaysaddons="xyz" timestep="txtstring"/>
  <dstperiod timestep="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| startyear | process | period | integer | attribute | no | 1900 |
| endyear | process | period | integer | attribute | no | 2100 |
| startmonth | process | period | integer | attribute | no | 01 |
| endmonth | process | period | integer | attribute | no | 12 |
| startday | process | period | integer | attribute | no | 01 |
| endday | process | period | integer | attribute | no | 31 |
| seasonstartmonth | process | period | integer | attribute | no | 0 |
| seasonendmonth | process | period | integer | attribute | no | 0 |
| seasonstartday | process | period | integer | attribute | no | 0 |
| seasonendday | process | period | integer | attribute | no | 0 |
| addons | process | period | integer | attribute | no | 0 |
| maxdaysaddons | process | period | integer | attribute | no | 0 |
| seasonalts | process | period | bool | attribute | no | --- |
| averagets | process | period | bool | attribute | no | --- |
| timestep | process | period | text | attribute | no | static |
| addons | process | srcperiod | integer | attribute | no | 0 |
| maxdaysaddons | process | srcperiod | integer | attribute | no | 0 |
| timestep | process | srcperiod | text | attribute | no | static |
| timestep | process | dstperiod | text | attribute | no | static |
