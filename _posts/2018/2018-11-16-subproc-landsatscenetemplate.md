---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-landsatscenetemplate
title: landsatscenetemplate
excerpt: No label set yet.
image: 
rootprocid: LandsatProc
subprocid: landsatscenetemplate
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
  <parameters L1type="txtstring" collection="txtstring" sensat="txtstring" subtype="txtstring" tier="txtstring" typeid="txtstring">
    <dataunit>dataunit</dataunit>
    <scenenameform>scenenameform</scenenameform>
    <basenameform>basenameform</basenameform>
    <scenecompstr>scenecompstr</scenecompstr>
    <basecompstr>basecompstr</basecompstr>
    <archive>archive</archive>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | yes | --- |
| typeid | process | parameters | text | attribute | yes | --- |
| subtype | process | parameters | text | attribute | yes | A |
| L1type | process | parameters | text | attribute | no | --- |
| collection | process | parameters | text | attribute | no | --- |
| tier | process | parameters | text | attribute | no | --- |
| dataunit | process | parameters | text | tag | yes | --- |
| scenenameform | process | parameters | text | tag | no | True |
| basenameform | process | parameters | bool | tag | no | --- |
| scenecompstr | process | parameters | text | tag | no | True |
| basecompstr | process | parameters | bool | tag | no | --- |
| archive | process | parameters | text | tag | yes | USGScollL1v2016 |
