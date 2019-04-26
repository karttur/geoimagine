---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-downloadModisSingleTile
title: downloadModisSingleTile
excerpt: Download MODIS tile data from MODIS datapool
image: 
rootprocid: MODISProc
subprocid: downloadModisSingleTile
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
  <parameters asscript="txtstring" downloaded="True/False" htile="xyz" product="txtstring" remoteuser="txtstring" serverurl="txtstring" version="txtstring" vtile="xyz"/>
  <dstpath volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| remoteuser | process | parameters | string | attribute | yes | --- |
| serverurl | process | parameters | string | attribute | no | https://e4ftl01.cr.usgs.gov |
| asscript | process | parameters | string | attribute | no | True |
| downloaded | process | parameters | boolean | attribute | no | --- |
| product | process | parameters | text | attribute | yes | MCD43A4 |
| version | process | parameters | text | attribute | yes | 006 |
| htile | process | parameters | integer | attribute | yes | --- |
| vtile | process | parameters | integer | attribute | yes | --- |
| volume | process | dstpath | text | attribute | yes | --- |
