---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-defaultregionfromvector
title: defaultregionfromvector
excerpt: Only superuser can set default regions, send request it you really need a new default region category
image: 
rootprocid: ManageRegion
subprocid: defaultregionfromvector
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
  <parameters categorycol="txtstring" epsg="xyz" idcol="txtstring" namecol="txtstring" parentcatcol="txtstring" parentidcol="txtstring" stratumcol="txtstring" version="txtstring">
    <titlecol>titlecol</titlecol>
    <labelcol>labelcol</labelcol>
  </parameters>
  <srcpath hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid band="txtstring" folder="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  </srccomp>
  <dstcopy band="txtstring" srccomp="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| idcol | process | parameters | text | attribute | yes | ISO_A3 |
| namecol | process | parameters | text | attribute | yes | NAME |
| categorycol | process | parameters | text | attribute | yes | CATEGORY |
| parentidcol | process | parameters | text | attribute | yes | PARENTNAME |
| parentcatcol | process | parameters | text | attribute | yes | PARENTCAT |
| stratumcol | process | parameters | text | attribute | yes | STRATUM |
| version | process | parameters | text | attribute | no | --- |
| epsg | process | parameters | integer | attribute | yes | --- |
| titlecol | process | parameters | text | tag | yes | FORMALNAME |
| labelcol | process | parameters | text | tag | yes | TYPE |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | shp |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid |
| source | srccomp | anyid | text | attribute | yes | --- |
| product | srccomp | anyid | text | attribute | yes | --- |
| folder | srccomp | anyid | text | attribute | yes | --- |
| band | srccomp | anyid | text | attribute | yes | anyid |
| suffix | srccomp | anyid | text | attribute | yes | --- |
| srccomp | process | dstcopy | text | attribute | yes | --- |
| band | process | dstcopy | text | attribute | yes | --- |
