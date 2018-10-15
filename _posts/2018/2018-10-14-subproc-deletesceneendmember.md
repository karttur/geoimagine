---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-deletesceneendmember
title: deletesceneendmember
excerpt: Delete endmembers for single scene
image: 
rootprocid: RetrieveEndMembers
subprocid: deletesceneendmember
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
  <parameters cleaning="True/False" sceneid="True/False" slnpixels="xyz" strictclean="True/False"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sceneid | process | parameters | bool | attribute | no | Y |
| cleaning | process | parameters | bool | attribute | no | N |
| strictclean | process | parameters | bool | attribute | no | N |
| slnpixels | process | parameters | integer | attribute | no | 1500 |
