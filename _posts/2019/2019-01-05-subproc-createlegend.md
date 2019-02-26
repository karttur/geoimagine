---
layout: subprocess
categories: subprocess
date: 2019-01-05
modified: 2019-01-05
processurl: subproc-createlegend
title: createlegend
excerpt: Create legend for raster layer
image: 
rootprocid: LayoutProc
subprocid: createlegend
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
  <parameters buffer="xyz" columnhead="txtstring" columns="xyz" columntext="txtstring" compresslabels="True/False" font="txtstring" fontcolor="txtstring" fontsize="xyz" frame="xyz" framecolor="xyz" height="xyz" label="True/False" matrix="True/False" measure="txtstring" palmax="xyz" palmin="xyz" precision="xyz" rowhead="txtstring" rowtext="txtstring" separatebuffer="xyz" sticklen="xyz" two51="True/False" two52="True/False" two53="True/False" two54="True/False" two55="True/False" width="xyz"/>
  <comp band="txtstring" folder="txtstring" id="txtstring" product="txtstring" source="txtstring" suffix="txtstring"/>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| palmax | process | parameters | integer | attribute | no | 250 |
| palmin | process | parameters | integer | attribute | no | 0 |
| precision | process | parameters | integer | attribute | no | 2 |
| two51 | process | parameters | boolean | attribute | no | --- |
| two52 | process | parameters | boolean | attribute | no | --- |
| two53 | process | parameters | boolean | attribute | no | --- |
| two54 | process | parameters | boolean | attribute | no | --- |
| two55 | process | parameters | boolean | attribute | no | --- |
| height | process | parameters | integer | attribute | no | 512 |
| width | process | parameters | integer | attribute | no | 100 |
| measure | process | parameters | text | attribute | no | A |
| buffer | process | parameters | integer | attribute | no | 10 |
| frame | process | parameters | integer | attribute | no | 2 |
| framecolor | process | parameters | integer | attribute | no | 254 |
| label | process | parameters | bool | attribute | no | True |
| fontcolor | process | parameters | text | attribute | no | black |
| font | process | parameters | text | attribute | no | Vera |
| fontsize | process | parameters | integer | attribute | no | 32 |
| sticklen | process | parameters | integer | attribute | no | 10 |
| compresslabels | process | parameters | boolean | attribute | no | --- |
| separatebuffer | process | parameters | integer | attribute | no | 50 |
| columnhead | process | parameters | text | attribute | no | --- |
| columns | process | parameters | integer | attribute | no | 1 |
| matrix | process | parameters | bool | attribute | no | --- |
| columntext | process | parameters | text | attribute | no | --- |
| rowtext | process | parameters | text | attribute | no | --- |
| rowhead | process | parameters | text | attribute | no | --- |
| id | process | comp | text | attribute | yes | --- |
| source | process | comp | text | attribute | yes | --- |
| product | process | comp | text | attribute | yes | --- |
| folder | process | comp | text | attribute | yes | --- |
| band | process | comp | text | attribute | yes | --- |
| suffix | process | comp | text | attribute | yes | --- |
