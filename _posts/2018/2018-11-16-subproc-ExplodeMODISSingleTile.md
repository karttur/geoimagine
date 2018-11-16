---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-ExplodeMODISSingleTile
title: ExplodeMODISSingleTile
excerpt: Scenes must be organized prior to extration
image: 
rootprocid: MODISProc
subprocid: ExplodeMODISSingleTile
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
  <parameters asscript="True/False" exploded="True/False" htile="xyz" product="txtstring" version="txtstring" vtile="xyz"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| exploded | process | parameters | bool | attribute | no | --- |
| asscript | process | parameters | bool | attribute | no | True |
| product | process | parameters | text | attribute | yes | --- |
| version | process | parameters | text | attribute | yes | --- |
| htile | process | parameters | integer | attribute | yes | --- |
| vtile | process | parameters | integer | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | hdf |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
