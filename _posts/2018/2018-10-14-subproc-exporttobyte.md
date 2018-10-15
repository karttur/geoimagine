---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-exporttobyte
title: exporttobyte
excerpt: Export data to byte binary with color coding
image: 
rootprocid: Export
subprocid: exporttobyte
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
  <parameters dynamicmask="True/False" masknotnullin="xyz" movieframes="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" system="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <srcmask band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| dynamicmask | process | parameters | boolean | attribute | no | --- |
| masknotnullin | process | parameters | integer | attribute | no | 255 |
| movieframes | process | parameters | boolean | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| system | process | dstpath | text | attribute | no | EXPORT |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | main |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
| masked | process | srccomp | bool | attribute | no | Y |
| id | process | srcmask | text | attribute | yes | --- |
| source | process | srcmask | text | attribute | yes | --- |
| product | process | srcmask | text | attribute | yes | --- |
| folder | process | srcmask | text | attribute | yes | --- |
| band | process | srcmask | text | attribute | yes | mask |
| prefix | process | srcmask | text | attribute | yes | --- |
| suffix | process | srcmask | text | attribute | yes | --- |
