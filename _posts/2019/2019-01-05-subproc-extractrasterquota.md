---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-extractrasterquota
title: extractrasterquota
excerpt: Extract raster percent coverage
image: 
rootprocid: Extract
subprocid: extractrasterquota
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
  <parameters highlim="xyz.abc" hightype="txtstring" lowlim="xyz.abc" lowtype="txtstring" nominal="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| lowlim | process | parameters | real | attribute | no | 0 |
| highlim | process | parameters | real | attribute | no | 0 |
| lowtype | process | parameters | text | attribute | yes | --- |
| hightype | process | parameters | text | attribute | yes | --- |
| nominal | process | parameters | boolean | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | --- |
| product | process | srccomp | text | attribute | no | --- |
| folder | process | srccomp | text | attribute | no | --- |
| band | process | srccomp | text | attribute | no | raster |
| prefix | process | srccomp | text | attribute | no | --- |
| suffix | process | srccomp | text | attribute | no | --- |
