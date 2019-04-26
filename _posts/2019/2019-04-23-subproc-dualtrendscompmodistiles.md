---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-dualtrendscompmodistiles
title: dualtrendscompmodistiles
excerpt: Overlay and compare two trend layers
image: 
rootprocid: OverlaySpecial
subprocid: dualtrendscompmodistiles
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
  <parameters mask="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <trend1 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <trend2 band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
    <mask band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| mask | process | parameters | boolean | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| trend1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | trend1 |
| trend2 | process | srccomp | element | element | --- | --- |
| mask | process | srccomp | element | element | --- | --- |
| id | srccomp | trend1 | text | attribute | yes | trend1 |
| source | srccomp | trend1 | text | attribute | yes | --- |
| product | srccomp | trend1 | text | attribute | yes | --- |
| folder | srccomp | trend1 | text | attribute | yes | --- |
| band | srccomp | trend1 | text | attribute | yes | trend1 |
| prefix | srccomp | trend1 | text | attribute | no | --- |
| suffix | srccomp | trend1 | text | attribute | no | --- |
| id | srccomp | trend2 | text | attribute | yes | trend2 |
| source | srccomp | trend2 | text | attribute | yes | --- |
| product | srccomp | trend2 | text | attribute | yes | --- |
| folder | srccomp | trend2 | text | attribute | yes | --- |
| band | srccomp | trend2 | text | attribute | yes | trend2 |
| prefix | srccomp | trend2 | text | attribute | no | --- |
| suffix | srccomp | trend2 | text | attribute | no | --- |
| id | srccomp | mask | text | attribute | yes | mask |
| source | srccomp | mask | text | attribute | yes | --- |
| product | srccomp | mask | text | attribute | yes | --- |
| folder | srccomp | mask | text | attribute | yes | --- |
| band | srccomp | mask | text | attribute | yes | mask |
| prefix | srccomp | mask | text | attribute | no | --- |
| suffix | srccomp | mask | text | attribute | no | --- |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| source | dstcomp | anyid2 | text | attribute | yes | --- |
| product | dstcomp | anyid2 | text | attribute | yes | --- |
| folder | dstcomp | anyid2 | text | attribute | yes | --- |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | yes | --- |
| suffix | dstcomp | anyid2 | text | attribute | yes | --- |
| cellnull | dstcomp | anyid2 | integer | attribute | no | 255 |
| celltype | dstcomp | anyid2 | text | attribute | no | Byte |
| scalefac | dstcomp | anyid2 | real | attribute | no | 1 |
| offsetadd | dstcomp | anyid2 | integer | attribute | no | 0 |
| dataunit | dstcomp | anyid2 | text | attribute | no | class |
| measure | dstcomp | anyid2 | text | attribute | no | N |
