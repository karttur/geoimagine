---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-average3ancillarytimeseries
title: average3ancillarytimeseries
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: average3ancillarytimeseries
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
  <parameters acceptmissing="True/False" copycomp="txtstring" method="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <timeseries band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <seasonal band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <layer3 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| acceptmissing | process | parameters | bool | attribute | no | True |
| copycomp | process | parameters | text | attribute | yes | compid |
| version | process | parameters | text | attribute | no | 1.3 |
| method | process | parameters | text | attribute | no | average |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| timeseries | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | timeseries |
| seasonal | process | srccomp | element | element | --- | --- |
| layer3 | process | srccomp | element | element | --- | --- |
| source | srccomp | timeseries | text | attribute | yes | --- |
| product | srccomp | timeseries | text | attribute | yes | --- |
| folder | srccomp | timeseries | text | attribute | yes | --- |
| band | srccomp | timeseries | text | attribute | yes | timeseries |
| prefix | srccomp | timeseries | text | attribute | no | --- |
| suffix | srccomp | timeseries | text | attribute | no | --- |
| source | srccomp | seasonal | text | attribute | yes | --- |
| product | srccomp | seasonal | text | attribute | yes | --- |
| folder | srccomp | seasonal | text | attribute | yes | --- |
| band | srccomp | seasonal | text | attribute | yes | seasonal |
| prefix | srccomp | seasonal | text | attribute | no | --- |
| suffix | srccomp | seasonal | text | attribute | no | --- |
| source | srccomp | layer3 | text | attribute | yes | --- |
| product | srccomp | layer3 | text | attribute | yes | --- |
| folder | srccomp | layer3 | text | attribute | yes | --- |
| band | srccomp | layer3 | text | attribute | yes | layer3 |
| prefix | srccomp | layer3 | text | attribute | no | --- |
| suffix | srccomp | layer3 | text | attribute | no | --- |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| source | dstcomp | anyid2 | text | attribute | no | src |
| product | dstcomp | anyid2 | text | attribute | no | src |
| folder | dstcomp | anyid2 | text | attribute | no | src |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | no | src |
| suffix | dstcomp | anyid2 | text | attribute | no | src |
