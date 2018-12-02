---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-SmapSearchToDB
title: SmapSearchToDB
excerpt: Transfer the SMAP seanch results to the postgres DB
image: 
rootprocid: SMAPProc
subprocid: SmapSearchToDB
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
  <parameters product="txtstring" remoteuser="txtstring" version="txtstring"/>
  <srcpath volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| remoteuser | process | parameters | text | attribute | yes | --- |
| product | process | parameters | text | attribute | yes | SPL3SMP_E |
| version | process | parameters | text | attribute | yes | 006 |
| volume | process | srcpath | text | attribute | yes | --- |
