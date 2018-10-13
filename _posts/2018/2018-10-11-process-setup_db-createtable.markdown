---
layout: post
title: Process: createtable
modified: '2018-10-10 T18:17:25.000Z'
categories: process
rootprocid: setup_db
subprocid: createtable
excerpt: "Process for creating database tables"
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
	<process processid ='createtable'>
		<parameters db = 'karttur' schema = 'sentinel' table = 'regions'></parameters>
		<!-- This is the most lengthy setup, avoid deleting-->
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			regionid TEXT,
			regiontype varchar(8),
 			mgrs char(5),
 			utm smallint,
 			mgrsid char(3),
  			PRIMARY KEY (regionid,mgrs)
		</command>
	</process>
```

### Parameters

product
version
serverurl
