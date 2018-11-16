---
layout: subprocess
categories: subprocess
date: 2018-11-16
modified: 2018-11-16
processurl: subproc-organizeancillary
title: organizeancillary
excerpt: Organize local (downloaded or created) ancillary data
image: 
rootprocid: Ancillary
subprocid: organizeancillary
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
  <parameters accessdate="txtstring" copyright="txtstring" dataurl="txtstring" dsname="txtstring" dsversion="txtstring" epsg="xyz" importdef="txtstring" instid="txtstring" label="txtstring" metapath="txtstring" metaurl="txtstring" regionid="txtstring" replacestr="txtstring" replacetag="txtstring" title="txtstring"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
  <dstpath datfiletype="txtstring" division="txtstring" hdrfiletype="txtstring" system="txtstring" volume="txtstring"/>
  <srcraw accessdate="txtstring" copyright="txtstring" datadir="txtstring" datafile="txtstring" datalayer="txtstring" dataurl="txtstring" dsversion="txtstring" id="txtstring" label="txtstring" measure="txtstring" metapath="txtstring" metaurl="txtstring" product="txtstring" subtheme="txtstring" theme="txtstring" title="txtstring"/>
  <dstcomp element="txtstring" parent="txtstring">
    <anyid1 band="txtstring" cellnull="xyz" celltype="txtstring" dataunit="txtstring" folder="txtstring" masked="True/False" measure="txtstring" offsetadd="xyz" prefix="txtstring" product="txtstring" scalefac="xyz.abc" source="txtstring" suffix="txtstring"/>
  </dstcomp>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| importdef | process | parameters | text | attribute | yes | tif |
| epsg | process | parameters | int | attribute | no | 0 |
| instid | process | parameters | text | attribute | yes | --- |
| dsname | process | parameters | text | attribute | yes | --- |
| dsversion | process | parameters | text | attribute | no | 0 |
| accessdate | process | parameters | text | attribute | no | --- |
| regionid | process | parameters | text | attribute | yes | --- |
| dataurl | process | parameters | text | attribute | no | --- |
| metaurl | process | parameters | text | attribute | no | --- |
| metapath | process | parameters | text | attribute | no | --- |
| title | process | parameters | text | attribute | no | --- |
| label | process | parameters | text | attribute | no | --- |
| copyright | process | parameters | text | attribute | no | unknown |
| replacestr | process | parameters | text | attribute | no | --- |
| replacetag | process | parameters | text | attribute | no | --- |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | --- |
| datfiletype | process | srcpath | text | attribute | no | --- |
| volume | process | dstpath | text | attribute | yes | --- |
| hdrfiletype | process | dstpath | text | attribute | yes | --- |
| datfiletype | process | dstpath | text | attribute | no | --- |
| system | process | dstpath | text | attribute | no | ANCILLARY |
| division | process | dstpath | text | attribute | no | region |
| id | process | srcraw | text | attribute | no | any |
| datadir | process | srcraw | text | attribute | no | --- |
| datafile | process | srcraw | text | attribute | no | --- |
| datalayer | process | srcraw | text | attribute | no | --- |
| measure | process | srcraw | text | attribute | no | --- |
| dsversion | process | srcraw | text | attribute | no | --- |
| accessdate | process | srcraw | text | attribute | no | --- |
| product | process | srcraw | text | attribute | no | --- |
| theme | process | srcraw | text | attribute | no | --- |
| subtheme | process | srcraw | text | attribute | no | --- |
| copyright | process | srcraw | text | attribute | no | --- |
| title | process | srcraw | text | attribute | no | --- |
| label | process | srcraw | text | attribute | no | --- |
| metapath | process | srcraw | text | attribute | no | --- |
| dataurl | process | srcraw | text | attribute | no | --- |
| metaurl | process | srcraw | text | attribute | no | --- |
| anyid1 | process | dstcomp | element | element | --- | --- |
| parent | process | dstcomp | text | attribute | no | process |
| element | process | dstcomp | text | attribute | no | anyid1 |
| source | dstcomp | anyid1 | text | attribute | yes | --- |
| product | dstcomp | anyid1 | text | attribute | yes | --- |
| folder | dstcomp | anyid1 | text | attribute | yes | --- |
| band | dstcomp | anyid1 | text | attribute | yes | anyid1 |
| prefix | dstcomp | anyid1 | text | attribute | no | --- |
| suffix | dstcomp | anyid1 | text | attribute | no | --- |
| measure | dstcomp | anyid1 | text | attribute | no | N |
| masked | dstcomp | anyid1 | bool | attribute | yes | --- |
| cellnull | dstcomp | anyid1 | integer | attribute | yes | --- |
| celltype | dstcomp | anyid1 | text | attribute | yes | --- |
| scalefac | dstcomp | anyid1 | real | attribute | no | 1 |
| offsetadd | dstcomp | anyid1 | integer | attribute | no | 0 |
| dataunit | dstcomp | anyid1 | text | attribute | yes | --- |
