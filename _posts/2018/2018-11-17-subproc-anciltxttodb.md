---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-anciltxttodb
title: anciltxttodb
excerpt: Register locally organized ancillary text data in database
image: 
rootprocid: Ancillary
subprocid: anciltxttodb
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
  <parameters schema="txtstring" table="txtstring" template="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <link csvaltcolumn="xyz" csvaltnodata="txtstring" csvcolumn="xyz" csvnodata="txtstring" dbcolumn="txtstring" format="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| schema | process | parameters | text | attribute | yes | --- |
| table | process | parameters | text | attribute | yes | --- |
| template | process | parameters | text | attribute | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | yes | --- |
| product | srccomp | anyid1 | text | attribute | yes | --- |
| folder | srccomp | anyid1 | text | attribute | yes | --- |
| band | srccomp | anyid1 | text | attribute | yes | txt |
| prefix | srccomp | anyid1 | text | attribute | yes | --- |
| suffix | srccomp | anyid1 | text | attribute | yes | --- |
| csvcolumn | process | link | int | attribute | yes | --- |
| csvnodata | process | link | text | attribute | no | --- |
| csvaltcolumn | process | link | int | attribute | no | -99 |
| csvaltnodata | process | link | text | attribute | no | --- |
| format | process | link | text | attribute | no | --- |
| dbcolumn | process | link | text | attribute | yes | --- |
