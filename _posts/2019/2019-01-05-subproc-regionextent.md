---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-regionextent
title: regionextent
excerpt: Automatically define region extent from sample point distributions
image: 
rootprocid: ManageRegion
subprocid: regionextent
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
  <parameters buffer="xyz.abc" distunits="xyz.abc" locality="txtstring" version="txtstring" wrs="xyz"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| wrs | process | parameters | integer | attribute | yes | --- |
| locality | process | parameters | text | attribute | yes | --- |
| buffer | process | parameters | real | attribute | no | 0.01 |
| distunits | process | parameters | real | attribute | no | deg |
| version | process | parameters | text | attribute | yes | --- |
