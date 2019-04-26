---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-plotdbtsclimate
title: plotdbtsclimate
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: plotdbtsclimate
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
  <parameters alpha="xyz.abc" decompose="True/False" figdpi="xyz.abc" figheight="xyz.abc" figwidth="xyz.abc" fontsize="xyz.abc" forceseason="True/False" grid="True/False" kernel="txtstring" legend="xyz" legendfontsize="xyz.abc" naive="True/False" normalize="True/False" obslinestyle="txtstring" obslinewidth="xyz.abc" pdplot="True/False" plotoriginal="True/False" plottendency="True/False" plottrend="True/False" prefilterseason="True/False" savedpi="xyz.abc" separate="True/False" standardize="True/False" tendencylinestyle="txtstring" tendencylinewidth="xyz.abc" title="txtstring" titlefontsize="xyz.abc" trend="txtstring" trendlinestyle="txtstring" trendlinewidth="xyz.abc" version="txtstring" xlabel="txtstring" yearfac="xyz" ylabel="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <index id="txtstring" obscolor="txtstring" obsformat="txtstring" tendencycolor="txtstring" tendencyformat="txtstring" trendcolor="txtstring" trendformat="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| normalize | process | parameters | Boolean | attribute | no | --- |
| standardize | process | parameters | Boolean | attribute | no | --- |
| naive | process | parameters | Boolean | attribute | no | --- |
| xlabel | process | parameters | text | attribute | no | Date |
| ylabel | process | parameters | text | attribute | no | none |
| title | process | parameters | text | attribute | no | none |
| grid | process | parameters | boolean | attribute | no | --- |
| obslinewidth | process | parameters | real | attribute | no | 1.0 |
| obslinestyle | process | parameters | string | attribute | no | densely dotted |
| tendencylinewidth | process | parameters | real | attribute | no | 1.0 |
| tendencylinestyle | process | parameters | string | attribute | no | solid |
| trendlinewidth | process | parameters | real | attribute | no | 1.0 |
| trendlinestyle | process | parameters | string | attribute | no | solid |
| legend | process | parameters | integer | attribute | no | -99 |
| separate | process | parameters | boolean | attribute | no | --- |
| pdplot | process | parameters | boolean | attribute | no | --- |
| decompose | process | parameters | boolean | attribute | no | --- |
| plotoriginal | process | parameters | boolean | attribute | no | True |
| plottendency | process | parameters | boolean | attribute | no | True |
| plottrend | process | parameters | boolean | attribute | no | --- |
| yearfac | process | parameters | integer | attribute | no | 1 |
| trend | process | parameters | text | attribute | no | spline |
| prefilterseason | process | parameters | bool | attribute | no | --- |
| kernel | process | parameters | text | attribute | no | 0 |
| forceseason | process | parameters | boolean | attribute | no | True |
| alpha | process | parameters | real | attribute | no | 0.8 |
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
| id | process | index | text | attribute | yes | --- |
| obsformat | process | index | string | attribute | no | 0 |
| tendencyformat | process | index | string | attribute | no | 0 |
| trendformat | process | index | string | attribute | no | 0 |
| obscolor | process | index | string | attribute | no | b |
| tendencycolor | process | index | string | attribute | no | b |
| trendcolor | process | index | string | attribute | no | k |
