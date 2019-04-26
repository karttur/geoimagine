---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-CreateDefRegProj
title: CreateDefRegProj
excerpt: Create a project and a default project tract based on a default region
image: 
rootprocid: ManageProject
subprocid: CreateDefRegProj
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
  <parameters defaultregion="txtstring" projid="txtstring" projname="txtstring" usertractid="txtstring" usertractname="txtstring">
    <projtitle>projtitle</projtitle>
    <projlabel>projlabel</projlabel>
    <tracttitle>tracttitle</tracttitle>
    <tractlabel>tractlabel</tractlabel>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| defaultregion | process | parameters | text | attribute | yes | --- |
| usertractid | process | parameters | text | attribute | yes | --- |
| usertractname | process | parameters | text | attribute | yes | --- |
| projid | process | parameters | text | attribute | yes | --- |
| projname | process | parameters | text | attribute | yes | --- |
| projtitle | process | parameters | text | tag | yes | --- |
| projlabel | process | parameters | text | tag | yes | --- |
| tracttitle | process | parameters | text | tag | yes | --- |
| tractlabel | process | parameters | text | tag | yes | --- |
