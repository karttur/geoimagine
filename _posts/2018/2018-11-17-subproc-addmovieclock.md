---
layout: subprocess
categories: subprocess
date: 2018-11-17
modified: 2018-11-17
processurl: subproc-addmovieclock
title: addmovieclock
excerpt: Create movieclock layout
image: 
rootprocid: LayoutProc
subprocid: addmovieclock
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
  <parameters bgcolor="txtstring" boettcolor="txtstring" clborder="xyz" clbordercolor="txtstring" clcolor="txtstring" clframecolor="txtstring" clhandcolor="txtstring" clmargin="txtstring" clradius="xyz" font="txtstring" fontbackground="txtstring" fontcolor="txtstring" fontsize="xyz" name="txtstring" position="txtstring" rotate="xyz" textatclock="True/False" textinvideo="True/False" tickcolor="txtstring" tlborder="xyz" tlbordercolor="txtstring" tlcolor="txtstring" tlheight="xyz" tlmargin="txtstring" tlticks="xyz" tltickwidth="xyz" transparent="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| name | process | parameters | text | attribute | yes | --- |
| tlmargin | process | parameters | string | attribute | no | {5,5,5,5} |
| clmargin | process | parameters | string | attribute | no | {5,5,5,5} |
| position | process | parameters | text | attribute | no | ll |
| bgcolor | process | parameters | text | attribute | no | black |
| tlborder | process | parameters | integer | attribute | no | 2 |
| clborder | process | parameters | integer | attribute | no | 6 |
| tlbordercolor | process | parameters | text | attribute | no | beige |
| clbordercolor | process | parameters | text | attribute | no | beige |
| clcolor | process | parameters | text | attribute | no | blue |
| tlheight | process | parameters | integer | attribute | no | 10 |
| tlticks | process | parameters | integer | attribute | no | 1 |
| tltickwidth | process | parameters | integer | attribute | no | 2 |
| tickcolor | process | parameters | text | attribute | no | beige |
| boettcolor | process | parameters | text | attribute | no | silver |
| textatclock | process | parameters | bool | attribute | no | --- |
| tlcolor | process | parameters | text | attribute | no | purple |
| clradius | process | parameters | integer | attribute | no | 50 |
| clhandcolor | process | parameters | text | attribute | no | purple |
| clframecolor | process | parameters | text | attribute | no | black |
| fontsize | process | parameters | integer | attribute | no | 24 |
| fontcolor | process | parameters | text | attribute | no | grey |
| fontbackground | process | parameters | text | attribute | no | black |
| rotate | process | parameters | integer | attribute | no | 0 |
| font | process | parameters | text | attribute | no | Arial |
| textinvideo | process | parameters | bool | attribute | no | --- |
| transparent | process | parameters | text | attribute | no | black |
