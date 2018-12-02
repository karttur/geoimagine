---
layout: post
title: FAO reference evapotranspiration
modified: '2018-11-01 20:17'
categories: blog
excerpt: Accessing, downloadign and organizing FAO reference evapotranspiration
tags:
  - FAO reference evapotranspiration
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-01 22:03'
comments: true
share: true
---

## Introduction

this post takes you through the steps to download and prepare data on global reference evapotranspiration.

## FAO reference evapotranspiration

The FAO dataset on reference evapotranspiration (refET) is composed of monthly average layers representing 1961 to 1990. The refET varies dependent of many factors, including temperature, wind and atmospheric water vapor pressure, but for this study we will use monthly average data. The alternative, to calculate dynamic refET is complicated and the data demands exceeds the available. The dataset was created by [Climate Research Centre (Tyndall centre) in the UK as CL version 2.0](https://crudata.uea.ac.uk/~timm/grid/CRU_CL_2_0.html), but is no longer accassible from CRU, instead you have to download it from FAO.

### Access FAO refET

The FAO reference evapotranspiration (refET) dataset is available from the [FAO Geonetwork server](http://www.fao.org/geonetwork) and at the time of writing the refET dataset is [here](http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416).

At the top of the box called Transfer options there is an option to download the dataset (Global map of monthly reference evapotranspiration - 10 arc minutes - ASCII-grid). If you click, you will get all the monthly files. There is also a 3 arc minutes water balance version (the last item in the Transfer option box), but as we are going to use the refET together with the 15 arc minutes resolution of the tropical [TRMM rainfall datasets](../blog-TRMM/), use the 10 arc min version of the reference evapotranspiration.

#### Import the refET

The downloaded refET data is in ASCII (pure text) format, you can open one of the monthly files are read the values.

```
ncols  2160
nrows  1080
xllcorner  -180
yllcorner  -90
cellsize  0.166667
NODATA_value  -9
    -9     -9     -9     -9     -9     -9     -9
```

You can import the ASCII file to a more useful format (e.g. GeoTIFF) using GDAL. I use Karttur's GeoImagine framework, and all that is required is the following xml file.

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='staticmonthly'></period>

	<process processid ='organizeancillary' version = '3.0'>
		<parameters importdef='ascii'
		epsg = '4326'
		instid = 'FAO'
		dsname  = 'refevap'
		dsversion = ""
		accessdate = "20181104"
		regionid = 'global'
		regioncat = 'global'
		replacestr = 'MM'
		replacetag = 'monthlypet'
		datadir ='FAO/refevap//ref_evap_fao_10min'
		datafile ='etoMM.txt'
		dataurl = "http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416"
		metapath ="GIAR-CSI/PET_he_monthly/CGIAR-CSI Global-PET-AI-Read Me.doc"  
		metaurl="http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416"
		title = "Global reference evapotranspiration"
		label = "Global map of monthy reference evapotranspiration 10 arc minutes"
		> </parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>

		<srcpath volume = "Pegasus6/ANCILIMPORT" hdrfiletype = "asc" datfiletype = "aai"></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = "tif" datfiletype = "tif"></dstpath>


		<srcraw id="fao-refet-dayx10"
		  datadir = "FAO/refevap//ref_evap_fao_10min"
		  datafile = "etoMM"
		  datalayer = "etoMM"  
		  accessdate = "20181104"
		  theme = "climate"
		  subtheme = "reference evapotranspiration"
		  copyright =""
		  title = "reference evapotranspiration"
		  label = "Global map of monthy reference evapotranspiration 10 arc minutess"
		></srcraw>
		<dstcomp>
		  <fao-refet-dayx10 source = "fao" product = "refet" folder = "refet" band = "fao-refet-dayx10" prefix = "fao-refet-dayx10" suffix = "M" scalefac = "0.1" offsetadd = "0" dataunit = "mm/day" celltype = 'Int16' cellnull = '-32768' measure = 'R' masked='Y'>
		  </fao-refet-dayx10>
		</dstcomp>

		<monthlypet type = 'datum'>
			<compinattribute>datafile</compinattribute>
			<compinattribute>datalayer</compinattribute>
			<compoutattribute>yyyydoy</compoutattribute>
			<replace key = '01' compinreplace = '01' compoutreplace = '01'></replace>
			<replace key = '02' compinreplace = '02' compoutreplace = '02'></replace>
			<replace key = '03' compinreplace = '03' compoutreplace = '03'></replace>
			<replace key = '04' compinreplace = '04' compoutreplace = '04'></replace>
			<replace key = '05' compinreplace = '05' compoutreplace = '05'></replace>
			<replace key = '06' compinreplace = '06' compoutreplace = '06'></replace>
			<replace key = '07' compinreplace = '07' compoutreplace = '07'></replace>
			<replace key = '08' compinreplace = '08' compoutreplace = '08'></replace>
			<replace key = '09' compinreplace = '09' compoutreplace = '09'></replace>
			<replace key = '10' compinreplace = '10' compoutreplace = '10'></replace>
			<replace key = '11' compinreplace = '11' compoutreplace = '11'></replace>
			<replace key = '12' compinreplace = '12' compoutreplace = '12'></replace>
		</monthlypet>
	</process>
</organize>
```

### Convert to monthly refET

The FAO refET data comes as average daily mm x 10. To simplify the calculations, I convert this to monthly refEt in mm (x 1) which also means that the unit changes to mm/month. You can do the conversion manually, but I use the Karttur GeoImagine Framework through the following xml file:

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='staticmonthly'></period>
	<process processid ='convertdaytomonth' version = '3.0'>
		<parameters factor = '0.1' offset = '0' ></parameters>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
    	<srccomp>
			<fao-refet-dayx10 source = "fao" product = "refet" folder = "refet" band = "fao-refet-dayx10" prefix = "fao-refet-dayx10" suffix = "M">
			</fao-refet-dayx10>
		</srccomp>
		<dstcomp>
			<fao-refet source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M" scalefac = "1" offsetadd = "0" dataunit = "mm" celltype = 'Int16' cellnull = '-32768' measure = 'R'>
			</fao-refet>
		</dstcomp>
	</process>
</organize>
```
