---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-extractsoillinePVIPBI
title: extractsoillinePVIPBI
excerpt: Soil lines are extracted either for scenes/tiles or regions around sample points using the Perpendicular Vegetation Index and the Perpendicular Backgrund Index
image: 
rootprocid: ExtractLayerData
subprocid: extractsoillinePVIPBI
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
  <parameters kernelsd="xyz.abc" pbisoilmax="xyz" pbisoilmin="xyz" pvisoilmean="xyz" pvisoilrange="xyz" pvivegmin="xyz" radius="xyz" searchpercent="xyz.abc"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <seccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| radius | process | parameters | integer | attribute | no | 500 |
| searchpercent | process | parameters | float | attribute | no | 0.5 |
| kernelsd | process | parameters | float | attribute | no | 15 |
| pbisoilmax | process | parameters | integer | attribute | no | 1500 |
| pbisoilmin | process | parameters | integer | attribute | no | 0 |
| pvisoilmean | process | parameters | integer | attribute | no | 950 |
| pvisoilrange | process | parameters | integer | attribute | no | 250 |
| pvivegmin | process | parameters | integer | attribute | no | 1500 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | seccomp | text | attribute | no | anyid1 |
| product | process | seccomp | text | attribute | no | anyid1 |
| folder | process | seccomp | text | attribute | no | pvipbi |
| band | process | seccomp | text | attribute | no | pvi |
| prefix | process | seccomp | text | attribute | no | pvi |
| suffix | process | seccomp | text | attribute | no | anyid1 |
| masked | process | seccomp | bool | attribute | no | N |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | srfi |
| band | process | srccomp | text | attribute | no | allbands |
| prefix | process | srccomp | text | attribute | no | anyid1 |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
