---
layout: post
title: Transfer VWB Framework
modified: '2018-12-16 20:17'
categories: blog
excerpt: Transfer VWB Framework data to new machhine
tags:
  - Vertical Water Balance
  - transfer
  - updatedb
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-12-16 22:03'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>
# Introduction

This post shows how to transfer Vertical Water Balance data created using Karttur´s GeoImagine Framework to another machine with the Framework installed but without the VWB data.

# Prerequisites

You must have setup the Karttur's GeoImagine Framework as described in [earlier](../blog-import-project-eclipse/) posts. You must also have a copy of the [VWB dataset produced by the Framework itself](../blog-VWB/).  

# Transfer VWB data

You must decide at which processing stage you want to transfer the data. In general you should chose the stage so that all the data you are interested in are included in either that, or any subsequent, step in the processing chain. In this example you will transfer the land masked monthly VWB (step 2.0 in the post [Vertical Water Balance](../blog-VWB/)).

## Copy data folder

After deciding which composition to use as starting point, you must copy the folder from the existing storage device to the storage device you want to use with your new machine/installation. You can also copy all child compositions that you are interested in using. The Framework will then detect them and register them rather than reprocessing. To copy the children is usually faster compared to reprocessing. For this example you can copy the following folders under '/Volumes/"srcvolume"/ancillary/vwb/region/':

- trmm-vwb
- trmm-vwb-A
- trmm-vwb-A-change
- trmm-vwb-A-stats
- trmm-vwb-A-trend

Copy them to the same hierarchical structure on the new volume (storage device) '/Volumes/"dstvolume"/ancillary/vwb/region/'

## Update database

When you have organized the VWB data on a new storage device, the process [<span class='package'>updatedbAncillary</span>](../../subprocess/subproc-updatedbAncillary/) will check for the existence of the composition and register existing layers in the Framework database.

```
<?xml version='1.0' encoding='utf-8'?>
<updatedb>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<process processid ='updatedbAncillary' dsversion = '1.3'>
		<parameters></parameters>
		<dstpath volume = "karttur3tb" hdrfiletype='tif'></dstpath>
		<dstcomp>
			<trmm-fao-vwb source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m"
					cellnull='-32768' celltype='Int16' measure='R' dataunit='mm/month' scalfac='1' offsetadd='0'>
			</trmm-fao-vwb>
			<trmm-fao-vwb-surplus source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m"
					cellnull='-32768' celltype='Int16' measure='R' dataunit='mm/month' scalfac='1' offsetadd='0'>
			</trmm-fao-vwb-surplus>
			<trmm-fao-vwb-deficit source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m"
					cellnull='-32768' celltype='Int16' measure='R' dataunit='mm/month' scalfac='1' offsetadd='0'>
			</trmm-fao-vwb-deficit>
		</dstcomp>
	</process>
</updatedb>
```

## Chain processes

Once the VWB data is registered in the Framework database you can run the subsequent processes. In the text file below the processing include 0) setting the VWB layout, 1) the transfer itself, 2) resampling to annual VWB, 3) Calculating annual trend and trend significance, and 5) Exporting the VWB data and analysis results as images and animations.

<button id= "toggleprocesschain" onclick="hiddencode('processchain')">Hide/Show VWB processchain</button>

<div id="processchain" style="display:none">

{% capture text-capture %}
{% raw %}

```
##### VWB TRANSFER #####

#Uncomment the processes you want to run by removing the "#"

# 0.0 Create scaling
#VWB000_createscaling_v80.xml

# 0.0 Create palettes
#VWB000_createpalettes_v80.xml

# 0.0 Add movieclock
#VWB000_addmovieclock.xml

# 1.3 Update db
#VWB013_udatedb_v80.xml

# 2.1 Resample to annual
#VWB021_resample-2-annual_v80.xml

# 3.1 Annual trend
#VWB031_trend_A_v80.xml

# 3.2 Get regions with significant trends
#VWB032_significant_changes_v80.xml

# 5.0 Export to byte with colored palettes
#VWB050_ExporttoByte_M_v80.xml
#VWB050_ExporttoByte_VWB-timespanA_v80.xml

# 5.5 Create movieframes
# For fully automated processing you need to set parameter "asscript" to False
#VWB055_movieframes_M_v80.xml
#If you set the parameter "asscript" to True (= default),
#you have to execute the shell script file reported by the process
#"volume"/movieclock/export/trmm-vwb/region/vwb/trmm/movieframes/movieframes_trmm-fao-vwb.sh

# 5.6 Create movieclock
# For fully automated processing you need to set parameter "asscript" to False
#VWB056_movieclock_M_v80.xml
#If you set the parameter "asscript" to True (= default),
#you have to execute the shell script file reported by the process
#"volume"/movieclock/export/trmm-vwb/region/vwb/trmm/frames/frame_trmm-fao-vwb.sh
#"volume"/movieclock/export/trmm-vwb/region/vwb/trmm/movie/movie_trmm-fao-vwb.sh
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

All the xml files required follows below.

### 0.0 VWB000_createscaling_v80.xml

Process: [<span class='package'>createscaling</span>](../../subprocess/subproc-createscaling/).

<button id= "togglecreatescaling" onclick="hiddencode('createscaling')">Hide/Show VWB000_createscaling_v80.xml</button>

<div id="createscaling" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<scaling>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- Create scaling -->

	<!-- VWB monthly -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.75' scalefac='0.8' mirror0='True'></parameters>		
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m"></comp>
	</process>

	<!-- VWB annual -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.75' scalefac='0.15' mirror0='True'></parameters>		
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "avg-trmm-fao-vwb" prefix = "avg-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "avg-trmm-fao-vwb-surplus" prefix = "avg-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "avg-trmm-fao-vwb-deficit" prefix = "avg-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-ic-trmm-fao-vwb" prefix = "ols-ic-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-ic-trmm-fao-vwb-surplus" prefix = "ols-ic-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-ic-trmm-fao-vwb-deficit" prefix = "ols-ic-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '7' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb" prefix = "ts-ic-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '8' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb-surplus" prefix = "ts-ic-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '9' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb-deficit" prefix = "ts-ic-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<!-- VWB annual std and rmse -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.75' scalefac='0.8' mirror0='True'></parameters>		
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb" prefix = "avg-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb-surplus" prefix = "avg-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb-deficit" prefix = "avg-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb" prefix = "avg-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb-surplus" prefix = "avg-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb-deficit" prefix = "avg-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<!-- VWB mannkendall Z-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='40' offsetadd='125' ></parameters>			
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb" prefix = "mk-z-trmm-fao-vwb" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb-surplus" prefix = "mk-z-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb-deficit" prefix = "mk-z-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<!-- VWB r2-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='100'></parameters>			
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-r2-trmm-fao-vwb" prefix = "ols-r2-trmm-fao-vwb" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-r2-trmm-fao-vwb-surplus" prefix = "ols-r2-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-r2-trmm-fao-vwb-deficit" prefix = "ols-r2-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<!-- VWB slope mm/year-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0='True' power='0.75' scalefac='2'></parameters>
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb" prefix = "ts-mdsl-trmm-fao-vwb" suffix = "v7-f-m-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-losl-trmm-fao-vwb" prefix = "ts-losl-ttrmm-fao-vwb" suffix = "v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-hisl-trmm-fao-vwb" prefix = "ts-hisl-ttrmm-fao-vwb" suffix = "v7-f-m-A"></comp>
		<comp id = '4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-sl-trmm-fao-vwb" prefix = "ols-sl-trmm-fao-vwb" suffix = "v7-f-m-A"></comp>    	
		<comp id = '5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb-deficit" prefix = "ts-mdsl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-losl-trmm-fao-vwb-deficit" prefix = "ts-losl-ttrmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '7' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-hisl-trmm-fao-vwb-deficit" prefix = "ts-hisl-ttrmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '8' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-sl-trmm-fao-vwb-deficit" prefix = "ols-sl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '9' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb-surplus" prefix = "ts-mdsl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '10' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-losl-trmm-fao-vwb-surplus" prefix = "ts-losl-ttrmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '11' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-hisl-trmm-fao-vwb-surplus" prefix = "ts-hisl-ttrmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '12' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-sl-trmm-fao-vwb-surplus" prefix = "ols-sl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
	</process>

	<!-- VWB change -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power='0.75' scalefac='0.3' mirror0='True'></parameters>
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-change" prefix = "trmm-fao-vwb-change" suffix = "model-v7-f-m-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-change" prefix = "trmm-fao-vwb-surplus-change" suffix = "model-v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-change" prefix = "trmm-fao-vwb-deficit-change" suffix = "model-v7-f-m-A"></comp>
	</process>

	<!-- VWB change -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power='0.75' scalefac='3' mirror0='True'></parameters>
		<comp id = '1' source = "trmm" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-delta" prefix = "trmm-fao-vwb-delta" suffix = "slope@p-v7-f-m-A"></comp>
		<comp id = '2' source = "trmm" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-delta" prefix = "trmm-fao-vwb-surplus-delta" suffix = "slope@p-v7-f-m-A"></comp>
		<comp id = '3' source = "trmm" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-delta" prefix = "trmm-fao-vwb-deficit-delta" suffix = "slope@p-v7-f-m-A"></comp>
	</process>
</scaling>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 0.0 TVWB000_createpalettes_v80.xml

Process: [<span class='package'>addrasterpalette</span>](../../subprocess/subproc-addrasterpalette/).

<button id= "togglecreatepalettes" onclick="hiddencode('createpalettes')">Hide/Show VWB000_createpalettes_v80.xml</button>

<div id="createpalettes" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- addrasterpalette VWB-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters compid= 'NA' palette = 'vwb'>
			<setcolor id = '0' red = '103' green ='0' blue='31' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>			
			<setcolor id = '25' red = '178' green ='24' blue='43' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '50' red = '214' green ='96' blue='77' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '75' red = '244' green ='165' blue='130' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '100' red = '253' green ='219' blue='199' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '125' red = '224' green ='224' blue='224' alpha ='0' label='max npv' hint='strongly significant positive trend' ></setcolor>
			<setcolor id = '150' red = '202' green ='219' blue='253' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>			
			<setcolor id = '175' red = '146' green ='197' blue='222' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '200' red = '67' green ='147' blue='195' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '225' red = '33' green ='102' blue='173' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '250' red = '5' green ='48' blue='97' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '253' red = '245' green ='237' blue='182' alpha ='0' label='unused' hint='NA' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters compid= 'NA' palette = 'vwbinvert'>
			<setcolor id = '250' red = '103' green ='0' blue='31' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>			
			<setcolor id = '225' red = '178' green ='24' blue='43' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '200' red = '214' green ='96' blue='77' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '175' red = '244' green ='165' blue='130' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '150' red = '253' green ='219' blue='199' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '125' red = '224' green ='224' blue='224' alpha ='0' label='max npv' hint='strongly significant positive trend' ></setcolor>
			<setcolor id = '100' red = '202' green ='219' blue='253' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>			
			<setcolor id = '75' red = '146' green ='197' blue='222' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '50' red = '67' green ='147' blue='195' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '25' red = '33' green ='102' blue='173' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '0' red = '5' green ='48' blue='97' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '253' red = '245' green ='237' blue='182' alpha ='0' label='unused' hint='NA' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters compid= 'NA' palette = 'VWBdeficit'>
			<setcolor id = '0' red = '224' green ='224' blue='224' alpha ='0' label='max npv' hint='strongly significant positive trend' ></setcolor>
			<setcolor id = '50' red = '253' green ='219' blue='199' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '100' red = '244' green ='165' blue='130' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '150' red = '214' green ='96' blue='77' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '200' red = '178' green ='24' blue='43' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '250' red = '103' green ='0' blue='31' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>																				
			<setcolor id = '253' red = '245' green ='237' blue='182' alpha ='0' label='dry (0)' hint='completely dry' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '0' green ='0' blue='0' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters compid= 'NA' palette = 'VWBsurplus'>
			<setcolor id = '0' red = '224' green ='224' blue='224' alpha ='0' label='max npv' hint='strongly significant positive trend' ></setcolor>
			<setcolor id = '50' red = '202' green ='219' blue='253' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>			
			<setcolor id = '100' red = '146' green ='197' blue='222' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '150' red = '67' green ='147' blue='195' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '200' red = '33' green ='102' blue='173' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '250' red = '5' green ='48' blue='97' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '253' red = '245' green ='237' blue='182' alpha ='0' label='dry (0)' hint='completely dry' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '0' green ='0' blue='0' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters compid= 'NA' palette = 'VWBstd'>
			<setcolor id = '0' red = '224' green ='224' blue='224' alpha ='0' label='max npv' hint='strongly significant positive trend' ></setcolor>
			<setcolor id = '50' red = '202' green ='219' blue='253' alpha ='0' label='strongly neg' hint='strongly significant negative trend' ></setcolor>			
			<setcolor id = '100' red = '146' green ='197' blue='222' alpha ='0' label='neg' hint='significant negative' ></setcolor>			
			<setcolor id = '150' red = '67' green ='147' blue='195' alpha ='0' label='non significant' hint='non significant negative trend' ></setcolor>			
			<setcolor id = '200' red = '33' green ='102' blue='173' alpha ='0' label='no trend' hint='no trend' ></setcolor>
			<setcolor id = '250' red = '5' green ='48' blue='97' alpha ='0' label='non significant' hint='non significant positive trend' ></setcolor>
			<setcolor id = '253' red = '245' green ='237' blue='182' alpha ='0' label='dry (0)' hint='completely dry' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '0' green ='0' blue='0' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>

</palette>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 0.0 VWB000_addmovieclock.xml

Process: [<span class='package'>addmovieclock</span>](../../subprocess/subproc-addmovieclock/).

<button id= "toggleaddmovieclock" onclick="hiddencode('addmovieclock')">Hide/Show VWB000_addmovieclock.xml</button>

<div id="addmovieclock" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<movieclock>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<path></path>

	<!--  Add movieclock -->
	<process processid = 'addmovieclock'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters name = 'vwb'>
		</parameters>
	</process>
</movieclock>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 2.1 VWB021_resample-2-annual_v80.xml

Process: [<span class='package'>resampletsancillary</span>](../../subprocess/subproc-resampletsancillary/).

<button id= "togglearesamplets" onclick="hiddencode('resamplets')">Hide/Show VWB021_resample-2-annual_v80.xml</button>

<div id="resamplets" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>

	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='M'></period>

	<!-- Resample to annual-->
	<process processid = 'resampletsancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters method = 'sum' targettimestep = 'A' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m" timestep='M'>
			</trmm-fao-vwb>
		</srccomp>
		<dstcomp>
			<trmm-fao-vwb band = "trmm-fao-vwb" suffix = "auto" dataunit = 'mm/yr' timestep='A'>
			</trmm-fao-vwb>
		</dstcomp>
	</process>

	<!-- Resample to annual-->
	<process processid = 'resampletsancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters method = 'sum' targettimestep = 'A' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-surplus source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m" timestep='M'>
			</trmm-fao-vwb-surplus>
		</srccomp>
		<dstcomp>
			<trmm-fao-vwb-surplus band = "trmm-fao-vwb-surplus" suffix = "auto" dataunit = 'mm/yr' timestep='A'>
			</trmm-fao-vwb-surplus>
		</dstcomp>
	</process>

	<!-- Resample to annual-->
	<process processid = 'resampletsancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters method = 'sum' targettimestep = 'A' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-deficit source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m" timestep='M'>
			</trmm-fao-vwb-deficit>
		</srccomp>
		<dstcomp>
			<trmm-fao-vwb-deficit band = "trmm-fao-vwb-deficit" suffix = "auto" dataunit = 'mm/yr' timestep='A'>
			</trmm-fao-vwb-deficit>
		</dstcomp>
	</process>

</runprocess>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 3.1 VWB031_trend_A_v80.xml

Process: [<span class='package'>trendtsancillary</span>](../../subprocess/subproc-trendtsancillary/).

<button id= "toggletrendts" onclick="hiddencode('trendts')">Hide/Show VWB031_trend_A_v80.xml</button>

<div id="trendts" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<trendts>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='A'></period>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'trendtsancillary' version = '1.3'>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb source = "trmm-vwb" product = "3b43" folder = "vwb-A" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m-A">
			</trmm-fao-vwb>
		</srccomp>
		<stats id = 'avg' band = "avg"></stats>
		<stats id= 'std' band = "std"></stats>
		<stats id= 'mk' band = "mk"></stats>
		<stats id= 'ols' band = "ols"></stats>
	</process>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'trendtsancillary' version = '1.3'>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-surplus source = "trmm-vwb" product = "3b43" folder = "vwb-A" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</trmm-fao-vwb-surplus>
		</srccomp>
		<stats id = 'avg' band = "avg"></stats>
		<stats id= 'std' band = "std"></stats>
		<stats id= 'mk' band = "mk"></stats>
		<stats id= 'ols' band = "ols"></stats>
	</process>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'trendtsancillary' version = '1.3'>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-deficit source = "trmm-vwb" product = "3b43" folder = "vwb-A" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</trmm-fao-vwb-deficit>
		</srccomp>
		<stats id = 'avg' band = "avg"></stats>
		<stats id= 'std' band = "std"></stats>
		<stats id= 'mk' band = "mk"></stats>
		<stats id= 'ols' band = "ols"></stats>
	</process>

</trendts>

```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 3.2 VWB032_significant_changes_v80.xml

Process: [<span class='package'>signiftrendsancillary</span>](../../subprocess/subproc-signiftrendsancillary/).

<button id= "togglesignif" onclick="hiddencode('signif')">Hide/Show VWB032_significant_changes_v80.xml</button>

<div id="signif" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<signifchange>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- Identify cells with significant changes -->
	<process processid = 'signiftrendsancillary' version = '1.3'>
		<parameters basename='trmm-fao-vwb' threshold = '1.96'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<mk-z-trmm-fao-vwb id = 'significance' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb" prefix = "mk-z-trmm-fao-vwb" suffix = "v7-f-m-A">
			</mk-z-trmm-fao-vwb>
			<ts-mdsl-trmm-fao-vwb id = 'slope' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb" prefix = "ts-mdsl-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ts-mdsl-trmm-fao-vwb>
			<ts-ic-trmm-fao-vwb id = 'intercept' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb" prefix = "ts-ic-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ts-ic-trmm-fao-vwb>
		</srccomp>
	</process>

	<process processid = 'signiftrendsancillary' version = '1.3'>
		<parameters basename='trmm-fao-vwb-surplus' threshold = '1.96'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<mk-z-trmm-fao-vwb-surplus id = 'significance' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb-surplus" prefix = "mk-z-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</mk-z-trmm-fao-vwb-surplus>
			<ts-mdsl-trmm-fao-vwb-surplus id = 'slope' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb-surplus" prefix = "ts-mdsl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ts-mdsl-trmm-fao-vwb-surplus>
			<ts-ic-trmm-fao-vwb-surplus id = 'intercept' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb-surplus" prefix = "ts-ic-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ts-ic-trmm-fao-vwb-surplus>
		</srccomp>
	</process>

	<process processid = 'signiftrendsancillary' version = '1.3'>
		<parameters basename='trmm-fao-vwb-deficit' threshold = '1.96'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<mk-z-trmm-fao-vwb-deficit id = 'significance' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb-deficit" prefix = "mk-z-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</mk-z-trmm-fao-vwb-deficit>
			<ts-mdsl-trmm-fao-vwb-deficit id = 'slope' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb-deficit" prefix = "ts-mdsl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ts-mdsl-trmm-fao-vwb-deficit>
			<ts-ic-trmm-fao-vwb-deficit id = 'intercept' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb-deficit" prefix = "ts-ic-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ts-ic-trmm-fao-vwb-deficit>
		</srccomp>
	</process>

</signifchange>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 5.0 VWB050_ExporttoByte_M_v80.xml

Process: [<span class='package'>exporttobyteancillary</span>](../../subprocess/subproc-exporttobyteancillary/).

<button id= "toggleexportm" onclick="hiddencode('exportm')">Hide/Show VWB050_ExporttoByte_M_v80.xml</button>

<div id="exportm" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<export>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<!-- Export to byte with colored palettes -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m">
			</trmm-fao-vwb>
			<trmm-fao-vwb-surplus id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m">
			</trmm-fao-vwb-surplus>
			<trmm-fao-vwb-deficit id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m">
			</trmm-fao-vwb-deficit>
		</srccomp>
	</process>
</export>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 5.0 VWB050_ExporttoByte_timespanA_v80.xml

Process: [<span class='package'>exporttobyteancillary</span>](../../subprocess/subproc-exporttobyteancillary/).

<button id= "toggleexportA" onclick="hiddencode('exportA')">Hide/Show VWB050_ExporttoByte_timespanA_v80.xml</button>

<div id="exportA" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<export>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- exporttobyte avg A -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<avg-trmm-fao-vwb id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "avg-trmm-fao-vwb" prefix = "avg-trmm-fao-vwb" suffix = "v7-f-m-A">
			</avg-trmm-fao-vwb>
			<avg-trmm-fao-vwb-surplus id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "avg-trmm-fao-vwb-surplus" prefix = "avg-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</avg-trmm-fao-vwb-surplus>
			<avg-trmm-fao-vwb-deficit id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "avg-trmm-fao-vwb-deficit" prefix = "avg-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</avg-trmm-fao-vwb-deficit>

			<ols-ic-trmm-fao-vwb id = 'layer4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-ic-trmm-fao-vwb" prefix = "ols-ic-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ols-ic-trmm-fao-vwb>
			<ols-ic-trmm-fao-vwb-surplus id = 'layer5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-ic-trmm-fao-vwb-surplus" prefix = "ols-ic-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ols-ic-trmm-fao-vwb-surplus>
			<ols-ic-trmm-fao-vwb-deficit id = 'layer6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-ic-trmm-fao-vwb-deficit" prefix = "ols-ic-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ols-ic-trmm-fao-vwb-deficit>

			<ts-ic-trmm-fao-vwb id = 'layer7' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb" prefix = "ts-ic-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ts-ic-trmm-fao-vwb>
			<ts-ic-trmm-fao-vwb-surplus id = 'layer8' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb-surplus" prefix = "ts-ic-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ts-ic-trmm-fao-vwb-surplus>
			<ts-ic-trmm-fao-vwb-deficit id = 'layer9' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-ic-trmm-fao-vwb-deficit" prefix = "ts-ic-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ts-ic-trmm-fao-vwb-deficit>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>

			<ols-sl-trmm-fao-vwb id = 'layer4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-sl-trmm-fao-vwb" prefix = "ols-sl-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ols-sl-trmm-fao-vwb>
			<ols-sl-trmm-fao-vwb-surplus id = 'layer5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-sl-trmm-fao-vwb-surplus" prefix = "ols-sl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ols-sl-trmm-fao-vwb-surplus>
			<ols-sl-trmm-fao-vwb-deficit id = 'layer6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-sl-trmm-fao-vwb-deficit" prefix = "ols-sl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ols-sl-trmm-fao-vwb-deficit>

			<ts-mdsl-trmm-fao-vwb id = 'layer7' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb" prefix = "ts-mdsl-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ts-mdsl-trmm-fao-vwb>
			<ts-mdsl-trmm-fao-vwb-surplus id = 'layer8' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb-surplus" prefix = "ts-mdsl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ts-mdsl-trmm-fao-vwb-surplus>
			<ts-mdsl-trmm-fao-vwb-deficit id = 'layer9' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-mdsl-trmm-fao-vwb-deficit" prefix = "ts-mdsl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ts-mdsl-trmm-fao-vwb-deficit>

			<ts-losl-trmm-fao-vwb id = 'layer7' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-losl-trmm-fao-vwb" prefix = "ts-losl-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ts-losl-trmm-fao-vwb>
			<ts-losl-trmm-fao-vwb-surplus id = 'layer8' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-losl-trmm-fao-vwb-surplus" prefix = "ts-losl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ts-losl-trmm-fao-vwb-surplus>
			<ts-losl-trmm-fao-vwb-deficit id = 'layer9' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-losl-trmm-fao-vwb-deficit" prefix = "ts-losl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ts-losl-trmm-fao-vwb-deficit>

			<ts-hisl-trmm-fao-vwb id = 'layer7' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-hisl-trmm-fao-vwb" prefix = "ts-hisl-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ts-hisl-trmm-fao-vwb>
			<ts-hisl-trmm-fao-vwb-surplus id = 'layer8' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-hisl-trmm-fao-vwb-surplus" prefix = "ts-hisl-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ts-hisl-trmm-fao-vwb-surplus>
			<ts-hisl-trmm-fao-vwb-deficit id = 'layer9' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ts-hisl-trmm-fao-vwb-deficit" prefix = "ts-hisl-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ts-hisl-trmm-fao-vwb-deficit>
		</srccomp>
	</process>

	<!-- exporttobyte std + rmse A -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>

			<std-trmm-fao-vwb id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb" prefix = "std-trmm-fao-vwb" suffix = "v7-f-m-A">
			</std-trmm-fao-vwb>
			<std-trmm-fao-vwb-surplus id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb-surplus" prefix = "std-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</std-trmm-fao-vwb-surplus>
			<std-trmm-fao-vwb-deficit id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb-deficit" prefix = "std-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</std-trmm-fao-vwb-deficit>
			<std-trmm-3b43v7-precip id = 'layer' source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "std-trmm-3b43v7-precip" prefix = "std-trmm-3b43v7-precip" suffix = "v7-f-A">
			</std-trmm-3b43v7-precip>

			<ols-rmse-trmm-fao-vwb id = 'layer4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb" prefix = "ols-rmse-trmm-fao-vwb" suffix = "v7-f-m-A">
			</ols-rmse-trmm-fao-vwb>
			<ols-rmse-trmm-fao-vwb-surplus id = 'layer5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb-surplus" prefix = "ols-rmse-trmm-fao-vwb-surplus" suffix = "v7-f-m-A">
			</ols-rmse-trmm-fao-vwb-surplus>
			<ols-rmse-trmm-fao-vwb-deficit id = 'layer6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb-deficit" prefix = "ols-rmse-trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</ols-rmse-trmm-fao-vwb-deficit>

		</srccomp>
	</process>

	<!-- VWB change -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-change id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-change" prefix = "trmm-fao-vwb-change" suffix = "model-v7-f-m-A">
			</trmm-fao-vwb-change>

			<trmm-fao-vwb-delta id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-delta" prefix = "trmm-fao-vwb-delta" suffix = "slope@p-v7-f-m-A">
			</trmm-fao-vwb-delta>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-change id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-change" prefix = "trmm-fao-vwb-change" suffix = "model@p-v7-f-m-A">
			</trmm-fao-vwb-change>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-surplus-change id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-change" prefix = "trmm-fao-vwb-surplus-change" suffix = "model-v7-f-m-A">
			</trmm-fao-vwb-surplus-change>

			<trmm-fao-vwb-surplus-delta id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-delta" prefix = "trmm-fao-vwb-surplus-delta" suffix = "slope@p-v7-f-m-A">
			</trmm-fao-vwb-surplus-delta>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-surplus-change id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-change" prefix = "trmm-fao-vwb-surplus-change" suffix = "model@p-v7-f-m-A">
			</trmm-fao-vwb-surplus-change>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-deficit-change id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-change" prefix = "trmm-fao-vwb-deficit-change" suffix = "model-v7-f-m-A">
			</trmm-fao-vwb-deficit-change>

			<trmm-fao-vwb-deficit-delta id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-delta" prefix = "trmm-fao-vwb-deficit-delta" suffix = "slope@p-v7-f-m-A">
			</trmm-fao-vwb-deficit-delta>
		</srccomp>
	</process>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-deficit-change id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-change" prefix = "trmm-fao-vwb-deficit-change" suffix = "model@p-v7-f-m-A">
			</trmm-fao-vwb-deficit-change>
		</srccomp>
	</process>

</export>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 5.5 VWB055_movieframes_M_v80.xml

Process: [<span class='package'>movieframeancillary</span>](../../subprocess/subproc-movieframeancillary/).

 For the process [<span class='package'>movieframeancillary</span>](../../subprocess/subproc-movieframeancillary/) to work you must have installed <span class='terminalapp'>imagemagick</span> as explained in [another blogpost](https://karttur.github.io/setup-theme-blog/blog/install-imagemagick/).

 To run the process fully automated you must set the parameter _asscript_ to _False_, otherwise you must manually execute the shell script file reported when the process comes to an end. By default the process will create a script file so you must explicitly enter asscript=\"False\" if you want the process to generate the frames on the fly.

Note that because the three versions of VWB (the total VWB, suplus VWB and deficit VWB) were organized to be stored in the same directory (or folder) path, you can only create one animation at the time. If you want to create animations of all three versions you must delete the "movieframe" folder between each creation.

<button id= "togglemovieframe" onclick="hiddencode('movieframe')">Hide/Show VWB055_movieframes_M_v80.xml</button>

<div id="movieframe" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<movieframe>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<!-- Create movie frame -->
	<process processid = 'movieframeancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters name = 'vwb' width = '800' crop='800,222,0,0' emboss='KARTTUR' embossdims='720,150' embossptsize='100' asscript='True'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<srccomp>
			<trmm-fao-vwb id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m">
			</trmm-fao-vwb>
		</srccomp>
	</process>

	<!-- Create movie frame surplus
		If you want to create an animation from the VWB surplus timeseries
		you must first make sure that the dstpath "movieframes" is empty,
		i.e. you must first finish the movie for trmm-fao-vwb (above) and
		delete all intermediate files (and only keep the final movie).
		Otherwise the movie will include both trmm-fao-vwb and trmm-fao-vwb-surplus.
		To create a movie form the surplus data, change processx to process below and
		set process to processx for the process above.
	-->
	<processx processid = 'movieframeancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'vwb' width = '800' crop='800,222,0,0' emboss='KARTTUR' embossdims='720,150' embossptsize='100' asscript='True'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<srccomp>
			<trmm-fao-vwb-surplus id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m">
			</trmm-fao-vwb-surplus>
		</srccomp>
	</processx>

	<!-- Create movie frame deficit
		If you want to create an animation from the VWB defiit timeseries
		you must first make sure that the dstpath "movieframes" is empty,
		see above.
	-->
	<processx processid = 'movieframeancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'vwb' width = '800' crop='800,222,0,0' emboss='KARTTUR' embossdims='720,150' embossptsize='100' asscript='True'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<srccomp>
			<trmm-fao-vwb-deficit id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m">
			</trmm-fao-vwb-deficit>
		</srccomp>
	</processx>
</movieframe>

```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### 5.6 VWB056_movieclock_M_v80.xml

Process: [<span class='package'>movieclockancillary</span>](../../subprocess/subproc-movieclockancillary/).

The process [<span class='package'>movieclockancillary</span>](../../subprocess/subproc-movieclockancillary/) first creates the movieclocks to combine with the movie frames from the previous step, and then creates the movie/animation itself. To run the process fully automated you must set the parameter _asscript_ to _False_, otherwise you must manually execute the shell script files reported when the process comes to an end. By default the process will create script files so you must explicitly enter asscript=\"False\" if you want the process to generate the complete animation on the fly.

For the process [<span class='package'movieclockancillary</span>](../../subprocess/subproc-movieclockancillary/) to work you must have installed <span class='terminalapp'>FFmpeg</span> as explained in [another blogpost](https://karttur.github.io/setup-theme-blog/blog/ffmpeg-movie/).

<button id= "togglemovieclock" onclick="hiddencode('movieclock')">Hide/Show VWB055_movieclock_M_v80.xml</button>

<div id="movieclock" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<movieclock>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<!-- Create movie clock -->
	<process processid = 'movieclockancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'trmm' width = '800' asscript='True'></parameters>

		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<dstcomp>
			<trmm-fao-vwb id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m">
			</trmm-fao-vwb>
		</dstcomp>
	</process>

	<!-- Create movie clock surplus
		If you want to create an animation from the VWB surplus timeseries
		you must first make sure that the dstpath "movieframes" is empty,
		i.e. you must first finish the movie for trmm-fao-vwb (above) and
		delete all intermediate files (and only keep the final movie).
		Otherwise the movie will include both trmm-fao-vwb and trmm-fao-vwb-surplus.
		To create a movie form the surplus data, change processx to process below and
		set process to processx for the process above.
	-->
	<processx processid = 'movieclockancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'trmm' width = '800' asscript='True'></parameters>

		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<dstcomp>
			<trmm-fao-vwb-surplus id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m">
			</trmm-fao-vwb-surplus>
		</dstcomp>
	</processx>

	<!-- Create movie clock deficit
		If you want to create an animation from the VWB defiit timeseries
		you must first make sure that the dstpath "movieframes" is empty,
		see above.
	-->
	<processx processid = 'movieclockancillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'trmm' width = '800' asscript='True'></parameters>

		<dstpath volume = "karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<dstcomp>
			<trmm-fao-vwb-deficit id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m">
			</trmm-fao-vwb-deficit>
		</dstcomp>
	</processx>

</movieclock>

```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>
