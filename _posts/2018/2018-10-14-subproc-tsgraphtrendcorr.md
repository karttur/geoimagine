---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-tsgraphtrendcorr
title: tsgraphtrendcorr
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: tsgraphtrendcorr
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
  <parameters decompose="txtstring" forceseason="True/False" kernel="txtstring" periodfactor="xyz" splineseason="True/False" trend="txtstring" version="txtstring" x="xyz.abc" y="xyz.abc"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <index bandid="txtstring" id="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| x | process | parameters | real | attribute | no | 0 |
| y | process | parameters | real | attribute | no | 0 |
| trend | process | parameters | text | attribute | no | spline |
| kernel | process | parameters | text | attribute | no | 0 |
| forceseason | process | parameters | boolean | attribute | no | --- |
| decompose | process | parameters | text | attribute | no | trend |
| splineseason | process | parameters | bool | attribute | no | --- |
| periodfactor | process | parameters | integer | attribute | no | 5 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid |
| product | process | srccomp | text | attribute | no | anyid |
| folder | process | srccomp | text | attribute | no | auto |
| band | process | srccomp | text | attribute | yes | anyid |
| prefix | process | srccomp | text | attribute | no | auto |
| suffix | process | srccomp | text | attribute | no | auto |
| masked | process | srccomp | bool | attribute | no | N |
| id | process | index | text | attribute | yes | --- |
| bandid | process | index | text | attribute | yes | --- |
