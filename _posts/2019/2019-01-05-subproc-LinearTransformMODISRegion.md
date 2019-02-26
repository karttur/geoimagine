---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-LinearTransformMODISRegion
title: LinearTransformMODISRegion
excerpt: Create time series graph
image: 
rootprocid: Image
subprocid: LinearTransformMODISRegion
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
  <parameters copycomp="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </dstcomp>
  <transformoffset element="txtstring" parent="txtstring">
    <offset id="txtstring" offset="xyz.abc"/>
  </transformoffset>
  <transformscale element="txtstring" parent="txtstring">
    <scalefac compin="txtstring" compout="txtstring" id="txtstring" scalefac="xyz.abc"/>
  </transformscale>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| copycomp | process | parameters | text | attribute | no | anytoall |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| id | srccomp | anyid1 | text | attribute | no | --- |
| source | srccomp | anyid1 | text | attribute | no | --- |
| product | srccomp | anyid1 | text | attribute | no | --- |
| folder | srccomp | anyid1 | text | attribute | yes | anyid1 |
| band | srccomp | anyid1 | text | attribute | yes | anyid1 |
| prefix | srccomp | anyid1 | text | attribute | yes | anyid1 |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| system | srccomp | anyid1 | text | attribute | no | modis |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| id | dstcomp | anyid2 | text | attribute | no | --- |
| source | dstcomp | anyid2 | text | attribute | no | --- |
| product | dstcomp | anyid2 | text | attribute | no | --- |
| folder | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| suffix | dstcomp | anyid2 | text | attribute | no | --- |
| system | dstcomp | anyid2 | text | attribute | no | modis |
| offset | process | transformoffset | element | element | --- | --- |
| parent | process | transformoffset | text | attribute | no | process |
| element | process | transformoffset | text | attribute | no | offset |
| id | transformoffset | offset | text | attribute | no | --- |
| offset | transformoffset | offset | real | attribute | no | --- |
| scalefac | process | transformscale | element | element | --- | --- |
| parent | process | transformscale | text | attribute | no | process |
| element | process | transformscale | text | attribute | no | scalefac |
| id | transformscale | scalefac | text | attribute | no | --- |
| compin | transformscale | scalefac | text | attribute | yes | --- |
| compout | transformscale | scalefac | text | attribute | yes | --- |
| scalefac | transformscale | scalefac | real | attribute | yes | --- |
