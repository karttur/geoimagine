---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-userregionfromraster
title: userregionfromraster
excerpt: User regions are defined both in lat lon, and the original projection of the raster
image: 
rootprocid: ManageRegion
subprocid: userregionfromraster
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
  <parameters defid="txtstring" epsg="xyz" id="txtstring" projectid="txtstring" regname="txtstring">
    <regtitle>regtitle</regtitle>
    <reglabel>reglabel</reglabel>
    <raster>raster</raster>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| defid | process | parameters | text | attribute | yes | --- |
| id | process | parameters | text | attribute | yes | --- |
| projectid | process | parameters | text | attribute | yes | --- |
| regname | process | parameters | text | attribute | yes | --- |
| regtitle | process | parameters | text | tag | yes | --- |
| reglabel | process | parameters | text | tag | yes | --- |
| raster | process | parameters | text | tag | yes | --- |
| epsg | process | parameters | integer | attribute | yes | --- |
