---
layout: post
title: Transfer TRMM Framework data
modified: '2018-12-15 20:17'
categories: blog
excerpt: Transfer TRMM Framework data to new machhine
tags:
  - TRMM
  - Tropical Rainfall Measurement Mission
  - transfer
  - updatedb
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-12-15 22:03'
comments: true
share: true
---

# Introduction

This post shows how to transfer the FAO reference evapotranspiration (refET) data imported and prepared using Karttur´s GeoImagine Framework to a new machine with Karttur's GeoImagine Framework setup.

# Prerequisites

You must have setup the Karttur's GeoImagine Framework as described in [earlier](../blog-import-project-eclipse/) posts. You must also have a copy of the [FAO refET produced by the Framework itself](../blog-FAO-refevap/).  

# Transfer refET data

You must decide at which processing stage you want to transfer the data. In general you should chose the stage so that all the data you are interested in are included in either that or any subsequent step in the processing chain. In this example you will transfer the originally imported monthly refET. This

## Copy data folder

After deciding which composition to use as starting point, you must copy the folder from the existing storage device to the storage device you want to use with your new installation. You can also copy any child compositions that you are interested in. The Framework will then detect them and register them rather than reprocessing when running the processes. To copy the children is usually faster compared to reprocessing. For this example you can copy everything under the

- Rainfall
- rainfall-A
- rainfall-A-change
- rainfall-A-stats
- rainfall-A-trend

Copy them to the same hierarchical structure on the new volume (storage device) '/Volumes/"dstvolume"/ancillary/TRMM/region/'

## Update database

When you have organized the TRMM data on a new storage device, the process <span class='package'>updatedb</span> will check for the existence of the composition and register existing layers in the Framework database.

```
<?xml version='1.0' encoding='utf-8'?>
<updatedb>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<process processid ='updatedbAncillary' dsversion = '1.3'>
		<parameters></parameters>
		<dstpath volume = "karttur3tb" hdrfiletype='tif'></dstpath>
		<dstcomp>
			<trmm-3b43v7-precip  source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f"
				cellnull='-32768' celltype='Int16' measure='R' dataunit='mm/month' scalfac='1' offsetadd='0'>
			</trmm-3b43v7-precip>
		</dstcomp>
	</process>
</updatedb>
```

## Chain processes

Once the TRMM data is registered in the Framework database you can run the subsequent processes. In the text file below the processing include 0) setting the TRMM layout, 1) the transfer itself, 2) resampling to annual precipitation, 3) Calculating annual trend and trend significance, and 5) Exporting the TRMM data and analysis results as images and animations.

```
##### 0 TRMM TRANSFER #####

### 0 Set layout ###

# 0.0 Create scaling
TRMM000_createscaling_v80.xml

# 0.0 Create palette
#TRMM000_createpalettes_v80.xml

# 0.0 Create movieclock
#TRMM000_addmovieclock.xml

### 1 Transfer composition ###

# 1.3 Update db
#TRMM013_udatedb_v80.xml

### 2 Resample to annual precipitation ###

# 2.1 resample TRMM to annual
#TRMM021_resample-2-annual_v80.xml

### 3 Calculate annual trend and trend significance ###

# 3.1 Annual trend TRMM
#TRMM031_trend_A_v80.xml

# 3.2 Regions with significant trends
#TRMM032_significant_changes_v80.xml

### 5 Export ###

# 5.0 Export
# Export monthly TRMM
#TRMM050_ExporttoByte_M_v80.xml
# Export statistical TRMM
#TRRM050_ExporttoByte_timespanA_v80.xml

# 5.5 Create movieframes
# For fully automated processing you need to set parameter "asscript" to False
#TRMM055_movieframes_M_v80.xml
#If you set the parameter "asscript" to True (= default),
#you have to execute the shell script file reported by the process
#"volume"/movieclock/export/trmm/region/rainfall/trmm/movieframes/movieframes_trmm-3b43v7-precip.sh

#Create movieclock
# For fully automated processing you need to set parameter "asscript" to False
TRMM056_movieclock_M_v80.xml
#If you set the parameter "asscript" to True (= default),
#you have to execute the shell script file reported by the process
#"volume"/movieclock/export/trmm/region/rainfall/trmm/frames/frame_trmm-3b43v7-precip.sh
#"volume"/movieclock/export/trmm/region/rainfall/trmm/movie/movie_trmm-3b43v7-precip.sh
```

All the xml files required follows below.

### 0.0 TRMM000_createscaling_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<scaling>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- Create scaling -->

	<!-- TRMM 3B43 mm/month-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.65' scalefac='3'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f"></comp>
	</process>

	<!-- TRMM 3B43 mm/year-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.65' scalefac='0.63'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "avg-trmm-3b43v7-precip" prefix = "avg-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-ic-trmm-3b43v7-precip" prefix = "ols-ic-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
		<comp id = '3' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-ic-trmm-3b43v7-precip" prefix = "ts-ic-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
	</process>

	<!-- TRMM 3B43 std mm/year-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.65' scalefac='2.52'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "std-trmm-3b43v7-precip" prefix = "std-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-rmse-trmm-3b43v7-precip" prefix = "ols-rmse-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
	</process>

	<!-- TRMM mannkendall Z-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='40' offsetadd='125' ></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "mk-z-trmm-3b43v7-precip" prefix = "mk-z-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
	</process>

	<!-- TRMM 3B43 r2-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='100'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-r2-trmm-3b43v7-precip" prefix = "ols-r2-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
	</process>

	<!-- TRMM 3B43 slope mm/year-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0='True' power='0.76' scalefac='1.88'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-mdsl-trmm-3b43v7-precip" prefix = "ts-mdsl-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-losl-trmm-3b43v7-precip" prefix = "ts-losl-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
		<comp id = '3' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-hisl-trmm-3b43v7-precip" prefix = "ts-hisl-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
		<comp id = '4' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-sl-trmm-3b43v7-precip" prefix = "ols-sl-trmm-3b43v7-precip" suffix = "v7-f-A"></comp>
	</process>


	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.75' scalefac='0.5' mirror0='True'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model-v7-f-A"></comp>
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='1' mirror0='True'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-delta" prefix = "trmm-3b43v7-precip-delta" suffix = "slope@p-v7-f-A"></comp>
	</process>
</scaling>
```

### 0.0 TRMM000_createpalettes_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<path></path>

	<!-- addrasterpalette preciplinear-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters palette = 'preciplinear' compid='test'>
			<setcolor id = '0' value = '0' red = '215' green ='76' blue='56' alpha ='0' label='0' hint='0' ></setcolor>				
			<setcolor id = '25' value = '25' red = '241' green ='115' blue='46' alpha ='0' label='25' hint='NA' ></setcolor>			
			<setcolor id = '50' value = '50' red = '255' green ='170' blue='51' alpha ='0' label='50' hint='50' ></setcolor>
			<setcolor id = '75' value = '75' red = '255' green ='222' blue='66' alpha ='0' label='75' hint='NA' ></setcolor>
			<setcolor id = '100' value = '100' red = '210' green ='251' blue='75' alpha ='0' label='100' hint='100' ></setcolor>
			<setcolor id = '125' value = '125' red = '138' green ='253' blue='75' alpha ='0' label='125' hint='NA' ></setcolor>
			<setcolor id = '150' value = '150' red = '90' green ='220' blue='90' alpha ='0' label='150' hint='150' ></setcolor>
			<setcolor id = '175' value = '175' red = '30' green ='177' blue='125' alpha ='0' label='150' hint='NA' ></setcolor>			
			<setcolor id = '200' value = '200' red = '10' green ='120' blue='165' alpha ='0' label='175' hint='200' ></setcolor>
			<setcolor id = '225' value = '225' red = '0' green ='79' blue='140' alpha ='0' label='200' hint='NA' ></setcolor>				
			<setcolor id = '250' value = '250' red = '0' green ='43' blue='117' alpha ='0' label='200' hint='250' ></setcolor>				
			<setcolor id = '253' value = '253' red = '240' green ='240' blue='132' alpha ='0' label='dry (0)' hint='NA' ></setcolor>
			<setcolor id = '254' value = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' value = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<!-- addrasterpalette precipln-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters palette = 'precipln' compid='test'>
			<setcolor id = '0' value = '0' red = '215' green ='76' blue='56' alpha ='0' label='0' hint='0' ></setcolor>				
			<setcolor id = '8' value = '8' red = '241' green ='115' blue='46' alpha ='0' label='8' hint='NA' ></setcolor>			
			<setcolor id = '13' value = '13' red = '255' green ='170' blue='51' alpha ='0' label='13' hint='NA' ></setcolor>
			<setcolor id = '20' value = '20' red = '255' green ='222' blue='66' alpha ='0' label='20' hint='NA' ></setcolor>
			<setcolor id = '31' value = '31' red = '210' green ='251' blue='75' alpha ='0' label='31' hint='31' ></setcolor>
			<setcolor id = '49' value = '49' red = '138' green ='253' blue='75' alpha ='0' label='49' hint='NA' ></setcolor>
			<setcolor id = '76' value = '76' red = '90' green ='220' blue='90' alpha ='0' label='76' hint='76' ></setcolor>			
			<setcolor id = '120' value = '120' red = '30' green ='177' blue='125' alpha ='0' label='120' hint='120' ></setcolor>
			<setcolor id = '188' value = '188' red = '0' green ='90' blue='150' alpha ='0' label='188' hint='188' ></setcolor>				
			<setcolor id = '250' value = '250' red = '0' green ='43' blue='117' alpha ='0' label='250' hint='250' ></setcolor>				
			<setcolor id = '253' value = '253' red = '240' green ='240' blue='132' alpha ='0' label='dry (0)' hint='NA' ></setcolor>
			<setcolor id = '254' value = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' value = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<!-- addrasterpalette precipdelta-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters palette = 'precipdelta' compid='test'>
			<setcolor id = '0' value = '0' red = '215' green ='76' blue='56' alpha ='0' label='0' hint='%(d)s' ></setcolor>			
			<setcolor id = '63' value = '63' red = '255' green ='170' blue='51' alpha ='0' label='63' hint='%(d)s' ></setcolor>					
			<setcolor id = '125' value = '125' red = '224' green ='224' blue='224' alpha ='0' label='125' hint='%(d)s' ></setcolor>
			<setcolor id = '187' value = '187' red = '30' green ='177' blue='125' alpha ='0' label='188' hint='%(d)s' ></setcolor>
			<setcolor id = '250' value = '250' red = '0' green ='43' blue='117' alpha ='0' label='250' hint='%(d)s' ></setcolor>
			<setcolor id = '253' value = '253' red = '245' green ='237' blue='182' alpha ='0' label='253' hint='NA' ></setcolor>
			<setcolor id = '254' value = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='NA' ></setcolor>
			<setcolor id = '255' value = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<!-- addrasterpalette preciplinearstd-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters palette = 'preciplinearstd' compid='test'>			
			<setcolor id = '0' value = '0' red = '224' green ='224' blue='224' alpha ='0' label='0' hint='%(d)s' ></setcolor>
			<setcolor id = '83' value = '83' red = '210' green ='251' blue='75' alpha ='0' label='83' hint='%(d)s' ></setcolor>
			<setcolor id = '167' value = '167' red = '30' green ='177' blue='125' alpha ='0' label='167' hint='%(d)s' ></setcolor>
			<setcolor id = '250' value = '250' red = '0' green ='43' blue='117' alpha ='0' label='250' hint='%(d)s' ></setcolor>
			<setcolor id = '253' value = '253' red = '245' green ='237' blue='182' alpha ='0' label='253' hint='NA' ></setcolor>
			<setcolor id = '254' value = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='NA' ></setcolor>
			<setcolor id = '255' value = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<!-- addrasterpalette preciplnstd-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters palette = 'preciplnstd' compid='test'>				
			<setcolor id = '0' value = '0' red = '224' green ='224' blue='224' alpha ='0' label='0' hint='%(d)s' ></setcolor>
			<setcolor id = '8' value = '8' red = '241' green ='115' blue='46' alpha ='0' label='25' hint='NA' ></setcolor>
			<setcolor id = '13' value = '13' red = '255' green ='170' blue='51' alpha ='0' label='50' hint='NA' ></setcolor>
			<setcolor id = '20' value = '20' red = '255' green ='222' blue='66' alpha ='0' label='20' hint='NA' ></setcolor>
			<setcolor id = '31' value = '31' red = '210' green ='251' blue='75' alpha ='0' label='31' hint='31' ></setcolor>
			<setcolor id = '49' value = '49' red = '138' green ='253' blue='75' alpha ='0' label='49' hint='NA' ></setcolor>
			<setcolor id = '76' value = '76' red = '90' green ='220' blue='90' alpha ='0' label='76' hint='76' ></setcolor>			
			<setcolor id = '120' value = '120' red = '30' green ='177' blue='125' alpha ='0' label='120' hint='120' ></setcolor>
			<setcolor id = '188' value = '188' red = '0' green ='90' blue='150' alpha ='0' label='188' hint='188' ></setcolor>				
			<setcolor id = '250' value = '250' red = '0' green ='43' blue='117' alpha ='0' label='250' hint='250' ></setcolor>
			<setcolor id = '253' value = '253' red = '245' green ='237' blue='182' alpha ='0' label='253' hint='NA' ></setcolor>
			<setcolor id = '254' value = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='NA' ></setcolor>
			<setcolor id = '255' value = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>
</palette>
```

### 0.0 TRMM000_addmovieclock.xml

```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<path></path>

	<!-- Add movieclock -->
	<process processid = 'addmovieclock'>
		<parameters name = 'trmm'>
		</parameters>
	</process>
</palette>
```

### 2.1 TRMM021_resample-2-annual_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<resamplets>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>

	<process processid = 'resampletsancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters method = 'sum' targettimestep = 'A' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f" timestep='M'>
			</trmm-3b43v7-precip>
		</srccomp>
		<dstcomp>
			<trmm-3b43v7-precip band = "trmm-3b43v7-precip" suffix = "auto" dataunit = 'mm/yr' timestep='A'>
			</trmm-3b43v7-precip>
		</dstcomp>
	</process>
</resamplets>
```

### 3.1 TRMM031_trend_A_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<trendts>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='A'></period>

	<!-- Trend calculation -->
	<process processid = 'trendtsancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  source = "trmm" product = "3b43" folder = "rainfall-A" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-A">
			</trmm-3b43v7-precip>
		</srccomp>
		<stats id = 'avg' band = "avg"></stats>
		<stats id= 'std' band = "std"></stats>
		<stats id= 'mk' band = "mk"></stats>
		<stats id= 'ols' band = "ols"></stats>
	</process>
</trendts>
```

### 3.2 TRMM032_significant_changes_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<signiftrend>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- Extract cells with significatn trends -->
	<process processid = 'signiftrendsancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters basename='trmm-3b43v7-precip' threshold = '1.96'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<mk-z-trmm-3b43v7-precip id = 'significance' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "mk-z-trmm-3b43v7-precip" prefix = "mk-z-trmm-3b43v7-precip" suffix = "v7-f-A">
			</mk-z-trmm-3b43v7-precip>
			<ts-mdsl-trmm-3b43v7-precip id = 'slope' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-mdsl-trmm-3b43v7-precip" prefix = "ts-mdsl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-mdsl-trmm-3b43v7-precip>
			<ts-ic-trmm-3b43v7-precip id = 'intercept' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-ic-trmm-3b43v7-precip" prefix = "ts-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-ic-trmm-3b43v7-precip>
		</srccomp>
	</process>
</signiftrend>
```

### 5 Export ###

### 5.0 TRMM050_ExporttoByte_M_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<export>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<!-- Export monthly precipitation -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'precipln'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip id = 'layer1' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</export>
```

### 5.5 TRMM055_movieframes_M_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<mavieframe>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<!-- Create movie frame -->
	<process processid = 'movieframeancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'smap' width = '800' crop='800,222,0,0' emboss='KARTTUR' embossdims='720,150' embossptsize='100' asscript='True'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip id = 'movieframe' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</movieframe>
```

### TRMM056_movieclock_M_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<movieclock>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<!-- Create movie frame and movie -->
	<process processid = 'movieclockancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'trmm' width = '800' asscript='False'></parameters>
		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<dstcomp>
			<trmm-3b43v7-precip id = 'layer3' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</dstcomp>
	</process>
</movieclock>
```

### 5.0 TRRM050_ExporttoByte_timespanA_v80.xml

```
<?xml version='1.0' encoding='utf-8'?>
<export>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- exporttobyte avg A -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'precipln'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<avg-trmm-3b43v7-precip id = 'layer1' source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "avg-trmm-3b43v7-precip" prefix = "avg-trmm-3b43v7-precip" suffix = "v7-f-A">
			</avg-trmm-3b43v7-precip>
			<ols-ic-trmm-3b43v7-precip id = 'layer2' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-ic-trmm-3b43v7-precip" prefix = "ols-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-ic-trmm-3b43v7-precip>
			<ts-ic-trmm-3b43v7-precip id = 'layer3' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-ic-trmm-3b43v7-precip" prefix = "ts-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-ic-trmm-3b43v7-precip>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'precipdelta'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<ols-sl-trmm-3b43v7-precip id = 'layer4' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-sl-trmm-3b43v7-precip" prefix = "ols-sl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-sl-trmm-3b43v7-precip>
			<ts-mdsl-trmm-3b43v7-precip id = 'layer5' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-mdsl-trmm-3b43v7-precip" prefix = "ts-mdsl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-mdsl-trmm-3b43v7-precip>
			<ts-losl-trmm-3b43v7-precip id = 'layer5' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-losl-trmm-3b43v7-precip" prefix = "ts-losl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-losl-trmm-3b43v7-precip>
			<ts-hisl-trmm-3b43v7-precip id = 'layer5' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-hisl-trmm-3b43v7-precip" prefix = "ts-hisl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-hisl-trmm-3b43v7-precip>

		</srccomp>
	</process>

	<!-- exporttobyte std + rmse A -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'preciplnstd'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<std-trmm-3b43v7-precip id = 'layer' source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "std-trmm-3b43v7-precip" prefix = "std-trmm-3b43v7-precip" suffix = "v7-f-A">
			</std-trmm-3b43v7-precip>
			<ols-rmse-trmm-3b43v7-precip id = 'layer2' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-rmse-trmm-3b43v7-precip" prefix = "ols-rmse-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-rmse-trmm-3b43v7-precip>
		</srccomp>
	</process>


	<!-- TRMM mannkendall Z-->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'zhydro'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<mk-z-trmm-3b43v7-precip id='layer' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "mk-z-trmm-3b43v7-precip" prefix = "mk-z-trmm-3b43v7-precip" suffix = "v7-f-A">
			</mk-z-trmm-3b43v7-precip>
			<ols-r2-trmm-3b43v7-precip id='layer2' source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-r2-trmm-3b43v7-precip" prefix = "ols-r2-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-r2-trmm-3b43v7-precip>
		</srccomp>
	</process>

	<!-- TRMM mannkendall Z-->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'precipdelta'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip-change id = 'layer1' source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model-v7-f-A">
			</trmm-3b43v7-precip-change>
			<trmm-3b43v7-precip-delta id = 'layer3' source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-delta" prefix = "trmm-3b43v7-precip-delta" suffix = "slope@p-v7-f-A">
			</trmm-3b43v7-precip-delta>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'precipdelta'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip-change id = 'layer2' source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model@p-v7-f-A">
			</trmm-3b43v7-precip-change>
		</srccomp>
	</process>
</export>
```
