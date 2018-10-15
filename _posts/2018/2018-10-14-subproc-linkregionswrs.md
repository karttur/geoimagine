---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-linkregionswrs
title: linkregionswrs
excerpt: No label set yet.
image: 
rootprocid: ManageRegion
subprocid: linkregionswrs
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
  <parameters pathfield="txtstring" rowfield="txtstring" wrs="xyz"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| wrs | process | parameters | integer | attribute | no | --- |
| pathfield | process | parameters | text | attribute | no | --- |
| rowfield | process | parameters | text | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | yes | --- |
| product | process | srccomp | text | attribute | yes | --- |
| folder | process | srccomp | text | attribute | yes | --- |
| band | process | srccomp | text | attribute | yes | main |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | yes | --- |
