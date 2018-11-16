---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-signiftrendsancillary
title: signiftrendsancillary
excerpt: Significant trends
image: 
rootprocid: TimeSeries
subprocid: signiftrendsancillary
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
    <timeseries band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <seasonal band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <layer3 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
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
| timeseries | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | timeseries |
| seasonal | process | srccomp | element | element | --- | --- |
| layer3 | process | srccomp | element | element | --- | --- |
| id | srccomp | timeseries | text | attribute | yes | significance |
| source | srccomp | timeseries | text | attribute | yes | --- |
| product | srccomp | timeseries | text | attribute | yes | --- |
| folder | srccomp | timeseries | text | attribute | yes | --- |
| band | srccomp | timeseries | text | attribute | yes | timeseries |
| prefix | srccomp | timeseries | text | attribute | no | --- |
| suffix | srccomp | timeseries | text | attribute | no | --- |
| id | srccomp | seasonal | text | attribute | yes | slope |
| source | srccomp | seasonal | text | attribute | yes | --- |
| product | srccomp | seasonal | text | attribute | yes | --- |
| folder | srccomp | seasonal | text | attribute | yes | --- |
| band | srccomp | seasonal | text | attribute | yes | seasonal |
| prefix | srccomp | seasonal | text | attribute | no | --- |
| suffix | srccomp | seasonal | text | attribute | no | --- |
| id | srccomp | layer3 | text | attribute | yes | intercept |
| source | srccomp | layer3 | text | attribute | yes | --- |
| product | srccomp | layer3 | text | attribute | yes | --- |
| folder | srccomp | layer3 | text | attribute | yes | --- |
| band | srccomp | layer3 | text | attribute | yes | layer3 |
| prefix | srccomp | layer3 | text | attribute | no | --- |
| suffix | srccomp | layer3 | text | attribute | no | --- |
