---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-checklandsat
title: checklandsat
excerpt: Compares the database and files of the karttur landsat archive
image: 
rootprocid: LandsatProc
subprocid: checklandsat
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
  <parameters dataunit="txtstring" download="True/False" extract="True/False" mask="True/False" meta="True/False" organized="True/False" redundant="True/False" sensat="txtstring"/>
  <srcperiod addons="xyz" endday="xyz" endmonth="xyz" endyear="xyz" maxdaysaddons="xyz" seasonendday="xyz" seasonendmonth="xyz" seasonstartday="xyz" seasonstartmonth="xyz" startday="xyz" startmonth="xyz" startyear="xyz" timestep="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | no | anyid |
| dataunit | process | parameters | text | attribute | yes | srfi |
| organized | process | parameters | bool | attribute | no | N |
| redundant | process | parameters | bool | attribute | no | N |
| download | process | parameters | bool | attribute | no | N |
| extract | process | parameters | bool | attribute | no | N |
| meta | process | parameters | bool | attribute | no | N |
| mask | process | parameters | bool | attribute | no | N |
| startyear | process | srcperiod | integer | attribute | no | 1900 |
| endyear | process | srcperiod | integer | attribute | no | 2100 |
| startmonth | process | srcperiod | integer | attribute | no | 01 |
| endmonth | process | srcperiod | integer | attribute | no | 12 |
| startday | process | srcperiod | integer | attribute | no | 01 |
| endday | process | srcperiod | integer | attribute | no | 31 |
| addons | process | srcperiod | integer | attribute | no | 0 |
| maxdaysaddons | process | srcperiod | integer | attribute | no | 0 |
| seasonstartmonth | process | srcperiod | integer | attribute | no | 0 |
| seasonendmonth | process | srcperiod | integer | attribute | no | 0 |
| seasonstartday | process | srcperiod | integer | attribute | no | 0 |
| seasonendday | process | srcperiod | integer | attribute | no | 0 |
| timestep | process | srcperiod | text | attribute | no | allscenes |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | xml |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | xml |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid |
| product | process | srccomp | text | attribute | no | anyid |
| folder | process | srccomp | text | attribute | no | orignal |
| band | process | srccomp | text | attribute | no | anyid |
| prefix | process | srccomp | text | attribute | no | anyid |
| suffix | process | srccomp | text | attribute | no | anyid |
| masked | process | srccomp | bool | attribute | no | N |
