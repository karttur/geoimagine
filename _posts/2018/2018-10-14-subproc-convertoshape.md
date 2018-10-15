---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-convertoshape
title: convertoshape
excerpt: No label set yet.
image: 
rootprocid: SpatialDB
subprocid: convertoshape
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
  <parameters append="True/False" epsg="txtstring" ogrtype="txtstring" schema="txtstring" table="txtstring" union="True/False"/>
  <point x="txtstring" y="txtstring"/>
  <line x="txtstring" y="txtstring"/>
  <poly id="txtstring" llx="txtstring" lly="txtstring" lrx="txtstring" lry="txtstring" ulx="txtstring" uly="txtstring" urx="txtstring" ury="txtstring"/>
  <fielddef id="txtstring" keyfield="txtstring" name="txtstring" precision="xyz" source="txtstring" transfer="txtstring" type="txtstring" width="xyz"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| schema | process | parameters | text | attribute | yes | --- |
| table | process | parameters | text | attribute | yes | --- |
| epsg | process | parameters | text | attribute | no | 4326 |
| ogrtype | process | parameters | text | attribute | yes | point |
| union | process | parameters | bool | attribute | yes | --- |
| append | process | parameters | bool | attribute | yes | True |
| x | process | point | text | attribute | no | --- |
| y | process | point | text | attribute | no | --- |
| x | process | line | text | attribute | no | --- |
| y | process | line | text | attribute | no | --- |
| id | process | poly | text | attribute | yes | --- |
| ulx | process | poly | text | attribute | no | --- |
| uly | process | poly | text | attribute | no | --- |
| urx | process | poly | text | attribute | no | --- |
| ury | process | poly | text | attribute | no | --- |
| lrx | process | poly | text | attribute | no | --- |
| lry | process | poly | text | attribute | no | --- |
| llx | process | poly | text | attribute | no | --- |
| lly | process | poly | text | attribute | no | --- |
| id | process | fielddef | text | attribute | yes | --- |
| name | process | fielddef | text | attribute | yes | --- |
| type | process | fielddef | text | attribute | yes | --- |
| transfer | process | fielddef | text | attribute | yes | --- |
| source | process | fielddef | text | attribute | yes | --- |
| width | process | fielddef | integer | attribute | no | 8 |
| precision | process | fielddef | integer | attribute | no | 0 |
| keyfield | process | fielddef | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | shp |
| datfiletype | process | dstpath | text | attribute | no | shp |
| measure | process | srccomp | text | attribute | yes | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | dst |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| cellnull | process | srccomp | integer | attribute | no | --- |
| celltype | process | srccomp | text | attribute | no | --- |
| scalefac | process | srccomp | real | attribute | no | 1 |
| offsetadd | process | srccomp | integer | attribute | no | 0 |
| dataunit | process | srccomp | text | attribute | yes | --- |
