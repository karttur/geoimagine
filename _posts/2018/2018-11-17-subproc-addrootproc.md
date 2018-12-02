---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-addrootproc
title: addrootproc
excerpt: Root processes are contianers for processes having similar input/output requirements
image: 
rootprocid: manageprocess
subprocid: addrootproc
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
  <parameters rootprocid="txtstring">
    <title>title</title>
    <label>label</label>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| rootprocid | process | parameters | text | attribute | yes | --- |
| title | process | parameters | text | tag | no | --- |
| label | process | parameters | text | tag | no | --- |
