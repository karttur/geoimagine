---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-createproj
title: createproj
excerpt: Create a project and a default project tract associated with a default region
image: 
rootprocid: ManageProject
subprocid: createproj
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
  <parameters parentid="txtstring" projid="txtstring" projname="txtstring" tractid="txtstring" tractname="txtstring">
    <projtitle>projtitle</projtitle>
    <projlabel>projlabel</projlabel>
    <tracttitle>tracttitle</tracttitle>
    <tractlabel>tractlabel</tractlabel>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| parentid | process | parameters | text | attribute | yes | --- |
| tractid | process | parameters | text | attribute | yes | --- |
| tractname | process | parameters | text | attribute | yes | --- |
| projid | process | parameters | text | attribute | yes | --- |
| projname | process | parameters | text | attribute | yes | --- |
| projtitle | process | parameters | text | tag | yes | --- |
| projlabel | process | parameters | text | tag | yes | --- |
| tracttitle | process | parameters | text | tag | yes | --- |
| tractlabel | process | parameters | text | tag | yes | --- |
