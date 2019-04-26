---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-extractcsvplots
title: extractcsvplots
excerpt: Extract raster for plots listed in csv file
image: 
rootprocid: Extract
subprocid: extractcsvplots
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
  <parameters epsg="xyz" max="True/False" mean="True/False" min="True/False" range="True/False" skipnull="True/False" std="True/False" values="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <csvsrc filepath="txtstring" id="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| epsg | process | parameters | integer | attribute | no | 4326 |
| skipnull | process | parameters | boolean | attribute | no | True |
| values | process | parameters | boolean | attribute | no | --- |
| mean | process | parameters | boolean | attribute | no | True |
| std | process | parameters | boolean | attribute | no | --- |
| min | process | parameters | boolean | attribute | no | --- |
| max | process | parameters | boolean | attribute | no | --- |
| range | process | parameters | boolean | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| id | process | csvsrc | text | attribute | yes | fp |
| filepath | process | csvsrc | text | attribute | yes | --- |
| source | process | srccomp | text | attribute | no | --- |
| product | process | srccomp | text | attribute | no | --- |
| folder | process | srccomp | text | attribute | no | --- |
| band | process | srccomp | text | attribute | no | raster |
| prefix | process | srccomp | text | attribute | no | --- |
| suffix | process | srccomp | text | attribute | no | --- |
