---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-fractionadjustsmapoverlay
title: fractionadjustsmapoverlay
excerpt: No label set yet.
image: 
rootprocid: Overlay
subprocid: fractionadjustsmapoverlay
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
  <parameters copycomp="txtstring" dstmax="xyz.abc" dstweight="xyz.abc" method="txtstring" nullaszero="True/False" template="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <layer1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <fraction band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | template |
| template | process | parameters | text | attribute | yes | srccomp |
| version | process | parameters | text | attribute | no | 1.3 |
| method | process | parameters | text | attribute | no | insidefrac |
| nullaszero | process | parameters | boolean | attribute | no | --- |
| dstmax | process | parameters | real | attribute | no | -32768 |
| dstweight | process | parameters | real | attribute | no | 1 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer1 |
| fraction | process | srccomp | element | element | --- | --- |
| id | srccomp | layer1 | text | attribute | yes | layer1 |
| source | srccomp | layer1 | text | attribute | yes | --- |
| product | srccomp | layer1 | text | attribute | yes | --- |
| folder | srccomp | layer1 | text | attribute | yes | --- |
| band | srccomp | layer1 | text | attribute | yes | layer1 |
| prefix | srccomp | layer1 | text | attribute | no | --- |
| suffix | srccomp | layer1 | text | attribute | no | --- |
| id | srccomp | fraction | text | attribute | yes | fraction |
| source | srccomp | fraction | text | attribute | yes | --- |
| product | srccomp | fraction | text | attribute | yes | --- |
| folder | srccomp | fraction | text | attribute | yes | --- |
| band | srccomp | fraction | text | attribute | yes | fraction |
| prefix | srccomp | fraction | text | attribute | no | --- |
| suffix | srccomp | fraction | text | attribute | no | --- |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| source | dstcomp | anyid2 | text | attribute | no | src |
| product | dstcomp | anyid2 | text | attribute | no | src |
| folder | dstcomp | anyid2 | text | attribute | no | src |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | no | src |
| suffix | dstcomp | anyid2 | text | attribute | no | src |
