---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-tsresample
title: tsresample
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: tsresample
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
  <parameters group="True/False" method="txtstring" version="txtstring"/>
  <tarperiod addons="xyz" endday="xyz" endmonth="xyz" endyear="xyz" maxdaysaddons="xyz" seasonendday="xyz" seasonendmonth="xyz" seasonstartday="xyz" seasonstartmonth="xyz" startday="xyz" startmonth="xyz" startyear="xyz" timestep="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <dstband folder="txtstring" id="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| group | process | parameters | bool | attribute | yes | N |
| method | process | parameters | text | attribute | yes | avg |
| startyear | process | tarperiod | integer | attribute | no | 1900 |
| endyear | process | tarperiod | integer | attribute | no | 2100 |
| startmonth | process | tarperiod | integer | attribute | no | 01 |
| endmonth | process | tarperiod | integer | attribute | no | 12 |
| startday | process | tarperiod | integer | attribute | no | 01 |
| endday | process | tarperiod | integer | attribute | no | 31 |
| seasonstartmonth | process | tarperiod | integer | attribute | no | 0 |
| seasonendmonth | process | tarperiod | integer | attribute | no | 0 |
| seasonstartday | process | tarperiod | integer | attribute | no | 0 |
| seasonendday | process | tarperiod | integer | attribute | no | 0 |
| addons | process | tarperiod | integer | attribute | no | 0 |
| maxdaysaddons | process | tarperiod | integer | attribute | no | 0 |
| timestep | process | tarperiod | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | auto |
| band | process | srccomp | text | attribute | yes | src |
| prefix | process | srccomp | text | attribute | no | auto |
| suffix | process | srccomp | text | attribute | no | auto |
| masked | process | srccomp | bool | attribute | no | N |
| id | process | dstband | text | attribute | no | dst |
| suffix | process | dstband | text | attribute | no | auto |
| folder | process | dstband | text | attribute | yes | --- |
