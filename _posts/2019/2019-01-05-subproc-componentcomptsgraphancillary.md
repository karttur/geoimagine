---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-componentcomptsgraphancillary
title: componentcomptsgraphancillary
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: componentcomptsgraphancillary
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
  <parameters additive="True/False" figdpi="xyz.abc" figheight="xyz.abc" figwidth="xyz.abc" fontsize="xyz.abc" forceseason="True/False" grid="True/False" kernel="txtstring" legend="xyz" legendfontsize="xyz.abc" naive="True/False" normalize="True/False" obsformat="txtstring" obslinestyle="txtstring" obslinewidth="xyz.abc" prefilterseason="True/False" regressformat="txtstring" regresslinestyle="txtstring" regresslinewidth="xyz.abc" residualformat="txtstring" residuallinestyle="txtstring" residuallinewidth="xyz.abc" savedpi="xyz.abc" seasonformat="txtstring" seasonlinestyle="txtstring" seasonlinewidth="xyz.abc" sharey="True/False" standardize="True/False" tendencyformat="txtstring" tendencylinestyle="txtstring" tendencylinewidth="xyz.abc" title="txtstring" titlefontsize="xyz.abc" trend="txtstring" version="txtstring" xlabel="txtstring" yearfac="xyz" ylabel="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <xy epsg="xyz" id="txtstring" obscolor="txtstring" obsformat="txtstring" regresscolor="txtstring" regressformat="txtstring" residualcolor="txtstring" residualformat="txtstring" seasoncolor="txtstring" seasonformat="txtstring" tendencycolor="txtstring" tendencyformat="txtstring" x="xyz.abc" y="xyz.abc"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| normalize | process | parameters | Boolean | attribute | no | --- |
| standardize | process | parameters | Boolean | attribute | no | --- |
| naive | process | parameters | Boolean | attribute | no | --- |
| additive | process | parameters | Boolean | attribute | no | True |
| yearfac | process | parameters | integer | attribute | no | 1 |
| trend | process | parameters | text | attribute | no | spline |
| prefilterseason | process | parameters | bool | attribute | no | --- |
| kernel | process | parameters | text | attribute | no | 0 |
| forceseason | process | parameters | boolean | attribute | no | True |
| xlabel | process | parameters | text | attribute | no | Date |
| ylabel | process | parameters | text | attribute | no | none |
| sharey | process | parameters | boolean | attribute | no | --- |
| title | process | parameters | text | attribute | no | none |
| grid | process | parameters | boolean | attribute | no | --- |
| obsformat | process | parameters | string | attribute | no | b- |
| seasonformat | process | parameters | string | attribute | no | g- |
| residualformat | process | parameters | string | attribute | no | r- |
| regressformat | process | parameters | string | attribute | no | k- |
| tendencyformat | process | parameters | string | attribute | no | y- |
| obslinewidth | process | parameters | real | attribute | no | 1.0 |
| seasonlinewidth | process | parameters | real | attribute | no | 1.0 |
| residuallinewidth | process | parameters | real | attribute | no | 1.0 |
| regresslinewidth | process | parameters | real | attribute | no | 1.0 |
| tendencylinewidth | process | parameters | real | attribute | no | 1.0 |
| obslinestyle | process | parameters | string | attribute | no | solid |
| seasonlinestyle | process | parameters | string | attribute | no | solid |
| residuallinestyle | process | parameters | string | attribute | no | solid |
| regresslinestyle | process | parameters | string | attribute | no | solid |
| tendencylinestyle | process | parameters | string | attribute | no | solid |
| legend | process | parameters | integer | attribute | no | -99 |
| figwidth | process | parameters | real | attribute | no | 8.0 |
| figheight | process | parameters | real | attribute | no | 6.0 |
| fontsize | process | parameters | real | attribute | no | 12.0 |
| legendfontsize | process | parameters | real | attribute | no | 12 |
| titlefontsize | process | parameters | real | attribute | no | 12 |
| figdpi | process | parameters | real | attribute | no | 80 |
| savedpi | process | parameters | real | attribute | no | 300 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | png |
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
| id | process | xy | text | attribute | yes | --- |
| epsg | process | xy | integer | attribute | no | 0 |
| x | process | xy | real | attribute | yes | --- |
| y | process | xy | real | attribute | yes | --- |
| obsformat | process | xy | string | attribute | no | 0 |
| seasonformat | process | xy | string | attribute | no | 0 |
| residualformat | process | xy | string | attribute | no | 0 |
| tendencyformat | process | xy | string | attribute | no | 0 |
| regressformat | process | xy | string | attribute | no | 0 |
| obscolor | process | xy | string | attribute | no | b |
| tendencycolor | process | xy | string | attribute | no | b |
| seasoncolor | process | xy | string | attribute | no | b |
| residualcolor | process | xy | string | attribute | no | k |
| regresscolor | process | xy | string | attribute | no | k |
