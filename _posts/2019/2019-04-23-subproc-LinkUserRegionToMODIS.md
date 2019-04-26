---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-LinkUserRegionToMODIS
title: LinkUserRegionToMODIS
excerpt: Link User Region to MODIS tiles
image: 
rootprocid: MODISProc
subprocid: LinkUserRegionToMODIS
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
  <parameters dummy="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <layer1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <layer2 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| dummy | process | parameters | bool | attribute | no | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| datfiletype | process | srcpath | text | attribute | no | shp |
| layer1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer1 |
| layer2 | process | srccomp | element | element | --- | --- |
| id | srccomp | layer1 | text | attribute | yes | region |
| source | srccomp | layer1 | text | attribute | yes | --- |
| product | srccomp | layer1 | text | attribute | yes | --- |
| folder | srccomp | layer1 | text | attribute | yes | --- |
| band | srccomp | layer1 | text | attribute | yes | layer1 |
| prefix | srccomp | layer1 | text | attribute | no | --- |
| suffix | srccomp | layer1 | text | attribute | no | --- |
| id | srccomp | layer2 | text | attribute | yes | tiles |
| source | srccomp | layer2 | text | attribute | yes | --- |
| product | srccomp | layer2 | text | attribute | yes | --- |
| folder | srccomp | layer2 | text | attribute | yes | --- |
| band | srccomp | layer2 | text | attribute | yes | layer2 |
| prefix | srccomp | layer2 | text | attribute | no | --- |
| suffix | srccomp | layer2 | text | attribute | no | --- |
