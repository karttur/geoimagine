---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-seasonaltrendcorr
title: seasonaltrendcorr
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: seasonaltrendcorr
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
  <parameters decompose="txtstring" forceseason="True/False" group="True/False" indexcomp="True/False" invert="True/False" kernel="txtstring" method="txtstring" period="txtstring" periodfactor="xyz" resample="txtstring" splineseason="True/False" trend="txtstring" version="txtstring" xcrossdetrended="True/False" xcrosseason="True/False" xcrosslag="True/False" xcrosslongtrend="True/False" xcrossmax="True/False" xcrosspearson="True/False" xcrossresidual="True/False" xcrosstrend="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <stats band="txtstring" id="txtstring"/>
  <index band="txtstring" id="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| trend | process | parameters | text | attribute | no | spline |
| periodfactor | process | parameters | integer | attribute | no | 4 |
| decompose | process | parameters | text | attribute | no | trend |
| period | process | parameters | text | attribute | yes | --- |
| resample | process | parameters | text | attribute | no | none |
| group | process | parameters | boolean | attribute | no | --- |
| method | process | parameters | text | attribute | no | none |
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
| invert | process | parameters | boolean | attribute | no | --- |
| indexcomp | process | parameters | boolean | attribute | no | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid |
| product | process | srccomp | text | attribute | no | anyid |
| folder | process | srccomp | text | attribute | no | auto |
| band | process | srccomp | text | attribute | yes | src |
| prefix | process | srccomp | text | attribute | no | auto |
| suffix | process | srccomp | text | attribute | no | auto |
| masked | process | srccomp | bool | attribute | no | N |
| id | process | stats | text | attribute | yes | --- |
| band | process | stats | text | attribute | yes | --- |
| id | process | index | text | attribute | yes | --- |
| band | process | index | text | attribute | yes | --- |
