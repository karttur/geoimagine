---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-gramschmidtortho
title: gramschmidtortho
excerpt: Gram-Schmidt Orthogonalization of spectral endmembers to eigen vectors
image: 
rootprocid: Orthogonalize
subprocid: gramschmidtortho
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
  <parameters offset="True/False"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <endmember emid="txtstring" order="xyz" speclib="True/False"/>
  <band bandid="txtstring" order="xyz"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| offset | process | parameters | bool | attribute | no | True |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | csv |
| datfiletype | process | srcpath | text | attribute | no | xml |
| source | process | srccomp | text | attribute | no | anyid1 |
| product | process | srccomp | text | attribute | no | anyid1 |
| folder | process | srccomp | text | attribute | no | endmember |
| band | process | srccomp | text | attribute | yes | veg |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | no | anyid1 |
| emid | process | endmember | text | attribute | yes | --- |
| order | process | endmember | integer | attribute | yes | --- |
| speclib | process | endmember | bool | attribute | yes | --- |
| bandid | process | band | text | attribute | yes | --- |
| order | process | band | integer | attribute | yes | --- |
