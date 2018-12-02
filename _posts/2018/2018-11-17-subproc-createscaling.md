---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-createscaling
title: createscaling
excerpt: Create legend for raster layer
image: 
rootprocid: LayoutProc
subprocid: createscaling
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
  <parameters dstmax="xyz.abc" dstmin="xyz.abc" mirror0="True/False" offsetadd="xyz.abc" power="xyz.abc" powerna="xyz" scalefac="xyz.abc" srcmax="xyz.abc" srcmin="xyz.abc"/>
  <comp band="txtstring" folder="txtstring" id="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| power | process | parameters | real | attribute | no | 0 |
| powerna | process | parameters | integer | attribute | no | 251 |
| mirror0 | process | parameters | boolean | attribute | no | --- |
| scalefac | process | parameters | real | attribute | no | 1 |
| offsetadd | process | parameters | real | attribute | no | 0 |
| srcmin | process | parameters | real | attribute | no | 0 |
| srcmax | process | parameters | real | attribute | no | 0 |
| dstmin | process | parameters | real | attribute | no | 0 |
| dstmax | process | parameters | real | attribute | no | 0 |
| id | process | comp | text | attribute | yes | --- |
| source | process | comp | text | attribute | yes | --- |
| product | process | comp | text | attribute | yes | --- |
| folder | process | comp | text | attribute | yes | --- |
| band | process | comp | text | attribute | yes | --- |
| suffix | process | comp | text | attribute | yes | --- |
