---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-addrasterpalette
title: addrasterpalette
excerpt: Add raster palette
image: 
rootprocid: LayoutProc
subprocid: addrasterpalette
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
  <parameters compid="txtstring" palette="txtstring"/>
  <setcolor alpha="xyz" blue="xyz" green="xyz" hint="txtstring" id="xyz" label="txtstring" red="xyz" value="xyz"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| palette | process | parameters | text | attribute | yes | --- |
| compid | process | parameters | text | attribute | yes | --- |
| id | process | setcolor | integer | attribute | yes | --- |
| value | process | setcolor | integer | attribute | yes | --- |
| red | process | setcolor | integer | attribute | yes | --- |
| green | process | setcolor | integer | attribute | yes | --- |
| blue | process | setcolor | integer | attribute | yes | --- |
| alpha | process | setcolor | integer | attribute | yes | --- |
| label | process | setcolor | string | attribute | yes | --- |
| hint | process | setcolor | string | attribute | yes | --- |
