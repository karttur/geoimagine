---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-ArchiveModisRegionTiles
title: ArchiveModisRegionTiles
excerpt: Archive MODIS Single Tile
image: 
rootprocid: Export
subprocid: ArchiveModisRegionTiles
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
  <parameters archive="txtstring" copycomp="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <layer band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | string | attribute | no | archive |
| archive | process | parameters | text | attribute | no | zip |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
| layer | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | layer |
| source | srccomp | layer | text | attribute | yes | --- |
| product | srccomp | layer | text | attribute | yes | --- |
| folder | srccomp | layer | text | attribute | yes | --- |
| band | srccomp | layer | text | attribute | yes | layer |
| prefix | srccomp | layer | text | attribute | no | --- |
| suffix | srccomp | layer | text | attribute | no | --- |
