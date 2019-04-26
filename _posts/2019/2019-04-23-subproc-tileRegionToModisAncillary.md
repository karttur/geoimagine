---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-tileRegionToModisAncillary
title: tileRegionToModisAncillary
excerpt: Tile regional data to fit modis
image: 
rootprocid: MODISProc
subprocid: tileRegionToModisAncillary
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
  <parameters asscript="True/False" celltype="txtstring" copycomp="txtstring" epsg="xyz" resample="txtstring" src_defregid="txtstring" suffix="txtstring" version="txtstring" xres="xyz.abc" yres="xyz.abc"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| asscript | process | parameters | boolean | attribute | no | True |
| src_defregid | process | parameters | text | attribute | yes | --- |
| epsg | process | parameters | integer | attribute | no | 6842 |
| xres | process | parameters | real | attribute | no | 463.313 |
| yres | process | parameters | real | attribute | no | 463.313 |
| resample | process | parameters | text | attribute | no | near |
| copycomp | process | parameters | text | attribute | no | 1to1 |
| suffix | process | parameters | text | attribute | no | copy |
| celltype | process | parameters | text | attribute | no | auto |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | no | --- |
| product | srccomp | anyid1 | text | attribute | no | --- |
| folder | srccomp | anyid1 | text | attribute | yes | --- |
| band | srccomp | anyid1 | text | attribute | yes | region |
| prefix | srccomp | anyid1 | text | attribute | yes | --- |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| system | srccomp | anyid1 | text | attribute | no | ancillary |
