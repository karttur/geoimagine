---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-specialprocesses
title: specialprocesses
excerpt: Special default processing
image: 
rootprocid: Special
subprocid: specialprocesses
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
  <parameters specialprocess="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srcband band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <dstband band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" id="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| specialprocess | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| id | process | srcband | text | attribute | yes | --- |
| source | process | srcband | text | attribute | yes | --- |
| product | process | srcband | text | attribute | yes | --- |
| folder | process | srcband | text | attribute | yes | --- |
| band | process | srcband | text | attribute | yes | --- |
| prefix | process | srcband | text | attribute | yes | --- |
| suffix | process | srcband | text | attribute | yes | --- |
| id | process | dstband | text | attribute | yes | --- |
| source | process | dstband | text | attribute | yes | --- |
| product | process | dstband | text | attribute | yes | --- |
| folder | process | dstband | text | attribute | yes | --- |
| band | process | dstband | text | attribute | yes | a |
| prefix | process | dstband | text | attribute | yes | --- |
| suffix | process | dstband | text | attribute | yes | --- |
| masked | process | dstband | bool | attribute | yes | --- |
| cellnull | process | dstband | integer | attribute | yes | --- |
| celltype | process | dstband | text | attribute | yes | --- |
| scalefac | process | dstband | real | attribute | yes | --- |
| offsetadd | process | dstband | integer | attribute | yes | --- |
| dataunit | process | dstband | text | attribute | yes | --- |
| measure | process | dstband | text | attribute | yes | --- |
