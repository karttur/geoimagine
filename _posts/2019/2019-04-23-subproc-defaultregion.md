---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-defaultregion
title: defaultregion
excerpt: Only superuser can set default regions, send request it you really need a new default region category
image: 
rootprocid: ManageRegion
subprocid: defaultregion
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
  <parameters epsg="xyz" label="txtstring" maxlat="xyz.abc" maxlon="xyz.abc" minlat="xyz.abc" minlon="xyz.abc" parentcat="txtstring" parentid="txtstring" regioncat="txtstring" regionid="txtstring" regionname="txtstring" stratum="xyz" title="txtstring" version="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstcomp element="txtstring" parent="txtstring">
    <roi band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| regionid | process | parameters | text | attribute | yes | --- |
| regionname | process | parameters | text | attribute | yes | --- |
| regioncat | process | parameters | text | attribute | yes | --- |
| parentid | process | parameters | text | attribute | yes | --- |
| parentcat | process | parameters | text | attribute | yes | --- |
| epsg | process | parameters | integer | attribute | no | 4326 |
| stratum | process | parameters | integer | attribute | yes | --- |
| minlat | process | parameters | float | attribute | yes | --- |
| maxlat | process | parameters | float | attribute | yes | --- |
| minlon | process | parameters | float | attribute | yes | --- |
| maxlon | process | parameters | float | attribute | yes | --- |
| version | process | parameters | text | attribute | no | --- |
| title | process | parameters | text | attribute | yes | --- |
| label | process | parameters | text | attribute | yes | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | shp |
| datfiletype | process | dstpath | text | attribute | no | --- |
| roi | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | roi |
| source | dstcomp | roi | text | attribute | yes | --- |
| product | dstcomp | roi | text | attribute | yes | --- |
| folder | dstcomp | roi | text | attribute | no | defaultregions |
| band | dstcomp | roi | text | attribute | yes | roi |
| prefix | dstcomp | roi | text | attribute | no | roi |
| suffix | dstcomp | roi | text | attribute | no | --- |
| measure | dstcomp | roi | text | attribute | no | N |
| masked | dstcomp | roi | bool | attribute | no | Y |
| cellnull | dstcomp | roi | integer | attribute | no | -32768 |
| celltype | dstcomp | roi | text | attribute | no | vector |
| scalefac | dstcomp | roi | real | attribute | no | 1 |
| offsetadd | dstcomp | roi | integer | attribute | no | 0 |
| dataunit | dstcomp | roi | text | attribute | no | NA |
