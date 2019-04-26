---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-updatedbAncillary
title: updatedbAncillary
excerpt: Update
image: 
rootprocid: Updatedb
subprocid: updatedbAncillary
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
  <parameters dummy="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstcomp element="txtstring" parent="txtstring">
    <layer band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz.abc" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| dummy | process | parameters | text | attribute | no | dummy |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | layer |
| source | dstcomp | layer | text | attribute | yes | --- |
| product | dstcomp | layer | text | attribute | yes | --- |
| folder | dstcomp | layer | text | attribute | yes | --- |
| band | dstcomp | layer | text | attribute | yes | layer |
| prefix | dstcomp | layer | text | attribute | no | --- |
| suffix | dstcomp | layer | text | attribute | no | --- |
| celltype | dstcomp | layer | text | attribute | yes | raster |
| cellnull | dstcomp | layer | integer | attribute | yes | -9999 |
| scalefac | dstcomp | layer | real | attribute | no | 1 |
| offsetadd | dstcomp | layer | real | attribute | no | 0 |
| dataunit | dstcomp | layer | text | attribute | yes | 1 |
| measure | dstcomp | layer | text | attribute | yes | 0 |
