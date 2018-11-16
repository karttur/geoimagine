---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-DownLoadSmapDaac
title: DownLoadSmapDaac
excerpt: Download SMAP data from DAAC
image: 
rootprocid: SMAPProc
subprocid: DownLoadSmapDaac
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
  <parameters asscript="True/False" downloaded="txtstring" product="txtstring" remoteuser="txtstring" serverurl="txtstring" version="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| remoteuser | process | parameters | text | attribute | yes | --- |
| asscript | process | parameters | boolean | attribute | no | True |
| serverurl | process | parameters | text | attribute | no | https://n5eil01u.ecs.nsidc.org |
| downloaded | process | parameters | text | attribute | no | N |
| product | process | parameters | text | attribute | yes | SPL3SMP_E |
| version | process | parameters | text | attribute | yes | 002 |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | hdf |
| datfiletype | process | dstpath | text | attribute | no | hdf |
