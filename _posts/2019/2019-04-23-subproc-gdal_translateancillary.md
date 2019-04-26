---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-gdal_translateancillary
title: gdal_translateancillary
excerpt: No label set yet.
image: 
rootprocid: GdalUtilities
subprocid: gdal_translateancillary
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
  <parameters copycomp="txtstring" dst_max="xyz" dst_min="xyz" dst_region="txtstring" exponent="xyz.abc" resampling="txtstring" src_max="xyz" src_min="xyz" xres="xyz.abc" xsize="txtstring" yres="xyz.abc" ysize="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | gdaltranslate |
| dst_region | process | parameters | text | attribute | no | None |
| xsize | process | parameters | text | attribute | no | 0 |
| ysize | process | parameters | text | attribute | no | 0 |
| xres | process | parameters | real | attribute | no | 0 |
| yres | process | parameters | real | attribute | no | 0 |
| resampling | process | parameters | text | attribute | no | nearest |
| src_min | process | parameters | integer | attribute | no | 0 |
| src_max | process | parameters | integer | attribute | no | 0 |
| dst_min | process | parameters | integer | attribute | no | 0 |
| dst_max | process | parameters | integer | attribute | no | 0 |
| exponent | process | parameters | real | attribute | no | 0 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
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
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| source | dstcomp | anyid2 | text | attribute | no | src |
| product | dstcomp | anyid2 | text | attribute | no | src |
| folder | dstcomp | anyid2 | text | attribute | no | src |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | no | src |
| suffix | dstcomp | anyid2 | text | attribute | no | src |
| cellnull | dstcomp | anyid2 | integer | attribute | yes | --- |
| celltype | dstcomp | anyid2 | text | attribute | yes | --- |
| scalefac | dstcomp | anyid2 | real | attribute | yes | 1 |
| offsetadd | dstcomp | anyid2 | integer | attribute | yes | 0 |
| dataunit | dstcomp | anyid2 | text | attribute | yes | --- |
| measure | dstcomp | anyid2 | text | attribute | yes | --- |
