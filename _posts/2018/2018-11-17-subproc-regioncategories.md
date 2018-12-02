---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-regioncategories
title: regioncategories
excerpt: Only superuser can set region categories, send request it you really need a new region category
image: 
rootprocid: ManageRegion
subprocid: regioncategories
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
  <parameters parentcat="txtstring" regioncat="txtstring" stratum="xyz">
    <anyid1 label="childnode (text)" title="childnode (text)"/>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| regioncat | process | parameters | text | attribute | yes | --- |
| parentcat | process | parameters | text | attribute | yes | --- |
| stratum | process | parameters | integer | attribute | yes | --- |
| title | parameters | anyid1 | text | tag | yes | --- |
| label | parameters | anyid1 | text | tag | yes | --- |
