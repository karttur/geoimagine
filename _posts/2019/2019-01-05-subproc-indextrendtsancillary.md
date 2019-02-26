---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-indextrendtsancillary
title: indextrendtsancillary
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: indextrendtsancillary
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
  <parameters decompose="txtstring" forceseason="True/False" indexcomp="True/False" kernel="txtstring" periodfactor="xyz" splineseason="True/False" trend="txtstring" version="txtstring" xcrossdetrended="True/False" xcrosseason="True/False" xcrosslag="True/False" xcrosslongtrend="True/False" xcrossmax="True/False" xcrosspearson="True/False" xcrossresidual="True/False" xcrosstrend="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <index band="txtstring" id="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| trend | process | parameters | text | attribute | no | spline |
| periodfactor | process | parameters | integer | attribute | no | 4 |
| decompose | process | parameters | text | attribute | no | trend |
| splineseason | process | parameters | bool | attribute | no | --- |
| kernel | process | parameters | text | attribute | no | 0 |
| forceseason | process | parameters | boolean | attribute | no | --- |
| xcrosseason | process | parameters | boolean | attribute | no | --- |
| xcrosslongtrend | process | parameters | boolean | attribute | no | --- |
| xcrosstrend | process | parameters | boolean | attribute | no | --- |
| xcrossresidual | process | parameters | boolean | attribute | no | --- |
| xcrossdetrended | process | parameters | boolean | attribute | no | --- |
| xcrosspearson | process | parameters | boolean | attribute | no | True |
| xcrossmax | process | parameters | boolean | attribute | no | --- |
| xcrosslag | process | parameters | boolean | attribute | no | --- |
| indexcomp | process | parameters | boolean | attribute | no | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | yes | --- |
| product | srccomp | anyid1 | text | attribute | yes | --- |
| folder | srccomp | anyid1 | text | attribute | yes | --- |
| band | srccomp | anyid1 | text | attribute | yes | anyid1 |
| prefix | srccomp | anyid1 | text | attribute | no | --- |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| id | process | index | text | attribute | yes | --- |
| band | process | index | text | attribute | yes | --- |
