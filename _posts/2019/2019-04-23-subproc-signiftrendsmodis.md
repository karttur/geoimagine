---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-signiftrendsmodis
title: signiftrendsmodis
excerpt: Significant trends
image: 
rootprocid: OverlaySpecial
subprocid: signiftrendsmodis
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
  <parameters basename="txtstring" copycomp="txtstring" neg="True/False" onlysignif="True/False" pos="True/False" threshold="xyz.abc"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <significance band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <slope band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <intercept band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | signiftrend |
| basename | process | parameters | text | attribute | yes | --- |
| threshold | process | parameters | real | attribute | yes | 1.96 |
| neg | process | parameters | boolean | attribute | no | True |
| pos | process | parameters | boolean | attribute | no | True |
| onlysignif | process | parameters | boolean | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| significance | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | significance |
| slope | process | srccomp | element | element | --- | --- |
| intercept | process | srccomp | element | element | --- | --- |
| id | srccomp | significance | text | attribute | yes | significance |
| source | srccomp | significance | text | attribute | yes | --- |
| product | srccomp | significance | text | attribute | yes | --- |
| folder | srccomp | significance | text | attribute | yes | --- |
| band | srccomp | significance | text | attribute | yes | significance |
| prefix | srccomp | significance | text | attribute | no | --- |
| suffix | srccomp | significance | text | attribute | no | --- |
| id | srccomp | slope | text | attribute | yes | slope |
| source | srccomp | slope | text | attribute | yes | --- |
| product | srccomp | slope | text | attribute | yes | --- |
| folder | srccomp | slope | text | attribute | yes | --- |
| band | srccomp | slope | text | attribute | yes | slope |
| prefix | srccomp | slope | text | attribute | no | --- |
| suffix | srccomp | slope | text | attribute | no | --- |
| id | srccomp | intercept | text | attribute | yes | intercept |
| source | srccomp | intercept | text | attribute | yes | --- |
| product | srccomp | intercept | text | attribute | yes | --- |
| folder | srccomp | intercept | text | attribute | yes | --- |
| band | srccomp | intercept | text | attribute | yes | intercept |
| prefix | srccomp | intercept | text | attribute | no | --- |
| suffix | srccomp | intercept | text | attribute | no | --- |
