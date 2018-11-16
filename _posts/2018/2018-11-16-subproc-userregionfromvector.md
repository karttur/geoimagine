---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-userregionfromvector
title: userregionfromvector
excerpt: Only superuser can set default regions, send request it you really need a new default region category
image: 
rootprocid: ManageRegion
subprocid: userregionfromvector
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
  <parameters defid="txtstring" defname="txtstring" defparentid="txtstring" epsg="xyz" maxlat="xyz.abc" maxlon="xyz.abc" minlat="xyz.abc" minlon="xyz.abc" minuserstratum="xyz" regioncat="txtstring">
    <deftitle>deftitle</deftitle>
    <deflabel>deflabel</deflabel>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| defid | process | parameters | text | attribute | yes | --- |
| defname | process | parameters | text | attribute | yes | --- |
| regioncat | process | parameters | text | attribute | yes | --- |
| defparentid | process | parameters | text | attribute | yes | --- |
| minuserstratum | process | parameters | integer | attribute | yes | --- |
| deftitle | process | parameters | text | tag | yes | --- |
| deflabel | process | parameters | text | tag | yes | --- |
| minlon | process | parameters | real | attribute | yes | --- |
| maxlon | process | parameters | real | attribute | yes | --- |
| minlat | process | parameters | real | attribute | yes | --- |
| maxlat | process | parameters | real | attribute | yes | --- |
| epsg | process | parameters | integer | attribute | no | 4326 |
