---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-addsubproc
title: addsubproc
excerpt: Adding a sub processes requires data on all parameters and their type and default values
image: 
rootprocid: manageprocess
subprocid: addsubproc
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
  <parameters minuserstratum="xyz" rootprocid="txtstring" subprocid="txtstring" version="txtstring">
    <title>title</title>
    <label>label</label>
  </parameters>
  <system>
    <procsys dstdivision="txtstring" dstsystem="txtstring" srcdivision="txtstring" srcsystem="txtstring" system="txtstring"/>
  </system>
  <node element="txtstring" parent="txtstring">
    <parameter defaultvalue="txtstring" paramid="txtstring" paramtyp="txtstring" required="txtstring" tagorattr="txtstring"/>
  </node>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| rootprocid | process | parameters | text | attribute | yes | --- |
| subprocid | process | parameters | text | attribute | yes | --- |
| version | process | parameters | text | attribute | yes | --- |
| minuserstratum | process | parameters | integer | attribute | yes | 1 |
| title | process | parameters | text | tag | no | --- |
| label | process | parameters | text | tag | no | --- |
| procsys | process | system | text | element | --- | --- |
| system | system | procsys | text | attribute | yes | --- |
| srcsystem | system | procsys | text | attribute | yes | --- |
| dstsystem | system | procsys | text | attribute | yes | --- |
| srcdivision | system | procsys | text | attribute | yes | --- |
| dstdivision | system | procsys | text | attribute | yes | --- |
| parameter | process | node | element | element | --- | --- |
| parent | process | node | text | attribute | yes | --- |
| element | process | node | text | attribute | yes | --- |
| paramid | node | parameter | text | attribute | yes | --- |
| paramtyp | node | parameter | text | attribute | yes | --- |
| tagorattr | node | parameter | text | attribute | yes | --- |
| required | node | parameter | text | attribute | yes | --- |
| defaultvalue | node | parameter | text | attribute | yes | --- |
