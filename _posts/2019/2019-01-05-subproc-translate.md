---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-translate
title: translate
excerpt: No label set yet.
image: 
rootprocid: Convert
subprocid: translate
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
  <parameters dst_max="xyz" dst_min="xyz" exponent="xyz.abc" lrx="xyz.abc" lry="xyz.abc" resampling="txtstring" src_max="xyz" src_min="xyz" src_region="txtstring" ulx="xyz.abc" uly="xyz.abc" xres="xyz.abc" xsize="txtstring" yres="xyz.abc" ysize="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| src_region | process | parameters | text | attribute | no | None |
| ulx | process | parameters | real | attribute | no | 0 |
| uly | process | parameters | real | attribute | no | 0 |
| lrx | process | parameters | real | attribute | no | 0 |
| lry | process | parameters | real | attribute | no | 0 |
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
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | --- |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | src |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| measure | process | srccomp | text | attribute | yes | --- |
| cellnull | process | srccomp | integer | attribute | yes | --- |
| celltype | process | srccomp | text | attribute | yes | --- |
| dataunit | process | srccomp | text | attribute | yes | --- |
