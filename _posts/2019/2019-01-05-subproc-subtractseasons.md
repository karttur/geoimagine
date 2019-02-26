---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-subtractseasons
title: subtractseasons
excerpt: No label set yet.
image: 
rootprocid: MapCalc
subprocid: subtractseasons
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
  <parameters balance="txtstring" copycomp="xyz.abc" seasonfactor="xyz.abc" seasonoffsetadd="xyz.abc" seasontimestep="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <layer1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <layer2 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <dstlayer band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| balance | process | parameters | text | attribute | no | diff |
| seasontimestep | process | parameters | text | attribute | no | M |
| seasonfactor | process | parameters | real | attribute | no | 1.0 |
| seasonoffsetadd | process | parameters | real | attribute | no | 0 |
| copycomp | process | parameters | real | attribute | no | subtractseasons |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer1 |
| layer2 | process | srccomp | element | element | --- | --- |
| id | srccomp | layer1 | text | attribute | yes | timeseries |
| source | srccomp | layer1 | text | attribute | yes | --- |
| product | srccomp | layer1 | text | attribute | yes | --- |
| folder | srccomp | layer1 | text | attribute | yes | --- |
| band | srccomp | layer1 | text | attribute | yes | layer1 |
| prefix | srccomp | layer1 | text | attribute | no | --- |
| suffix | srccomp | layer1 | text | attribute | no | --- |
| id | srccomp | layer2 | text | attribute | yes | season |
| source | srccomp | layer2 | text | attribute | yes | --- |
| product | srccomp | layer2 | text | attribute | yes | --- |
| folder | srccomp | layer2 | text | attribute | yes | --- |
| band | srccomp | layer2 | text | attribute | yes | layer2 |
| prefix | srccomp | layer2 | text | attribute | no | --- |
| suffix | srccomp | layer2 | text | attribute | no | --- |
| dstlayer | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | dstlayer |
| source | dstcomp | dstlayer | text | attribute | yes | --- |
| product | dstcomp | dstlayer | text | attribute | yes | --- |
| folder | dstcomp | dstlayer | text | attribute | yes | --- |
| band | dstcomp | dstlayer | text | attribute | yes | dstlayer |
| prefix | dstcomp | dstlayer | text | attribute | no | --- |
| suffix | dstcomp | dstlayer | text | attribute | no | --- |
