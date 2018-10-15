---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-defaultregionextent
title: defaultregionextent
excerpt: Only superuser can set default regions, send request it you really need a new default region category
image: 
rootprocid: ManageRegion
subprocid: defaultregionextent
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
  <parameters defid="txtstring" maxlat="xyz.abc" maxlon="xyz.abc" minlat="xyz.abc" minlon="xyz.abc"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| defid | process | parameters | text | attribute | yes | --- |
| minlon | process | parameters | real | attribute | yes | --- |
| maxlon | process | parameters | real | attribute | yes | --- |
| minlat | process | parameters | real | attribute | yes | --- |
| maxlat | process | parameters | real | attribute | yes | --- |
