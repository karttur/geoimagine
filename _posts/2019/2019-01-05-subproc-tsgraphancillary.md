---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-tsgraphancillary
title: tsgraphancillary
excerpt: No label set yet.
image: 
rootprocid: TimeSeriesGraph
subprocid: tsgraphancillary
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
  <parameters color="txtstring" figdpi="xyz.abc" figheight="xyz.abc" figwidth="xyz.abc" fontsize="xyz.abc" format="txtstring" grid="True/False" legend="True/False" legendfontsize="xyz.abc" linestyle="txtstring" linewidth="xyz.abc" savedpi="xyz.abc" title="txtstring" titlefontsize="xyz.abc" version="txtstring" x="xyz.abc" xlabel="txtstring" y="xyz.abc" ylabel="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <xy id="txtstring" obscolor="txtstring" obsformat="txtstring" tendencycolor="txtstring" tendencyformat="txtstring" trendcolor="txtstring" trendformat="txtstring" x="xyz.abc" y="xyz.abc"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| x | process | parameters | real | attribute | no | 0 |
| y | process | parameters | real | attribute | no | 0 |
| xlabel | process | parameters | text | attribute | no | Date |
| ylabel | process | parameters | text | attribute | no | none |
| title | process | parameters | text | attribute | no | none |
| grid | process | parameters | boolean | attribute | no | --- |
| format | process | parameters | string | attribute | no | 0 |
| linewidth | process | parameters | real | attribute | no | 1.0 |
| linestyle | process | parameters | string | attribute | no | solid |
| color | process | parameters | string | attribute | no | b |
| legend | process | parameters | boolean | attribute | no | --- |
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
| x | process | xy | real | attribute | yes | --- |
| y | process | xy | real | attribute | yes | --- |
| obsformat | process | xy | string | attribute | no | 0 |
| tendencyformat | process | xy | string | attribute | no | 0 |
| trendformat | process | xy | string | attribute | no | 0 |
| obscolor | process | xy | string | attribute | no | b |
| tendencycolor | process | xy | string | attribute | no | b |
| trendcolor | process | xy | string | attribute | no | k |
