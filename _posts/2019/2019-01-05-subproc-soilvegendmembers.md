---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-soilvegendmembers
title: soilvegendmembers
excerpt: Retrieves soil and vegetation spectral end members from tabular data
image: 
rootprocid: RetrieveEndMembers
subprocid: soilvegendmembers
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
  <parameters cleaning="True/False" slnpixels="xyz" strictclean="True/False" trimming="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <trim bandid="txtstring" max="xyz" min="xyz"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| trimming | process | parameters | bool | attribute | no | Y |
| cleaning | process | parameters | bool | attribute | no | N |
| strictclean | process | parameters | bool | attribute | no | N |
| slnpixels | process | parameters | integer | attribute | no | 1500 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | csv |
| datfiletype | process | srcpath | text | attribute | no | xml |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | endmember |
| band | process | srccomp | text | attribute | yes | veg |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| bandid | process | trim | text | attribute | yes | --- |
| min | process | trim | integer | attribute | no | --- |
| max | process | trim | integert | attribute | no | --- |
