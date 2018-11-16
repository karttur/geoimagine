---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-extractsoillineVI
title: extractsoillineVI
excerpt: Soil lines are extracted either for scenes/tiles or regions around sample points using a Vegetation Index
image: 
rootprocid: ExtractLayerData
subprocid: extractsoillineVI
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
  <parameters kernelsd="xyz.abc" searchpercent="xyz.abc" visoilmean="xyz" visoilrange="xyz" vivegmin="xyz"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" masked="True/False" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| searchpercent | process | parameters | float | attribute | no | 0.5 |
| kernelsd | process | parameters | float | attribute | no | 20 |
| visoilmean | process | parameters | integer | attribute | no | 975 |
| visoilrange | process | parameters | integer | attribute | no | 300 |
| vivegmin | process | parameters | integer | attribute | no | 1200 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | tif |
| datfiletype | process | srcpath | text | attribute | no | --- |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | pvipbi |
| band | process | srccomp | text | attribute | no | PVI |
| prefix | process | srccomp | text | attribute | no | PVI |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| masked | process | srccomp | bool | attribute | no | N |
