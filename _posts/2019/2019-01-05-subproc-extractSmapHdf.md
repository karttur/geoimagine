---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-extractSmapHdf
title: extractSmapHdf
excerpt: Scenes must be organized prior to extration
image: 
rootprocid: SMAPProc
subprocid: extractSmapHdf
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
  <parameters asscript="True/False" exploded="True/False" product="txtstring" redundant="True/False" remoteuser="txtstring" replaceold="True/False" serverurl="txtstring" version="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| remoteuser | process | parameters | text | attribute | yes | --- |
| asscript | process | parameters | boolean | attribute | no | True |
| serverurl | process | parameters | text | attribute | no | https://n5eil01u.ecs.nsidc.org |
| replaceold | process | parameters | bool | attribute | no | True |
| redundant | process | parameters | bool | attribute | no | --- |
| exploded | process | parameters | bool | attribute | no | --- |
| product | process | parameters | text | attribute | yes | --- |
| version | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | h5 |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | tif |
| datfiletype | process | dstpath | text | attribute | no | --- |
