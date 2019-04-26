---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-resampletsmodis
title: resampletsmodis
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: resampletsmodis
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
  <parameters copycomp="txtstring" method="txtstring" targettimestep="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" timestep="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring" timestep="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | resamplets |
| targettimestep | process | parameters | text | attribute | no | A |
| method | process | parameters | text | attribute | no | avg |
| version | process | parameters | text | attribute | no | 1.3 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | yes | --- |
| product | srccomp | anyid1 | text | attribute | yes | --- |
| folder | srccomp | anyid1 | text | attribute | yes | --- |
| band | srccomp | anyid1 | text | attribute | yes | anyid1 |
| prefix | srccomp | anyid1 | text | attribute | no | --- |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| timestep | srccomp | anyid1 | text | attribute | yes | --- |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid1 |
| source | dstcomp | anyid2 | text | attribute | no | src |
| product | dstcomp | anyid2 | text | attribute | no | src |
| folder | dstcomp | anyid2 | text | attribute | no | auto |
| band | dstcomp | anyid2 | text | attribute | no | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | no | src |
| suffix | dstcomp | anyid2 | text | attribute | no | auto |
| timestep | dstcomp | anyid2 | text | attribute | yes | --- |
| masked | dstcomp | anyid2 | bool | attribute | no | Y |
| cellnull | dstcomp | anyid2 | integer | attribute | no | -2222 |
| celltype | dstcomp | anyid2 | text | attribute | no | src |
| scalefac | dstcomp | anyid2 | real | attribute | no | 1 |
| offsetadd | dstcomp | anyid2 | integer | attribute | no | 0 |
| dataunit | dstcomp | anyid2 | text | attribute | no | src |
