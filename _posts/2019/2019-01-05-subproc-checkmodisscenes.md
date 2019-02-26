---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-checkmodisscenes
title: checkmodisscenes
excerpt: Checks MODIS downloads and files on local system compared to db
image: 
rootprocid: MODISProc
subprocid: checkmodisscenes
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
  <parameters redundant="True/False"/>
  <srcperiod timestep="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| redundant | process | parameters | bool | attribute | no | N |
| timestep | process | srcperiod | text | attribute | no | allscenes |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | hdf |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | yes | original |
| band | process | srccomp | text | attribute | no | anyid1 |
| prefix | process | srccomp | text | attribute | no | anyid1 |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
