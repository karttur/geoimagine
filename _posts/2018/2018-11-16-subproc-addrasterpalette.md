---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
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
  <parameters access="txtstring" compid="txtstring" default="True/False" element="txtstring" palette="txtstring" parent="txtstring">
    <setcolor alpha="xyz" blue="xyz" green="xyz" hint="txtstring" id="xyz" label="txtstring" red="xyz"/>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| palette | process | parameters | text | attribute | yes | --- |
| compid | process | parameters | text | attribute | yes | --- |
| access | process | parameters | text | attribute | no | A |
| default | process | parameters | bool | attribute | no | --- |
| setcolor | process | parameters | element | element | --- | --- |
| parent | process | parameters | text | attribute | no | process |
| element | process | parameters | text | attribute | no | setcolor |
| id | parameters | setcolor | integer | attribute | yes | --- |
| red | parameters | setcolor | integer | attribute | yes | --- |
| green | parameters | setcolor | integer | attribute | yes | --- |
| blue | parameters | setcolor | integer | attribute | yes | --- |
| alpha | parameters | setcolor | integer | attribute | yes | --- |
| label | parameters | setcolor | string | attribute | yes | --- |
| hint | parameters | setcolor | string | attribute | yes | --- |
