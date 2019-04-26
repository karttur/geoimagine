---
layout: subprocess
categories: subprocess
date: 2019-04-23
modified: 2019-04-23
processurl: subproc-manageuser
title: manageuser
excerpt: Add, update or remover users
image: 
rootprocid: ManageUser
subprocid: manageuser
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
  <parameters usercat="txtstring" userid="txtstring" userpswd="txtstring">
    <firstname>firstname</firstname>
    <middlename>middlename</middlename>
    <lastname>lastname</lastname>
    <adressname>adressname</adressname>
    <title>title</title>
    <usetitle>usetitle</usetitle>
    <country>country</country>
    <state>state</state>
    <adress1>adress1</adress1>
    <adress2>adress2</adress2>
    <postcode>postcode</postcode>
    <postadress>postadress</postadress>
    <email1>email1</email1>
    <email2>email2</email2>
    <landline>landline</landline>
    <mobile>mobile</mobile>
    <organization>organization</organization>
    <department>department</department>
    <orgunit>orgunit</orgunit>
    <position>position</position>
  </parameters>
</process>
```

| paramid | parent | element | type | tagorattr | required | default |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| userid | process | parameters | text | attribute | yes | --- |
| userpswd | process | parameters | text | attribute | yes | --- |
| usercat | process | parameters | text | attribute | yes | --- |
| firstname | process | parameters | text | tag | no | --- |
| middlename | process | parameters | text | tag | no | --- |
| lastname | process | parameters | text | tag | no | --- |
| adressname | process | parameters | text | tag | no | --- |
| title | process | parameters | text | tag | no | --- |
| usetitle | process | parameters | boolean | tag | no | N |
| country | process | parameters | text | tag | no | --- |
| state | process | parameters | text | tag | no | --- |
| adress1 | process | parameters | text | tag | no | --- |
| adress2 | process | parameters | text | tag | no | --- |
| postcode | process | parameters | text | tag | no | --- |
| postadress | process | parameters | text | tag | no | --- |
| email1 | process | parameters | text | tag | no | --- |
| email2 | process | parameters | text | tag | no | --- |
| landline | process | parameters | text | tag | no | --- |
| mobile | process | parameters | text | tag | no | --- |
| organization | process | parameters | text | tag | no | --- |
| department | process | parameters | text | tag | no | --- |
| orgunit | process | parameters | text | tag | no | --- |
| position | process | parameters | text | tag | no | --- |
