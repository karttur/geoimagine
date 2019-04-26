---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-fgbgmodisSingleTile
title: fgbgmodisSingleTile
excerpt: Prependicular foreground and background indexing
image: 
rootprocid: Image
subprocid: fgbgmodisSingleTile
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
  <parameters calibfac="xyz.abc" copycomp="txtstring" htile="xyz" intercept="xyz.abc" rescalefac="xyz.abc" slope="xyz.abc" version="txtstring" vtile="xyz"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| slope | process | parameters | real | attribute | yes | --- |
| intercept | process | parameters | real | attribute | yes | --- |
| rescalefac | process | parameters | real | attribute | yes | --- |
| calibfac | process | parameters | real | attribute | yes | --- |
| htile | process | parameters | integer | attribute | yes | --- |
| vtile | process | parameters | integer | attribute | yes | --- |
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
