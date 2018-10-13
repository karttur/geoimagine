---
layout: post
title: SearchSmapProducts
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
<SearchSmapProducts>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'smap'></userproj>
	<period startyear = '2015' startmonth = '03' startday = '31' endyear = '2015' endmonth = '08' endday = '08' timestep='1D'></period>
	<process processid ='SearchSmapProducts' dsversion = '1.3'>
		<parameters product="SPL3SMP_E" version="002" serverurl="https://n5eil01u.ecs.nsidc.org/" ></parameters>
		<dstpath volume = "Karttur2tb" </dstpath>
	</process>
</SearchSmapProducts>
```

### Parameters

product
version
serverurl
