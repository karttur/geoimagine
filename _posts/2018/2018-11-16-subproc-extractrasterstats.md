---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-extractrasterstats
title: extractrasterstats
excerpt: Extract raster statistics
image: 
rootprocid: Extract
subprocid: extractrasterstats
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
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | --- |
| product | process | srccomp | text | attribute | no | --- |
| folder | process | srccomp | text | attribute | no | --- |
| band | process | srccomp | text | attribute | no | raster |
| prefix | process | srccomp | text | attribute | no | --- |
| suffix | process | srccomp | text | attribute | no | --- |
