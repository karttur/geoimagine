---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-trendmask
title: trendmask
excerpt: No label set yet.
image: 
rootprocid: Masking
subprocid: trendmask
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
  <parameters maskdown="True/False" notnull="True/False" nullmask="True/False" threshold="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| nullmask | process | parameters | bool | attribute | no | Y |
| threshold | process | parameters | real | attribute | no | 0 |
| maskdown | process | parameters | boolean | attribute | no | Y |
| notnull | process | parameters | boolean | attribute | no | 0 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | auto |
| band | process | srccomp | text | attribute | yes | src |
| prefix | process | srccomp | text | attribute | no | auto |
| suffix | process | srccomp | text | attribute | no | auto |
| masked | process | srccomp | bool | attribute | no | N |
| cellnull | process | srccomp | integer | attribute | no | 0 |
| celltype | process | srccomp | text | attribute | no | Byte |
| scalefac | process | srccomp | real | attribute | no | 1 |
| offsetadd | process | srccomp | integer | attribute | no | 0 |
| dataunit | process | srccomp | text | attribute | no | mask |
| measure | process | srccomp | text | attribute | no | N |
