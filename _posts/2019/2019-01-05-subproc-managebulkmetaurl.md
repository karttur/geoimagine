---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-managebulkmetaurl
title: managebulkmetaurl
excerpt: Only required if the url link to the USGS bulk metadata changes
image: 
rootprocid: LandsatProc
subprocid: managebulkmetaurl
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
  <parameters collection="txtstring" enddate="YYYYMMDD" sensat="txtstring" sensor="txtstring" startdate="YYYYMMDD">
    <label>label</label>
    <xmlurl>xmlurl</xmlurl>
    <csvgzurl>csvgzurl</csvgzurl>
    <csvlocal>csvlocal</csvlocal>
    <xmllocal>xmllocal</xmllocal>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| sensat | process | parameters | text | attribute | yes | --- |
| sensor | process | parameters | text | attribute | yes | --- |
| startdate | process | parameters | date | attribute | yes | --- |
| enddate | process | parameters | date | attribute | no | --- |
| collection | process | parameters | text | attribute | yes | --- |
| label | process | parameters | text | tag | no | --- |
| xmlurl | process | parameters | url | tag | no | --- |
| csvgzurl | process | parameters | url | tag | no | --- |
| csvlocal | process | parameters | text | tag | yes | --- |
| xmllocal | process | parameters | text | tag | yes | --- |
