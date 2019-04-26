---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-addpubtext
title: addpubtext
excerpt: Add raster palette
image: 
rootprocid: LayoutProc
subprocid: addpubtext
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
  <parameters compid="txtstring" palversion="xyz" product="xyz" suffix="xyz">
    <title>title</title>
    <header>header</header>
    <subheader>subheader</subheader>
    <legendheader>legendheader</legendheader>
    <legendtype>legendtype</legendtype>
    <banner>banner</banner>
    <hints>hints</hints>
    <acknow>acknow</acknow>
    <descript>descript</descript>
    <reference>reference</reference>
    <disclaim>disclaim</disclaim>
    <copyrigth>copyrigth</copyrigth>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| compid | process | parameters | text | attribute | yes | --- |
| palversion | process | parameters | integer | attribute | yes | --- |
| product | process | parameters | integer | attribute | yes | --- |
| suffix | process | parameters | integer | attribute | yes | --- |
| title | process | parameters | string | tag | yes | --- |
| header | process | parameters | string | tag | yes | --- |
| subheader | process | parameters | string | tag | yes | --- |
| legendheader | process | parameters | string | tag | yes | --- |
| legendtype | process | parameters | string | tag | yes | --- |
| banner | process | parameters | string | tag | yes | --- |
| hints | process | parameters | string | tag | yes | --- |
| acknow | process | parameters | string | tag | yes | --- |
| descript | process | parameters | string | tag | yes | --- |
| reference | process | parameters | string | tag | yes | --- |
| disclaim | process | parameters | string | tag | yes | --- |
| copyrigth | process | parameters | string | tag | yes | --- |
