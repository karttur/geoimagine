---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-explodemodisscene
title: explodemodisscene
excerpt: Scenes must be organized prior to extration
image: 
rootprocid: MODISProc
subprocid: explodemodisscene
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
  <parameters exploded="True/False" product="txtstring" redundant="True/False" replaceold="True/False" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| replaceold | process | parameters | bool | attribute | no | True |
| redundant | process | parameters | bool | attribute | no | --- |
| exploded | process | parameters | bool | attribute | no | True |
| product | process | parameters | text | attribute | yes | --- |
| version | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | hdf |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | original |
| band | process | srccomp | text | attribute | no | anyid1 |
| prefix | process | srccomp | text | attribute | no | anyid1 |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
| cellnull | process | srccomp | integer | attribute | no | -32768 |
| celltype | process | srccomp | text | attribute | no | anyid1 |
| scalefac | process | srccomp | real | attribute | no | 1 |
| offsetadd | process | srccomp | integer | attribute | no | 0 |
| dataunit | process | srccomp | text | attribute | no | anyid1 |
