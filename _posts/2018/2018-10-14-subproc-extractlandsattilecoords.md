---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-extractlandsattilecoords
title: extractlandsattilecoords
excerpt: Extract Landsat WRS tile coordinates and add to db
image: 
rootprocid: LandsatProc
subprocid: extractlandsattilecoords
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
  <parameters centroid="True/False" dirfield="txtstring" pathfield="txtstring" rowfield="txtstring" wrs2="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| centroid | process | parameters | bool | attribute | yes | True |
| wrs2 | process | parameters | bool | attribute | no | True |
| dirfield | process | parameters | text | attribute | no | MODE |
| pathfield | process | parameters | text | attribute | no | PATH |
| rowfield | process | parameters | text | attribute | no | ROW |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| datfiletype | process | srcpath | text | attribute | no | shp |
| anyid | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid |
| source | srccomp | anyid | text | attribute | no | --- |
| product | srccomp | anyid | text | attribute | no | --- |
| folder | srccomp | anyid | text | attribute | yes | vector |
| band | srccomp | anyid | text | attribute | yes | vector |
| prefix | srccomp | anyid | text | attribute | yes | vector |
| suffix | srccomp | anyid | text | attribute | no | --- |
| system | srccomp | anyid | text | attribute | no | ancillary |
