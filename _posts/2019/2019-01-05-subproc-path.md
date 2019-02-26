---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-path
title: path
excerpt: set main path reading process
image: 
rootprocid: Path
subprocid: path
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
  <path ancilpath="txtstring" landsatpath="txtstring" modispath="txtstring" roipath="txtstring" userpath="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| roipath | process | path | text | attribute | no | --- |
| ancilpath | process | path | text | attribute | no | --- |
| userpath | process | path | text | attribute | no | --- |
| landsatpath | process | path | text | attribute | no | --- |
| modispath | process | path | text | attribute | no | --- |
