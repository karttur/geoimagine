---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-setAssimilationModisRegion
title: setAssimilationModisRegion
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: setAssimilationModisRegion
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
  <parameters copycomp="txtstring" kernel="txtstring" maxthreshold="xyz.abc" minthreshold="xyz.abc" offsetadd="xyz.abc" scalefac="xyz.abc" suffix="txtstring" version="txtstring" wrap="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <timeseries band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| kernel | process | parameters | text | attribute | no | 0 |
| wrap | process | parameters | boolean | attribute | no | --- |
| maxthreshold | process | parameters | real | attribute | no | 0 |
| minthreshold | process | parameters | real | attribute | no | 0 |
| scalefac | process | parameters | real | attribute | no | 1 |
| offsetadd | process | parameters | real | attribute | no | 0 |
| copycomp | process | parameters | text | attribute | no | setassimilation |
| suffix | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| timeseries | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | timeseries |
| id | srccomp | timeseries | text | attribute | yes | --- |
| source | srccomp | timeseries | text | attribute | yes | --- |
| product | srccomp | timeseries | text | attribute | yes | --- |
| folder | srccomp | timeseries | text | attribute | yes | --- |
| band | srccomp | timeseries | text | attribute | yes | timeseries |
| prefix | srccomp | timeseries | text | attribute | no | --- |
| suffix | srccomp | timeseries | text | attribute | no | --- |
