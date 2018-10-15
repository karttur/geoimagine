---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-mosaic
title: mosaic
excerpt: No label set yet.
image: 
rootprocid: Mosaic
subprocid: mosaic
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
  <parameters celltype="txtstring" export="True/False" movieframes="True/False" overlay="txtstring" resample="txtstring" t_epsg="xyz" tr_xres="xyz.abc" tr_yres="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| overlay | process | parameters | text | attribute | no | mean |
| t_epsg | process | parameters | integer | attribute | no | 0 |
| tr_xres | process | parameters | real | attribute | no | 0 |
| tr_yres | process | parameters | real | attribute | no | 0 |
| resample | process | parameters | text | attribute | no | near |
| celltype | process | parameters | text | attribute | no | auto |
| export | process | parameters | bool | attribute | no | --- |
| movieframes | process | parameters | bool | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | image |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| masked | process | srccomp | bool | attribute | no | Y |
