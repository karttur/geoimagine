---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-movieclocksmap
title: movieclocksmap
excerpt: Create movieclock layout
image: 
rootprocid: Export
subprocid: movieclocksmap
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
  <parameters asscript="True/False" copycomp="txtstring" name="txtstring" width="xyz"/>
  <dstpath hdrfiletype="txtstring" volume="txtstring"/>
  <dstcomp element="txtstring" parent="txtstring">
    <layer band="txtstring" celltype="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| width | process | parameters | integer | attribute | yes | 900 |
| name | process | parameters | text | attribute | yes | --- |
| copycomp | process | parameters | text | attribute | no | movieclock |
| asscript | process | parameters | bool | attribute | no | True |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | png |
| layer | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | layer |
| source | dstcomp | layer | text | attribute | yes | --- |
| product | dstcomp | layer | text | attribute | yes | --- |
| folder | dstcomp | layer | text | attribute | yes | --- |
| band | dstcomp | layer | text | attribute | yes | layer |
| prefix | dstcomp | layer | text | attribute | no | --- |
| suffix | dstcomp | layer | text | attribute | no | --- |
| celltype | dstcomp | layer | text | attribute | no | movieclock |
