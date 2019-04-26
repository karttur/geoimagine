---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-dumpdbsql
title: dumpdbsql
excerpt: No label set yet.
image: 
rootprocid: ManageSqlDumps
subprocid: dumpdbsql
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
  <parameters cmdpath="txtstring" dataonly="True/False" datum="txtstring" format="txtstring" schemaonly="True/False"/>
  <dstpath hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| datum | process | parameters | text | attribute | no | --- |
| cmdpath | process | parameters | text | attribute | no | None |
| format | process | parameters | text | attribute | no | p |
| dataonly | process | parameters | boolean | attribute | no | --- |
| schemaonly | process | parameters | boolean | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | sql |
