---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-tractfromcoordcsv
title: tractfromcoordcsv
excerpt: User rtract are defined both in lat lon, and ay other epsg projection given by user
image: 
rootprocid: ManageRegion
subprocid: tractfromcoordcsv
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
  <parameters epsg="xyz" getmodtiles="True/False" getwrs="True/False" parentid="txtstring" public="True/False" roi="True/False" tractid="txtstring" tractname="txtstring"/>
  <srcfilepath filepath="txtstring" id="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz.abc" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz.abc" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| tractid | process | parameters | text | attribute | yes | --- |
| tractname | process | parameters | text | attribute | yes | --- |
| parentid | process | parameters | text | attribute | yes | --- |
| epsg | process | parameters | integer | attribute | yes | --- |
| roi | process | parameters | boolean | attribute | yes | True |
| public | process | parameters | boolean | attribute | yes | True |
| getwrs | process | parameters | boolean | attribute | yes | True |
| getmodtiles | process | parameters | boolean | attribute | yes | True |
| id | process | srcfilepath | text | attribute | no | filepath |
| filepath | process | srcfilepath | text | attribute | yes | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | shp |
| datfiletype | process | dstpath | text | attribute | no | --- |
| measure | process | srccomp | text | attribute | no | N |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | no | region |
| band | process | srccomp | text | attribute | yes | region |
| suffix | process | srccomp | text | attribute | no | --- |
| dataunit | process | srccomp | text | attribute | no | NA |
| scalefac | process | srccomp | real | attribute | no | 1.0 |
| offsetadd | process | srccomp | real | attribute | no | 0.0 |
| cellnull | process | srccomp | real | attribute | no | -99 |
| celltype | process | srccomp | string | attribute | no | vector |
