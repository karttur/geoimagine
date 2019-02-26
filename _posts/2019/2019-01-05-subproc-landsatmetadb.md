---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-landsatmetadb
title: landsatmetadb
excerpt: Create db tables and columns and link csv column data to db
image: 
rootprocid: LandsatProc
subprocid: landsatmetadb
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
  <parameters collection="txtstring" filetype="txtstring" sensat="txtstring" sensor="txtstring"/>
  <column column="txtstring" csv="txtstring" default="txtstring" length="xyz" required="True/False" table="txtstring" type="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | no | L** |
| sensor | process | parameters | text | attribute | yes | --- |
| filetype | process | parameters | text | attribute | yes | csv |
| collection | process | parameters | text | attribute | yes | --- |
| csv | process | column | text | attribute | yes | --- |
| table | process | column | text | attribute | yes | --- |
| column | process | column | text | attribute | yes | --- |
| type | process | column | text | attribute | yes | --- |
| length | process | column | integer | attribute | no | 1 |
| required | process | column | bool | attribute | yes | --- |
| default | process | column | text | attribute | no | --- |
