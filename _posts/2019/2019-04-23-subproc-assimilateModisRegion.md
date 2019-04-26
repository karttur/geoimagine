---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-assimilateModisRegion
title: assimilateModisRegion
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: assimilateModisRegion
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
  <parameters acceptdualresol="True/False" assimfrac="xyz.abc" assimsuffix="txtstring" copycomp="txtstring" dstmax="xyz.abc" dstmin="xyz.abc" dstsuffix="txtstring" kernel="txtstring" maxthreshold="xyz.abc" minthreshold="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <timeseries band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| maxthreshold | process | parameters | real | attribute | no | 0 |
| minthreshold | process | parameters | real | attribute | no | 0 |
| assimfrac | process | parameters | real | attribute | no | 1.0 |
| kernel | process | parameters | text | attribute | no | 0 |
| dstmin | process | parameters | real | attribute | yes | 0 |
| dstmax | process | parameters | real | attribute | yes | 100 |
| copycomp | process | parameters | text | attribute | no | assimilate |
| assimsuffix | process | parameters | text | attribute | yes | --- |
| dstsuffix | process | parameters | text | attribute | yes | --- |
| acceptdualresol | process | parameters | boolean | attribute | no | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| timeseries | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | timeseries |
| id | srccomp | timeseries | text | attribute | yes | --- |
| source | srccomp | timeseries | text | attribute | yes | --- |
| product | srccomp | timeseries | text | attribute | yes | --- |
| folder | srccomp | timeseries | text | attribute | yes | --- |
| band | srccomp | timeseries | text | attribute | yes | timeseries |
| prefix | srccomp | timeseries | text | attribute | no | --- |
| suffix | srccomp | timeseries | text | attribute | no | --- |
