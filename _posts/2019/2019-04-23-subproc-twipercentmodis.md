---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-twipercentmodis
title: twipercentmodis
excerpt: No label set yet.
image: 
rootprocid: Scalar
subprocid: twipercentmodis
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
  <parameters constant="xyz.abc" divisor="xyz.abc" dstmax="xyz.abc" dstmin="xyz.abc" power="xyz.abc" powfac="xyz.abc" scalefac="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstcomp element="txtstring" parent="txtstring">
    <twipercent band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| constant | process | parameters | real | attribute | no | 4300 |
| divisor | process | parameters | real | attribute | no | 430 |
| power | process | parameters | real | attribute | no | 1.067 |
| powfac | process | parameters | real | attribute | no | 0.0086 |
| scalefac | process | parameters | real | attribute | no | 2 |
| dstmax | process | parameters | real | attribute | no | 200 |
| dstmin | process | parameters | real | attribute | no | 0 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | tif |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | no | --- |
| product | srccomp | anyid1 | text | attribute | no | --- |
| folder | srccomp | anyid1 | text | attribute | yes | vector |
| band | srccomp | anyid1 | text | attribute | yes | vector |
| prefix | srccomp | anyid1 | text | attribute | yes | vector |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | tif |
| twipercent | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | twipercent |
| source | dstcomp | twipercent | text | attribute | no | --- |
| product | dstcomp | twipercent | text | attribute | no | --- |
| folder | dstcomp | twipercent | text | attribute | yes | vector |
| band | dstcomp | twipercent | text | attribute | yes | vector |
| prefix | dstcomp | twipercent | text | attribute | yes | vector |
| suffix | dstcomp | twipercent | text | attribute | no | --- |
| cellnull | dstcomp | twipercent | integer | attribute | yes | --- |
| celltype | dstcomp | twipercent | text | attribute | yes | --- |
| scalefac | dstcomp | twipercent | real | attribute | yes | 1 |
| offsetadd | dstcomp | twipercent | integer | attribute | yes | 0 |
| dataunit | dstcomp | twipercent | text | attribute | yes | --- |
| measure | dstcomp | twipercent | text | attribute | yes | --- |
