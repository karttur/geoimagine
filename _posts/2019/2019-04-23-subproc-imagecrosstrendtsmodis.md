---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-imagecrosstrendtsmodis
title: imagecrosstrendtsmodis
excerpt: No label set yet.
image: 
rootprocid: TimeSeries
subprocid: imagecrosstrendtsmodis
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
  <parameters abs="True/False" additive="True/False" copycomp="txtstring" forceseason="True/False" kernel="txtstring" maxlag="xyz" mirrorlag="True/False" naive="True/False" normalize="True/False" prefilterseason="True/False" savelags="xyz" standardize="True/False" trend="txtstring" version="txtstring" xcrosseason="True/False" xcrosslag="True/False" xcrossobserved="True/False" xcrosspearson="True/False" xcrossresidual="True/False" xcrosstendency="True/False" yearfac="xyz"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <master band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <slave band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| copycomp | process | parameters | text | attribute | no | imagecrosstrend |
| mirrorlag | process | parameters | boolean | attribute | no | --- |
| maxlag | process | parameters | integer | attribute | no | 6 |
| savelags | process | parameters | integer | attribute | no | -1 |
| normalize | process | parameters | Boolean | attribute | no | --- |
| standardize | process | parameters | Boolean | attribute | no | True |
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
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| master | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | master |
| slave | process | srccomp | element | element | --- | --- |
| id | srccomp | master | text | attribute | yes | master |
| source | srccomp | master | text | attribute | yes | --- |
| product | srccomp | master | text | attribute | yes | --- |
| folder | srccomp | master | text | attribute | yes | --- |
| band | srccomp | master | text | attribute | yes | master |
| prefix | srccomp | master | text | attribute | no | --- |
| suffix | srccomp | master | text | attribute | no | --- |
| id | srccomp | slave | text | attribute | yes | slave |
| source | srccomp | slave | text | attribute | yes | --- |
| product | srccomp | slave | text | attribute | yes | --- |
| folder | srccomp | slave | text | attribute | yes | --- |
| band | srccomp | slave | text | attribute | yes | slave |
| prefix | srccomp | slave | text | attribute | no | --- |
| suffix | srccomp | slave | text | attribute | no | --- |
| anyid1 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid1 |
| source | dstcomp | anyid1 | text | attribute | yes | --- |
| product | dstcomp | anyid1 | text | attribute | yes | --- |
| folder | dstcomp | anyid1 | text | attribute | no | xcorr |
| band | dstcomp | anyid1 | text | attribute | no | noeffect |
| suffix | dstcomp | anyid1 | text | attribute | yes | auto |
