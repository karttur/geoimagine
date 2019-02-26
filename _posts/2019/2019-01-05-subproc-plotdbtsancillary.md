---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-plotdbtsancillary
title: plotdbtsancillary
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: plotdbtsancillary
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
  <parameters figdpi="xyz.abc" figheight="xyz.abc" figwidth="xyz.abc" fontsize="xyz.abc" forceseason="True/False" grid="True/False" kernel="txtstring" legend="True/False" legendfontsize="xyz.abc" naive="True/False" normalize="True/False" obscolor="txtstring" obsformat="txtstring" obslinestyle="txtstring" obslinewidth="xyz.abc" prefilterseason="True/False" regresscolor="txtstring" regressformat="txtstring" regresslinestyle="txtstring" regresslinewidth="xyz.abc" residualcolor="txtstring" residualformat="txtstring" residuallinestyle="txtstring" residuallinewidth="xyz.abc" savedpi="xyz.abc" seasoncolor="txtstring" seasonformat="txtstring" seasonlinestyle="txtstring" seasonlinewidth="xyz.abc" standardize="True/False" title="txtstring" titlefontsize="xyz.abc" trend="txtstring" trendcolor="txtstring" trendformat="txtstring" trendlinestyle="txtstring" trendlinewidth="xyz.abc" version="txtstring" xlabel="txtstring" yearfac="xyz" ylabel="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <stats band="txtstring" id="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| normalize | process | parameters | Boolean | attribute | no | --- |
| standardize | process | parameters | Boolean | attribute | no | --- |
| naive | process | parameters | Boolean | attribute | no | --- |
| yearfac | process | parameters | integer | attribute | no | 1 |
| trend | process | parameters | text | attribute | no | spline |
| prefilterseason | process | parameters | bool | attribute | no | --- |
| kernel | process | parameters | text | attribute | no | 0 |
| forceseason | process | parameters | boolean | attribute | no | True |
| xlabel | process | parameters | text | attribute | no | Date |
| ylabel | process | parameters | text | attribute | no | none |
| title | process | parameters | text | attribute | no | none |
| grid | process | parameters | boolean | attribute | no | --- |
| obsformat | process | parameters | string | attribute | no | b- |
| seasonformat | process | parameters | string | attribute | no | g- |
| residualformat | process | parameters | string | attribute | no | r- |
| regressformat | process | parameters | string | attribute | no | k- |
| trendformat | process | parameters | string | attribute | no | y- |
| obslinewidth | process | parameters | real | attribute | no | 1.0 |
| seasonlinewidth | process | parameters | real | attribute | no | 1.0 |
| residuallinewidth | process | parameters | real | attribute | no | 1.0 |
| regresslinewidth | process | parameters | real | attribute | no | 1.0 |
| trendlinewidth | process | parameters | real | attribute | no | 1.0 |
| obslinestyle | process | parameters | string | attribute | no | solid |
| seasonlinestyle | process | parameters | string | attribute | no | solid |
| residuallinestyle | process | parameters | string | attribute | no | solid |
| regresslinestyle | process | parameters | string | attribute | no | solid |
| trendlinestyle | process | parameters | string | attribute | no | solid |
| obscolor | process | parameters | string | attribute | no | b |
| seasoncolor | process | parameters | string | attribute | no | b |
| residualcolor | process | parameters | string | attribute | no | b |
| regresscolor | process | parameters | string | attribute | no | b |
| trendcolor | process | parameters | string | attribute | no | b |
| legend | process | parameters | boolean | attribute | no | --- |
| figwidth | process | parameters | real | attribute | no | 8.0 |
| figheight | process | parameters | real | attribute | no | 6.0 |
| fontsize | process | parameters | real | attribute | no | 12.0 |
| legendfontsize | process | parameters | real | attribute | no | 12 |
| titlefontsize | process | parameters | real | attribute | no | 12 |
| figdpi | process | parameters | real | attribute | no | 80 |
| savedpi | process | parameters | real | attribute | no | 300 |
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
| id | process | stats | text | attribute | yes | --- |
| band | process | stats | text | attribute | yes | --- |
