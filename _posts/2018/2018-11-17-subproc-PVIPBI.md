---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-PVIPBI
title: PVIPBI
excerpt: PVI and PBI are mapped using global default values for the soil line
image: 
rootprocid: VegetationIndex
subprocid: PVIPBI
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
  <parameters mask="txtstring" objective="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| mask | process | parameters | text | attribute | no | dbmask |
| objective | process | parameters | text | attribute | yes | map |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | SRFI |
| band | process | srccomp | text | attribute | no | RL |
| prefix | process | srccomp | text | attribute | no | RL-SRFI |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
| cellnull | process | srccomp | integer | attribute | no | -32768 |
| celltype | process | srccomp | text | attribute | no | Int16 |
| scalefac | process | srccomp | real | attribute | no | 0.0001 |
| offsetadd | process | srccomp | integer | attribute | no | 1000 |
| dataunit | process | srccomp | text | attribute | no | PVI |
| measure | process | srccomp | text | attribute | no | I |
