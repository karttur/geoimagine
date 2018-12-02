---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-rubsecondraster
title: rubsecondraster
excerpt: Special default processing
image: 
rootprocid: Special
subprocid: rubsecondraster
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
  <parameters combine="txtstring" erasor="txtstring" highlim="xyz.abc" hightype="txtstring" lowlim="xyz.abc" lowtype="txtstring" singles="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" id="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| erasor | process | parameters | text | attribute | yes | erasor |
| lowlim | process | parameters | real | attribute | yes | 0 |
| highlim | process | parameters | real | attribute | yes | 0 |
| lowtype | process | parameters | text | attribute | yes | eq |
| hightype | process | parameters | text | attribute | yes | eq |
| combine | process | parameters | text | attribute | no | none |
| singles | process | parameters | boolean | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| id | process | srccomp | text | attribute | yes | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | main |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| masked | process | srccomp | bool | attribute | yes | --- |
| cellnull | process | srccomp | integer | attribute | yes | --- |
| celltype | process | srccomp | text | attribute | yes | --- |
| scalefac | process | srccomp | real | attribute | yes | --- |
| offsetadd | process | srccomp | integer | attribute | yes | --- |
| dataunit | process | srccomp | text | attribute | yes | --- |
| measure | process | srccomp | text | attribute | yes | --- |
