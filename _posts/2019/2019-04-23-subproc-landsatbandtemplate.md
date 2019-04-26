---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-landsatbandtemplate
title: landsatbandtemplate
excerpt: No label set yet.
image: 
rootprocid: LandsatProc
subprocid: landsatbandtemplate
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
  <parameters offsetadd="xyz.abc" scalefac="xyz.abc" sensat="txtstring" subtype="txtstring" typeid="txtstring">
    <band>band</band>
    <prefix>prefix</prefix>
    <pattern>pattern</pattern>
    <hdfgrid>hdfgrid</hdfgrid>
    <required>required</required>
    <celltype>celltype</celltype>
    <dataunit>dataunit</dataunit>
    <measure>measure</measure>
    <folder>folder</folder>
    <fileext>fileext</fileext>
    <suffix>suffix</suffix>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | yes | --- |
| typeid | process | parameters | text | attribute | yes | --- |
| subtype | process | parameters | text | attribute | yes | A |
| scalefac | process | parameters | real | attribute | yes | --- |
| offsetadd | process | parameters | real | attribute | yes | --- |
| band | process | parameters | text | tag | yes | --- |
| prefix | process | parameters | text | tag | yes | --- |
| pattern | process | parameters | text | tag | yes | --- |
| hdfgrid | process | parameters | text | tag | no | --- |
| required | process | parameters | text | tag | yes | --- |
| celltype | process | parameters | text | tag | yes | Byte |
| dataunit | process | parameters | text | tag | yes | --- |
| measure | process | parameters | text | tag | yes | --- |
| folder | process | parameters | text | tag | yes | --- |
| fileext | process | parameters | text | tag | yes | --- |
| suffix | process | parameters | text | tag | yes | --- |
