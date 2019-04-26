---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-examinsoillines
title: examinsoillines
excerpt: Examine soil lines given parameter conditions
image: 
rootprocid: RetrieveEndMembers
subprocid: examinsoillines
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
  <parameters band="txtstring" maxintercept="xyz.abc" maxslope="xyz.abc" minintercept="xyz.abc" minr2="xyz.abc" minslope="xyz.abc" withincriteria="True/False"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| band | process | parameters | text | attribute | no | rl |
| minr2 | process | parameters | real | attribute | no | 0.8 |
| minslope | process | parameters | real | attribute | no | 0.75 |
| maxslope | process | parameters | real | attribute | no | 2.0 |
| minintercept | process | parameters | real | attribute | no | 0 |
| maxintercept | process | parameters | real | attribute | no | 500 |
| withincriteria | process | parameters | bool | attribute | no | --- |
