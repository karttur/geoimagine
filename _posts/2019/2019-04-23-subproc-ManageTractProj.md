---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-ManageTractProj
title: ManageTractProj
excerpt: Create a project from a user tract
image: 
rootprocid: ManageProject
subprocid: ManageTractProj
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
  <parameters compid="txtstring" copycomp="txtstring" defaultregion="txtstring" mgrstilelink="True/False" modistileconstraint="txtstring" modtilelink="True/False" projid="txtstring" projname="txtstring" tractid="txtstring" tractname="txtstring" wrstilelink="True/False">
    <projtitle>projtitle</projtitle>
    <projlabel>projlabel</projlabel>
    <tracttitle>tracttitle</tracttitle>
    <tractlabel>tractlabel</tractlabel>
  </parameters>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <srccomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring" system="txtstring"/>
  </srccomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| copycomp | process | parameters | text | attribute | no | tractproject |
| defaultregion | process | parameters | text | attribute | yes | --- |
| modistileconstraint | process | parameters | text | attribute | no | land |
| compid | process | parameters | text | attribute | yes | --- |
| tractid | process | parameters | text | attribute | yes | --- |
| tractname | process | parameters | text | attribute | yes | --- |
| projid | process | parameters | text | attribute | yes | --- |
| projname | process | parameters | text | attribute | yes | --- |
| modtilelink | process | parameters | boolean | attribute | no | --- |
| mgrstilelink | process | parameters | boolean | attribute | no | --- |
| wrstilelink | process | parameters | boolean | attribute | no | --- |
| projtitle | process | parameters | text | tag | yes | --- |
| projlabel | process | parameters | text | tag | yes | --- |
| tracttitle | process | parameters | text | tag | yes | --- |
| tractlabel | process | parameters | text | tag | yes | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | no | shp |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | no | shp |
| datfiletype | process | dstpath | text | attribute | no | --- |
| anyid1 | process | srccomp | element | element | --- | --- |
| parent | process | srccomp | text | attribute | no | process |
| element | process | srccomp | text | attribute | no | anyid1 |
| source | srccomp | anyid1 | text | attribute | no | --- |
| product | srccomp | anyid1 | text | attribute | no | --- |
| folder | srccomp | anyid1 | text | attribute | yes | anyid1 |
| band | srccomp | anyid1 | text | attribute | yes | anyid1 |
| prefix | srccomp | anyid1 | text | attribute | yes | anyid1 |
| suffix | srccomp | anyid1 | text | attribute | no | --- |
| system | srccomp | anyid1 | text | attribute | no | ancillary |
