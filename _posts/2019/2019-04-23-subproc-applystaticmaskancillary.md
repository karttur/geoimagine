---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-applystaticmaskancillary
title: applystaticmaskancillary
excerpt: No label set yet.
image: 
rootprocid: Masking
subprocid: applystaticmaskancillary
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
    <layer band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" timestep="txtstring"/>
    <mask band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" timestep="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | applystaticmask |
| version | process | parameters | text | attribute | no | 1.3 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer |
| mask | process | srccomp | element | element | --- | --- |
| id | srccomp | layer | text | attribute | yes | layer |
| source | srccomp | layer | text | attribute | yes | --- |
| product | srccomp | layer | text | attribute | yes | --- |
| folder | srccomp | layer | text | attribute | yes | --- |
| band | srccomp | layer | text | attribute | yes | layer |
| prefix | srccomp | layer | text | attribute | no | --- |
| suffix | srccomp | layer | text | attribute | no | --- |
| timestep | srccomp | layer | text | attribute | yes | --- |
| id | srccomp | mask | text | attribute | yes | mask |
| source | srccomp | mask | text | attribute | yes | --- |
| product | srccomp | mask | text | attribute | yes | --- |
| folder | srccomp | mask | text | attribute | yes | --- |
| band | srccomp | mask | text | attribute | yes | mask |
| prefix | srccomp | mask | text | attribute | no | --- |
| suffix | srccomp | mask | text | attribute | no | --- |
| timestep | srccomp | mask | text | attribute | no | static |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| source | dstcomp | anyid2 | text | attribute | no | src |
| product | dstcomp | anyid2 | text | attribute | no | src |
| folder | dstcomp | anyid2 | text | attribute | no | src |
| band | dstcomp | anyid2 | text | attribute | no | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | no | src |
| suffix | dstcomp | anyid2 | text | attribute | no | auto |
