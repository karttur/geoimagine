---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-subtractseasonsancillary
title: subtractseasonsancillary
excerpt: Result can be saved for only positive or negative residual, or combined residual
image: 
rootprocid: Overlay
subprocid: subtractseasonsancillary
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
  <parameters balance="txtstring" copycomp="txtstring" seasonfactor="xyz.abc" seasonoffsetadd="xyz.abc" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <layer band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" timestep="txtstring"/>
    <season band="txtstring" folder="txtstring" id="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" timestep="txtstring"/>
  </srccomp>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid2 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| version | process | parameters | text | attribute | no | 1.3 |
| copycomp | process | parameters | text | attribute | no | subtractseason |
| balance | process | parameters | text | attribute | no | diff |
| seasonfactor | process | parameters | real | attribute | no | 1.0 |
| seasonoffsetadd | process | parameters | real | attribute | no | 0 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer |
| season | process | srccomp | element | element | --- | --- |
| id | srccomp | layer | text | attribute | yes | layer |
| source | srccomp | layer | text | attribute | yes | --- |
| product | srccomp | layer | text | attribute | yes | --- |
| folder | srccomp | layer | text | attribute | yes | --- |
| band | srccomp | layer | text | attribute | yes | layer |
| prefix | srccomp | layer | text | attribute | no | --- |
| suffix | srccomp | layer | text | attribute | no | --- |
| timestep | srccomp | layer | text | attribute | yes | --- |
| id | srccomp | season | text | attribute | yes | season |
| source | srccomp | season | text | attribute | yes | --- |
| product | srccomp | season | text | attribute | yes | --- |
| folder | srccomp | season | text | attribute | yes | --- |
| band | srccomp | season | text | attribute | yes | season |
| prefix | srccomp | season | text | attribute | no | --- |
| suffix | srccomp | season | text | attribute | no | --- |
| timestep | srccomp | season | text | attribute | yes | --- |
| anyid2 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid2 |
| source | dstcomp | anyid2 | text | attribute | no | src |
| product | dstcomp | anyid2 | text | attribute | no | src |
| folder | dstcomp | anyid2 | text | attribute | no | src |
| band | dstcomp | anyid2 | text | attribute | yes | anyid2 |
| prefix | dstcomp | anyid2 | text | attribute | no | src |
| suffix | dstcomp | anyid2 | text | attribute | no | src |
