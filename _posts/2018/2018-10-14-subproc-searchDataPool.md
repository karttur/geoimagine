---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-searchDataPool
title: searchDataPool
excerpt: Requires setup of wget and EarthData credentials file (called .netrc in user home path)
image: 
rootprocid: MODISProc
subprocid: searchDataPool
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
  <parameters product="txtstring" serverurl="txtstring" version="txtstring"/>
  <dstpath volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| product | process | parameters | text | attribute | yes | MCD43A4 |
| version | process | parameters | text | attribute | yes | 006 |
| serverurl | process | parameters | text | attribute | yes | https://e4ftl01.cr.usgs.gov |
| volume | process | dstpath | text | attribute | yes | --- |
