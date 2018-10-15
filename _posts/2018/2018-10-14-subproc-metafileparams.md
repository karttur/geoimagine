---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-metafileparams
title: metafileparams
excerpt: Defines the type and content of landsat metadata files and relates them to the db
image: 
rootprocid: LandsatProc
subprocid: metafileparams
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
  <parameters archive="txtstring" metatype="txtstring" metatypeid="txtstring"/>
  <parameter element="txtstring"/>
  <node element="txtstring" itemnr="txtstring" paramid="txtstring" paramtyp="txtstring" parentid="txtstring" poststring="txtstring" prestring="txtstring" required="txtstring" separator="txtstring" substitute="txtstring" tagorattr="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| archive | process | parameters | text | attribute | yes | USGScollL1v2016 |
| metatypeid | process | parameters | text | attribute | yes | --- |
| metatype | process | parameters | text | attribute | yes | --- |
| element | process | parameter | text | attribute | yes | --- |
| parentid | process | node | text | attribute | yes | --- |
| element | process | node | text | attribute | yes | --- |
| paramid | process | node | text | attribute | yes | --- |
| paramtyp | process | node | text | attribute | yes | --- |
| tagorattr | process | node | text | attribute | yes | --- |
| required | process | node | text | attribute | yes | --- |
| prestring | process | node | text | attribute | no | --- |
| poststring | process | node | text | attribute | no | --- |
| separator | process | node | text | attribute | no | --- |
| itemnr | process | node | text | attribute | no | --- |
| substitute | process | node | text | attribute | no | --- |
