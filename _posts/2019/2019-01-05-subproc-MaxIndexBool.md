---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-MaxIndexBool
title: MaxIndexBool
excerpt: No label set yet.
image: 
rootprocid: MapCalc
subprocid: MaxIndexBool
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
  <parameters boolband="txtstring" indexband="txtstring" trend="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <indexband band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <boolband band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| trend | process | parameters | text | attribute | yes | --- |
| indexband | process | parameters | text | attribute | no | 1.96 |
| boolband | process | parameters | text | attribute | no | 1.96 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | indexband | text | attribute | yes | --- |
| product | process | indexband | text | attribute | yes | --- |
| folder | process | indexband | text | attribute | yes | --- |
| band | process | indexband | text | attribute | yes | zvalue |
| prefix | process | indexband | text | attribute | yes | --- |
| suffix | process | indexband | text | attribute | yes | --- |
| masked | process | indexband | bool | attribute | no | Y |
| source | process | boolband | text | attribute | yes | --- |
| product | process | boolband | text | attribute | yes | --- |
| folder | process | boolband | text | attribute | yes | --- |
| band | process | boolband | text | attribute | yes | slope |
| prefix | process | boolband | text | attribute | yes | --- |
| suffix | process | boolband | text | attribute | yes | --- |
| masked | process | boolband | bool | attribute | no | Y |
| measure | process | srccomp | text | attribute | yes | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | index |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| cellnull | process | srccomp | integer | attribute | yes | --- |
| celltype | process | srccomp | text | attribute | yes | --- |
| scalefac | process | srccomp | real | attribute | yes | 1 |
| offsetadd | process | srccomp | integer | attribute | yes | 0 |
| dataunit | process | srccomp | text | attribute | yes | --- |
