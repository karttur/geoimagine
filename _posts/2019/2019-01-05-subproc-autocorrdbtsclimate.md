---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-autocorrdbtsclimate
title: autocorrdbtsclimate
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: autocorrdbtsclimate
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
  <parameters alpha="xyz.abc" errbars="True/False" figdpi="xyz.abc" figheight="xyz.abc" figwidth="xyz.abc" fontsize="xyz.abc" grid="True/False" kernel="txtstring" legend="xyz" legendfontsize="xyz.abc" linestyle="txtstring" linewidth="xyz.abc" mirror="xyz" naive="True/False" nlags="xyz" normalize="True/False" partial="True/False" pdplot="True/False" prefilter="True/False" resampleseasonal="True/False" savedpi="xyz.abc" standardize="True/False" title="txtstring" titlefontsize="xyz.abc" version="txtstring" width="xyz.abc" xlabel="txtstring" ylabel="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <index color="txtstring" edgecolor="txtstring" id="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| normalize | process | parameters | Boolean | attribute | no | --- |
| standardize | process | parameters | Boolean | attribute | no | --- |
| nlags | process | parameters | integer | attribute | no | 1 |
| partial | process | parameters | boolean | attribute | no | --- |
| resampleseasonal | process | parameters | boolean | attribute | no | --- |
| mirror | process | parameters | integer | attribute | no | 0 |
| naive | process | parameters | Boolean | attribute | no | --- |
| xlabel | process | parameters | text | attribute | no | Date |
| ylabel | process | parameters | text | attribute | no | none |
| width | process | parameters | real | attribute | no | 0.8 |
| alpha | process | parameters | real | attribute | no | 0.8 |
| errbars | process | parameters | boolean | attribute | no | --- |
| title | process | parameters | text | attribute | no | none |
| grid | process | parameters | boolean | attribute | no | --- |
| linewidth | process | parameters | real | attribute | no | 1.0 |
| linestyle | process | parameters | string | attribute | no | densely dotted |
| legend | process | parameters | integer | attribute | no | -99 |
| pdplot | process | parameters | boolean | attribute | no | --- |
| prefilter | process | parameters | boolean | attribute | no | --- |
| kernel | process | parameters | text | attribute | no | 0 |
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
| color | process | index | string | attribute | no | b |
| edgecolor | process | index | string | attribute | no | b |
