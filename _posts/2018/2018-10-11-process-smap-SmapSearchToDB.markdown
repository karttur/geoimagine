---
layout: post
title: SmapSearchToDB
modified: '2018-10-10 T18:17:25.000Z'
categories: process
rootprocid: smapproc
subprocid: SearchSmapProducts
excerpt: "xml definitions for package: smap"
tags:
  - Python package
  - SMAP
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-10 T18:17:25.000Z'
comments: true
share: true
title: ''
label: ''
---

## XML
```
<?xml version='1.0' encoding='utf-8'?>
<SmapSearchToDB>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'smap'></userproj>
	<period startyear = '2015' startmonth = '03' startday = '31' endyear = '2020' endmonth = '01' endday = '01' timestep='1D'></period>
	<process processid ='SmapSearchToDB' dsversion = '1.3'>
		<parameters product="SPL3FTP" version="002" serverurl="https://n5eil01u.ecs.nsidc.org/" ></parameters>
		<srcpath volume = "Karttur2tb"  hdrfiletype = "" datfiletype = ""></srcpath>
	</process>
	<process processid ='SmapSearchToDB' dsversion = '1.3'>
		<parameters product="SPL3FTP_E" version="002" serverurl="https://n5eil01u.ecs.nsidc.org/" ></parameters>
		<srcpath volume = "Karttur2tb" hdrfiletype = "" datfiletype = ""></srcpath>
	</process>
	<process processid ='SmapSearchToDB' dsversion = '1.3'>
		<parameters product="SPL3SMP" version="005" serverurl="https://n5eil01u.ecs.nsidc.org/" ></parameters>
		<srcpath volume = "Karttur2tb" hdrfiletype = "" datfiletype = ""></srcpath>
	</process>
	<process processid ='SmapSearchToDB' dsversion = '1.3'>
		<parameters product="SPL3SMP_E" version="002" serverurl="https://n5eil01u.ecs.nsidc.org/" ></parameters>
		<srcpath volume = "Karttur2tb" hdrfiletype = "" datfiletype = ""></srcpath>
	</process>
</SmapSearchToDB>
```

### Parameters

product
version
serverurl
