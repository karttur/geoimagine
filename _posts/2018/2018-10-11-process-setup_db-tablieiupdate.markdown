---
layout: post
title: Process: tableinsert
modified: '2018-10-10 T18:17:25.000Z'
categories: process
rootprocid: setup_db
subprocid: tableinsert
excerpt: "Process for inserting data to tables"
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
	<process processid ='tableupdate'>
		<parameters db = 'karttur' schema = 'userlocale' table = 'users'></parameters>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<command>WHERE userid = 'inGenkangiSSa'
			<columns>usercat, stratum, organization, mobile, country, email1, email2</columns>  
			<values>'super', 10, 'Karttur AB', '+46725140003', 'SE','thomas.gumbricht@gmail.com','thomasg@karttur.com'</values>
		</command>
	</process>
```

### Parameters

product
version
serverurl
