---
layout: post
title: Process: grant
modified: '2018-10-10 T18:17:25.000Z'
categories: process
rootprocid: setup_db
subprocid: grant
excerpt: "GRANTS rights to various db users"
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
<sql>
	<process processid ='grant'>
		<parameters db = 'karttur' user='processread' pswd='jii8ubise'></parameters>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA process TO processread;
			GRANT SELECT ON ALL TABLES IN SCHEMA process TO processread;
			GRANT USAGE ON SCHEMA regions TO processread;
			GRANT SELECT ON regions.tracts, system.defregions TO processread;
		</command>
	</process>
```

### Parameters
