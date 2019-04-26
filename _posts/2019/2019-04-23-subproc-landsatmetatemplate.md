---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-landsatmetatemplate
title: landsatmetatemplate
excerpt: No label set yet.
image: 
rootprocid: LandsatProc
subprocid: landsatmetatemplate
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
  <parameters offsetadd="xyz" scalefac="xyz.abc" sensat="txtstring" subtype="txtstring" typeid="txtstring">
    <band>band</band>
    <prefix>prefix</prefix>
    <pattern>pattern</pattern>
    <folder>folder</folder>
    <fileext>fileext</fileext>
    <required>required</required>
    <dataunit>dataunit</dataunit>
    <measure>measure</measure>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | yes | --- |
| typeid | process | parameters | text | attribute | yes | --- |
| subtype | process | parameters | text | attribute | yes | A |
| scalefac | process | parameters | real | attribute | no | 1 |
| offsetadd | process | parameters | integer | attribute | no | 0 |
| band | process | parameters | text | tag | yes | --- |
| prefix | process | parameters | text | tag | yes | --- |
| pattern | process | parameters | text | tag | yes | --- |
| folder | process | parameters | text | tag | yes | --- |
| fileext | process | parameters | text | tag | yes | --- |
| required | process | parameters | text | tag | yes | --- |
| dataunit | process | parameters | text | tag | no | NA |
| measure | process | parameters | text | tag | no | N |
