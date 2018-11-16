---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-ModisSearchToDB
title: ModisSearchToDB
excerpt: Open and reads html formatted files from searchDataPool
image: 
rootprocid: MODISProc
subprocid: ModisSearchToDB
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
  <parameters product="txtstring" version="txtstring"/>
  <srcpath volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| product | process | parameters | text | attribute | yes | MCD43A4 |
| version | process | parameters | text | attribute | yes | 006 |
| volume | process | srcpath | text | attribute | yes | --- |
