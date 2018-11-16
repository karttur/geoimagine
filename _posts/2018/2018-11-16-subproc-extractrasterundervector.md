---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-extractrasterundervector
title: extractrasterundervector
excerpt: Extract raster values and statistics under vector
image: 
rootprocid: Extract
subprocid: extractrasterundervector
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
  <parameters max="True/False" mean="True/False" min="True/False" range="True/False" schema="txtstring" skipnull="True/False" std="True/False" table="txtstring" touch="True/False" values="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srcvector band="txtstring" day="xyz" folder="txtstring" month="xyz" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" timestep="txtstring" year="xyz"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| skipnull | process | parameters | boolean | attribute | no | True |
| touch | process | parameters | boolean | attribute | no | --- |
| values | process | parameters | boolean | attribute | no | --- |
| mean | process | parameters | boolean | attribute | no | True |
| std | process | parameters | boolean | attribute | no | --- |
| min | process | parameters | boolean | attribute | no | --- |
| max | process | parameters | boolean | attribute | no | --- |
| range | process | parameters | boolean | attribute | no | --- |
| schema | process | parameters | text | attribute | yes | --- |
| table | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srcvector | text | attribute | yes | --- |
| product | process | srcvector | text | attribute | yes | --- |
| folder | process | srcvector | text | attribute | yes | --- |
| band | process | srcvector | text | attribute | yes | vector |
| prefix | process | srcvector | text | attribute | yes | --- |
| suffix | process | srcvector | text | attribute | yes | --- |
| timestep | process | srcvector | text | attribute | no | static |
| year | process | srcvector | integer | attribute | no | 0 |
| month | process | srcvector | integer | attribute | no | 0 |
| day | process | srcvector | integer | attribute | no | 0 |
| source | process | srccomp | text | attribute | no | --- |
| product | process | srccomp | text | attribute | no | --- |
| folder | process | srccomp | text | attribute | no | --- |
| band | process | srccomp | text | attribute | no | raster |
| prefix | process | srccomp | text | attribute | no | --- |
| suffix | process | srccomp | text | attribute | no | --- |
