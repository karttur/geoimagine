---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-movieoverlayframeModisRegion
title: movieoverlayframeModisRegion
excerpt: Convert 2 sets of exported images to movie frames with baselayer and overlayer
image: 
rootprocid: Export
subprocid: movieoverlayframeModisRegion
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
  <parameters asscript="True/False" basecrop="txtstring" basewidth="xyz" copycomp="txtstring" emboss="txtstring" embossdims="txtstring" embossptsize="xyz" geomx="xyz" geomy="xyz" gravity="txtstring" name="txtstring" overlaywidth="xyz" vector="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <layer1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <layer2 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| name | process | parameters | text | attribute | no | default |
| basewidth | process | parameters | integer | attribute | yes | --- |
| basecrop | process | parameters | text | attribute | yes | --- |
| overlaywidth | process | parameters | integer | attribute | yes | --- |
| gravity | process | parameters | text | attribute | no | northeast |
| geomx | process | parameters | integer | attribute | no | 0 |
| geomy | process | parameters | integer | attribute | no | 0 |
| emboss | process | parameters | text | attribute | yes | KARTTUR |
| embossdims | process | parameters | text | attribute | yes | --- |
| embossptsize | process | parameters | integer | attribute | yes | --- |
| copycomp | process | parameters | text | attribute | no | movieframeoverlay |
| asscript | process | parameters | bool | attribute | no | True |
| vector | process | parameters | text | attribute | no | NA |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer1 |
| layer2 | process | srccomp | element | element | --- | --- |
| id | srccomp | layer1 | text | attribute | yes | layer1 |
| source | srccomp | layer1 | text | attribute | yes | --- |
| product | srccomp | layer1 | text | attribute | yes | --- |
| folder | srccomp | layer1 | text | attribute | yes | --- |
| band | srccomp | layer1 | text | attribute | yes | layer1 |
| prefix | srccomp | layer1 | text | attribute | no | --- |
| suffix | srccomp | layer1 | text | attribute | no | --- |
| id | srccomp | layer2 | text | attribute | yes | layer2 |
| source | srccomp | layer2 | text | attribute | yes | --- |
| product | srccomp | layer2 | text | attribute | yes | --- |
| folder | srccomp | layer2 | text | attribute | yes | --- |
| band | srccomp | layer2 | text | attribute | yes | layer2 |
| prefix | srccomp | layer2 | text | attribute | no | --- |
| suffix | srccomp | layer2 | text | attribute | no | --- |
