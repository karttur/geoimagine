---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-extractmgrscoords
title: extractmgrscoords
excerpt: Extract Sentinel tile coordinates and add to db
image: 
rootprocid: SentinelProcess
subprocid: extractmgrscoords
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
  <parameters centroid="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| centroid | process | parameters | bool | attribute | yes | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | zip |
| datfiletype | process | srcpath | text | attribute | no | zip |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | no | --- |
| product | srccomp | anyid1 | text | attribute | no | --- |
| folder | srccomp | anyid1 | text | attribute | yes | vector |
| band | srccomp | anyid1 | text | attribute | yes | vector |
| prefix | srccomp | anyid1 | text | attribute | yes | vector |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| system | srccomp | anyid1 | text | attribute | no | ancillary |
