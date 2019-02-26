---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-indexcompxcrosstsgraphancillary
title: indexcompxcrosstsgraphancillary
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: indexcompxcrosstsgraphancillary
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
  <parameters abs="True/False" additive="True/False" figdpi="xyz.abc" figheight="xyz.abc" figwidth="xyz.abc" fontsize="xyz.abc" forceseason="True/False" grid="True/False" kernel="txtstring" lagplot="True/False" legend="xyz" legendfontsize="xyz.abc" naive="True/False" normalize="True/False" obslinestyle="txtstring" obslinestyleindex="txtstring" obslinewidth="xyz.abc" obslinewidthindex="xyz.abc" prefilterseason="True/False" residuallinestyle="txtstring" residuallinestyleindex="txtstring" residuallinewidth="xyz.abc" residuallinewidthindex="xyz.abc" savedpi="xyz.abc" seasonlinestyle="txtstring" seasonlinestyleindex="txtstring" seasonlinewidth="xyz.abc" seasonlinewidthindex="xyz.abc" sharey="True/False" standardize="True/False" tendencylinestyle="txtstring" tendencylinestyleindex="txtstring" tendencylinewidth="xyz.abc" tendencylinewidthindex="xyz.abc" title="txtstring" titlefontsize="xyz.abc" trend="txtstring" version="txtstring" xcrosseason="True/False" xcrosslag="True/False" xcrossobserved="True/False" xcrosspearson="True/False" xcrossresidual="True/False" xcrosstendency="True/False" xlabel="txtstring" yearfac="xyz" ylabel="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <xy epsg="xyz" id="txtstring" obscolor="txtstring" obsformat="txtstring" residualcolor="txtstring" residualformat="txtstring" seasoncolor="txtstring" seasonformat="txtstring" tendencycolor="txtstring" tendencyformat="txtstring" x="xyz.abc" y="xyz.abc"/>
  <index id="txtstring" obscolor="txtstring" obsformat="txtstring" residualcolor="txtstring" residualformat="txtstring" seasoncolor="txtstring" seasonformat="txtstring" tendencycolor="txtstring" tendencyformat="txtstring"/>
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
| abs | process | parameters | boolean | attribute | no | --- |
| xcrossobserved | process | parameters | boolean | attribute | no | True |
| xcrosstendency | process | parameters | boolean | attribute | no | --- |
| xcrosseason | process | parameters | boolean | attribute | no | --- |
| xcrossresidual | process | parameters | boolean | attribute | no | --- |
| xcrosspearson | process | parameters | boolean | attribute | no | True |
| xcrosslag | process | parameters | boolean | attribute | no | True |
| xlabel | process | parameters | text | attribute | no | Date |
| ylabel | process | parameters | text | attribute | no | none |
| sharey | process | parameters | boolean | attribute | no | --- |
| title | process | parameters | text | attribute | no | Cross correlation |
| grid | process | parameters | boolean | attribute | no | --- |
| lagplot | process | parameters | boolean | attribute | no | --- |
| obslinewidthindex | process | parameters | real | attribute | no | 1.0 |
| seasonlinewidthindex | process | parameters | real | attribute | no | 1.0 |
| residuallinewidthindex | process | parameters | real | attribute | no | 1.0 |
| tendencylinewidthindex | process | parameters | real | attribute | no | 1.0 |
| obslinestyleindex | process | parameters | string | attribute | no | solid |
| seasonlinestyleindex | process | parameters | string | attribute | no | solid |
| residuallinestyleindex | process | parameters | string | attribute | no | solid |
| tendencylinestyleindex | process | parameters | string | attribute | no | solid |
| obslinewidth | process | parameters | real | attribute | no | 1.0 |
| seasonlinewidth | process | parameters | real | attribute | no | 1.0 |
| residuallinewidth | process | parameters | real | attribute | no | 1.0 |
| tendencylinewidth | process | parameters | real | attribute | no | 1.0 |
| obslinestyle | process | parameters | string | attribute | no | densely dotted |
| seasonlinestyle | process | parameters | string | attribute | no | densely dotted |
| residuallinestyle | process | parameters | string | attribute | no | densely dotted |
| tendencylinestyle | process | parameters | string | attribute | no | densely dotted |
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
| obscolor | process | xy | string | attribute | no | b |
| tendencycolor | process | xy | string | attribute | no | b |
| seasoncolor | process | xy | string | attribute | no | b |
| residualcolor | process | xy | string | attribute | no | k |
| id | process | index | text | attribute | yes | --- |
| obsformat | process | index | string | attribute | no | 0 |
| seasonformat | process | index | string | attribute | no | 0 |
| residualformat | process | index | string | attribute | no | 0 |
| tendencyformat | process | index | string | attribute | no | 0 |
| obscolor | process | index | string | attribute | no | b |
| tendencycolor | process | index | string | attribute | no | b |
| seasoncolor | process | index | string | attribute | no | b |
| residualcolor | process | index | string | attribute | no | k |
