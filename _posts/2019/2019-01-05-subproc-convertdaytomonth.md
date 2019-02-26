---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-convertdaytomonth
title: convertdaytomonth
excerpt: Convert data with daily values to monthly values using pandas
image: 
rootprocid: Scalar
subprocid: convertdaytomonth
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
  <parameters algebra="txtstring" copycomp="txtstring" factor="xyz.abc" offset="xyz.abc"/>
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
| factor | process | parameters | real | attribute | no | 1 |
| offset | process | parameters | real | attribute | no | 0 |
| algebra | process | parameters | text | attribute | no | add |
| copycomp | process | parameters | text | attribute | no | DtoMdataunits |
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
| cellnull | dstcomp | anyid2 | integer | attribute | yes | --- |
| celltype | dstcomp | anyid2 | text | attribute | yes | --- |
| scalefac | dstcomp | anyid2 | real | attribute | yes | --- |
| offsetadd | dstcomp | anyid2 | integer | attribute | yes | --- |
| dataunit | dstcomp | anyid2 | text | attribute | yes | --- |
| measure | dstcomp | anyid2 | text | attribute | yes | --- |
