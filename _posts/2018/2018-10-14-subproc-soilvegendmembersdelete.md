---
layout: subprocess
categories: subprocess
date: 2018-10-14
modified: 2018-10-14
processurl: subproc-soilvegendmembersdelete
title: soilvegendmembersdelete
excerpt: Delete records with too few soilline pixels
image: 
rootprocid: RetrieveEndMembers
subprocid: soilvegendmembersdelete
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
  <srccomp band="txtstring" folder="txtstring" prefix="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
  <parameters slnpixels="xyz"/>
  <srcpath datfiletype="txtstring" hdrfiletype="txtstring" volume="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| folder | process | srccomp | text | attribute | no | endmember |
| band | process | srccomp | text | attribute | yes | veg |
| prefix | process | srccomp | text | attribute | yes | --- |
| suffix | process | srccomp | text | attribute | no | anyid |
| slnpixels | process | parameters | integer | attribute | no | 1500 |
| volume | process | srcpath | text | attribute | yes | --- |
| hdrfiletype | process | srcpath | text | attribute | yes | csv |
| datfiletype | process | srcpath | text | attribute | no | xml |
| source | process | srccomp | text | attribute | no | anyid |
| product | process | srccomp | text | attribute | no | anyid |
