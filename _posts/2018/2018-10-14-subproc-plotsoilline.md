---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-plotsoilline
title: plotsoilline
excerpt: Plot soil lines, including specimen local points and candidates
image: 
rootprocid: specimen
subprocid: plotsoilline
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
  <parameters candidates="True/False" slmethod="txtstring" soilline="txtstring" specimensoil="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <dstband bandid="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| specimensoil | process | parameters | bool | attribute | no | 100 |
| candidates | process | parameters | bool | attribute | no | 2 |
| soilline | process | parameters | text | attribute | no | scene |
| slmethod | process | parameters | text | attribute | no | pvipbidefault |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid |
| product | process | srccomp | text | attribute | no | anyid |
| folder | process | srccomp | text | attribute | no | srfi |
| band | process | srccomp | text | attribute | no | allbands |
| prefix | process | srccomp | text | attribute | no | anyid |
| suffix | process | srccomp | text | attribute | no | anyid |
| masked | process | srccomp | bool | attribute | no | N |
| bandid | process | dstband | text | attribute | no | --- |
