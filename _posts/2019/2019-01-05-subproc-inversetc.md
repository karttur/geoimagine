---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-inversetc
title: inversetc
excerpt: Inverse Tasseled cap transformation
image: 
rootprocid: Image
subprocid: inversetc
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
  <parameters bounds="txtstring" offset="True/False" srcdata="txtstring" srcmethod="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  <offset endmember="txtstring" id="txtstring" include="True/False" libendmember="True/False"/>
  <tc endmember="txtstring" id="txtstring" libendmember="True/False" tcid="txtstring" tcnr="xyz"/>
  <srcband bandid="txtstring" id="txtstring" order="xyz"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| offset | process | parameters | bool | attribute | yes | --- |
| srcmethod | process | parameters | text | attribute | yes | --- |
| srcdata | process | parameters | text | attribute | no | srfi |
| bounds | process | parameters | text | attribute | yes | wholescene |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | tasscap |
| band | process | srccomp | text | attribute | no | allbands |
| prefix | process | srccomp | text | attribute | no | anyid1 |
| suffix | process | srccomp | text | attribute | yes | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
| cellnull | process | srccomp | integer | attribute | no | -32768 |
| celltype | process | srccomp | text | attribute | no | Int16 |
| scalefac | process | srccomp | real | attribute | no | 0.0001 |
| offsetadd | process | srccomp | integer | attribute | no | 0 |
| dataunit | process | srccomp | text | attribute | no | reflectance |
| measure | process | srccomp | text | attribute | no | R |
| id | process | offset | text | attribute | yes | --- |
| endmember | process | offset | text | attribute | yes | --- |
| libendmember | process | offset | bool | attribute | yes | --- |
| include | process | offset | bool | attribute | yes | --- |
| id | process | tc | text | attribute | yes | --- |
| endmember | process | tc | text | attribute | yes | --- |
| tcid | process | tc | text | attribute | yes | --- |
| tcnr | process | tc | integer | attribute | yes | --- |
| libendmember | process | tc | bool | attribute | yes | --- |
| id | process | srcband | text | attribute | yes | --- |
| bandid | process | srcband | text | attribute | yes | --- |
| order | process | srcband | integer | attribute | yes | --- |
