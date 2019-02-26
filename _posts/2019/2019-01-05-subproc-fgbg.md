---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-fgbg
title: fgbg
excerpt: Prependicular foreground and background indexing
image: 
rootprocid: Image
subprocid: fgbg
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
  <parameters calibfac="xyz.abc" intercept="xyz.abc" rescalefac="xyz.abc" slope="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  <srcband band="txtstring" id="txtstring" prefix="txtstring"/>
  <dstband band="txtstring" id="txtstring" prefix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| slope | process | parameters | real | attribute | yes | --- |
| intercept | process | parameters | real | attribute | yes | --- |
| rescalefac | process | parameters | real | attribute | yes | --- |
| calibfac | process | parameters | real | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | anyid1 |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| masked | process | srccomp | bool | attribute | no | Y |
| measure | process | srccomp | text | attribute | yes | --- |
| cellnull | process | srccomp | integer | attribute | yes | --- |
| celltype | process | srccomp | text | attribute | yes | --- |
| scalefac | process | srccomp | real | attribute | yes | 1 |
| offsetadd | process | srccomp | integer | attribute | yes | 0 |
| dataunit | process | srccomp | text | attribute | yes | --- |
| id | process | srcband | text | attribute | yes | --- |
| band | process | srcband | text | attribute | yes | --- |
| prefix | process | srcband | text | attribute | yes | --- |
| id | process | dstband | text | attribute | yes | --- |
| band | process | dstband | text | attribute | yes | --- |
| prefix | process | dstband | text | attribute | yes | --- |
