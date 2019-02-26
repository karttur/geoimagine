---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-userregionfromcoord
title: userregionfromcoord
excerpt: User regions are defined both in lat lon, and ay other epsg projection given by user
image: 
rootprocid: ManageRegion
subprocid: userregionfromcoord
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
  <parameters epsg="xyz" extentsource="txtstring" maxx="xyz.abc" maxy="xyz.abc" minx="xyz.abc" miny="xyz.abc"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| extentsource | process | parameters | text | attribute | yes | coords |
| epsg | process | parameters | integer | attribute | yes | --- |
| minx | process | parameters | float | attribute | yes | --- |
| miny | process | parameters | float | attribute | yes | --- |
| maxx | process | parameters | float | attribute | yes | --- |
| maxy | process | parameters | float | attribute | yes | --- |
