---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-LandformTPIModis
title: LandformTPIModis
excerpt: No label set yet.
image: 
rootprocid: DEM
subprocid: LandformTPIModis
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
  <parameters expanded="True/False" slopethreshold="xyz.abc" standardize="True/False" tpilstd="xyz.abc" tpisstd="xyz.abc" tpithreshold="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" id="txtstring" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| expanded | process | parameters | boolean | attribute | no | --- |
| standardize | process | parameters | boolean | attribute | no | --- |
| tpisstd | process | parameters | real | attribute | no | 30 |
| tpilstd | process | parameters | real | attribute | no | 50 |
| tpithreshold | process | parameters | real | attribute | no | 25.0 |
| slopethreshold | process | parameters | real | attribute | no | 3.6 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| id | srccomp | anyid1 | text | attribute | yes | --- |
| source | srccomp | anyid1 | text | attribute | no | --- |
| product | srccomp | anyid1 | text | attribute | no | --- |
| folder | srccomp | anyid1 | text | attribute | yes | anyid1 |
| band | srccomp | anyid1 | text | attribute | yes | anyid1 |
| prefix | srccomp | anyid1 | text | attribute | yes | anyid1 |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| id | dstcomp | anyid2 | text | attribute | no | landform |
| source | dstcomp | anyid2 | text | attribute | no | --- |
| product | dstcomp | anyid2 | text | attribute | no | --- |
| folder | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| suffix | dstcomp | anyid2 | text | attribute | no | --- |
| measure | dstcomp | anyid2 | text | attribute | no | N |
| cellnull | dstcomp | anyid2 | integer | attribute | no | 255 |
| celltype | dstcomp | anyid2 | text | attribute | no | Byte |
| scalefac | dstcomp | anyid2 | real | attribute | no | 1 |
| offsetadd | dstcomp | anyid2 | integer | attribute | no | 0 |
| dataunit | dstcomp | anyid2 | text | attribute | no | classes |
