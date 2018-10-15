---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-noheadercsvtodb
title: noheadercsvtodb
excerpt: No label set yet.
image: 
rootprocid: specimen
subprocid: noheadercsvtodb
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
  <parameters schema="txtstring" table="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <link csvaltcolumn="xyz" csvaltnodata="txtstring" csvcolumn="xyz" csvnodata="txtstring" dbcolumn="txtstring" format="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| schema | process | parameters | text | attribute | yes | --- |
| table | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | csv |
| datfiletype | process | srcpath | text | attribute | no | csv |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | src |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| csvcolumn | process | link | int | attribute | yes | --- |
| csvnodata | process | link | text | attribute | no | --- |
| csvaltcolumn | process | link | int | attribute | no | -99 |
| csvaltnodata | process | link | text | attribute | no | --- |
| format | process | link | text | attribute | no | --- |
| dbcolumn | process | link | text | attribute | yes | --- |
