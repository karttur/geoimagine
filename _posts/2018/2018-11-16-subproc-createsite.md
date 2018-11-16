---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-createsite
title: createsite
excerpt: Only superuser can set sites at present, send request it you really need a new default region category
image: 
rootprocid: ManageRegion
subprocid: createsite
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
  <parameters siteid="txtstring" sitename="txtstring" tractid="txtstring">
    <sitetitle>sitetitle</sitetitle>
    <sitelabel>sitelabel</sitelabel>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| tractid | process | parameters | text | attribute | yes | --- |
| siteid | process | parameters | text | attribute | yes | --- |
| sitename | process | parameters | text | attribute | yes | --- |
| sitetitle | process | parameters | text | tag | yes | --- |
| sitelabel | process | parameters | text | tag | yes | --- |
