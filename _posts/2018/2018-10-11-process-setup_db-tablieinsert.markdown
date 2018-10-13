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
	<process processid ='tableinsert'>
		<parameters db = 'karttur' schema = 'userlocale' table = 'users'></parameters>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<command>
			<columns>userid,userpswd</columns>  
			<values>'inGenkangiSSa','jfeo-P9hy4-Oinv-'</values>
		</command>
	</process>
```

### Parameters

product
version
serverurl
