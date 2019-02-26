---
layout: post
title: "Regional synthesis: 2 Extract regional precipitation"
modified: '2018-12-19 20:17'
categories: blog
excerpt: Tile and mosaic global precipitation to user defined region
tags:
  - Precipitation
  - tile
  - mosaic
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-12-19 22:03'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post is the second hands-on post in the series of posts on \"Regional synthesis\" using Karttur's GeoImagine Framework. In this post you are going to import precipitation data to the region you defined in the [first step](../blog-RegionalizeOka-1/). The example uses the Okavango Inland Delta in Botswana as the region, but you can use any other region as described in the [previous](../blog-RegionalizeOka-1/) post.

# Prerequisites

To follow this post you must have setup a project and a region as defined in the [first step](../blog-RegionalizeOka-1/).

# Karttur regions and systems

As discussed in the [previous](../blog-RegionalizeOka-1/) post all the processes included in Karttur´s GeoImagine Framework must be associated with a _user_, a _project_, a _region_ and a _system_. Running the Framework from xml files, these are defined in the \<userproj\> child tag:

```
userproj userid = 'karttur' projectid = 'karttur-okadelta' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
```

In the [previous](../blog-RegionalizeOka-1/) post you created your own project using your own tract. The example I used was a project and region (_tract_) for the Okavango Inland Delta in Botswana, and I called both the project and the tract _karttur-okadelta_.

In this post you are going to import precipitation data to the project. To do that you need to define the system you want to import the data to. At time of writing, Karttur's GeoImagine Framework can use two different tiling systems for processing regional data: MODIS SIN grid or Sentinel MGRS.

Strictly speaking the SIN grid and MGRS are projection systems, but also including predefined tiles. Both systems can be used by the Framework, but they have different advantages and dis-advantages. In general the SIN grid system tiles are larger and thus better for processing medium to coarse scale data. The MODIS SIN grid system is also preferred for all  processing that requires equal areas (e.g. for hydrological modelling or other mass balance calculations). It is in general more parsimonious compared to MGRS. The MGRS system, however, is more fine grained, and if you are going to work with high spatial resolution data, in particular Sentinel or Landsat satellite data or finer satellite imagery, then the MGRS system is preferred. This example uses the MODIS SIN grid (MODIS) system.

# The MODIS tiling system

The MODIS tiling system is included as part of the [installation process](#) when you first set up Karttur's GeoImagine Framework. You should thus have the MODIS tiling system defined in the Framework database. When setting _system_ = \"_modis_\" in the \<userproj\> tag, all the processing will be on SIN tile basis. It is thus possible to process the full global coverage of any data at any spatial resolution (at least down to 100 m or so) using the MODIS system. The Framework will simply process one SIN tile at the time. All you have to do is to give the global region.

In our example we are going to process the region you defined in the previous post. But we do not have any data associated with this region yet. In this post you are going to tile the precipitation data that you created, or imported, using other posts in this blog.

## Global precipitation data

The post on [TRMM precipitation data](../blog-TRMM/) is a tutorial on how to access, import and process tropical rainfall data. If you need precipitation data at higher latitudes, you should instead follow the post on [IMERG precipitation data](../blog-IMERG/). The post on [Transfer TRMM Framework data](../blog-TRMM-transfer) goes through how to import Framework pre-processed data.

## Tile and mosaic precipitation to region

As emphasised above, project regions are in essence equal to an assembly of tiles. If the _system_ is set to _modis_, the region is composed of the MODIS SIN tiles that fully or partly fall within the region. Importing ancillary data to a region is thus equal to tiling the ancillary data to the tiles that compose the region. The Framework process for that is [<span class='package'>tileRegionToModisAncillary</span>](../../subprocess/subproc-tileRegionToModisAncillary/).

Most of the regional processing will operate on the tiles, but when analyzing the results or exporting images or animations, the region is mosaicked from the tiles and then cut to fit the actual regional extent. The Framework process for mosaicking tiles and cutting out the region is [<span class='package'>MosaicModis</span>](../../subprocess/subproc-MosaicModis/). Exporting images from modis regional data is done with the process [<span class='package'>exporttobytemodisRegionToRegion</span>](../../subprocess/subproc-exporttobytemodisRegionToRegions/), and movieframes and movieclocks are created with the processes [<span class='package'>movieframeModisRegionToRegion</span>](../../subprocess/subproc-movieframeModisRegionToRegion/) and [<span class='package'>movieclock</span>](../../subprocess/subproc-movieclock/).

### Tile monthly precipitation

Process: [<span class='package'>tileRegionToModisAncillary</span>](../../subprocess/subproc-tileRegionToModisAncillary/).

<button id= "toggleTileTRMM-M" onclick="hiddencode('TileTRMM-M')">Hide/Show okadelta0210_tile_trmm2modis_M_v80.xml</button>

<div id="TileTRMM-M" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<!-- tile the original (monthly) TRMM data to the region (karttur-okadelta).
		The TRMM data must be downloaded and organized
		If you set the parameter "asscript" to True (= default),
		you have to execute the shell script file as reported by the process,
		and then rerun the xml with overwrite set to False to add the layers to the database
	-->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '463.313'  yres = '463.313' resample='near' asscript='False'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html toggle-text=text-capture  %}
</div>

### Tile statistical precipitation dataset

Process: [<span class='package'>tileRegionToModisAncillary</span>](../../subprocess/subproc-tileRegionToModisAncillary/).

<button id= "toggleTileTRMM-A" onclick="hiddencode('TileTRMM-A')">Hide/Show okadelta0220_tile_trmm2modis_timespanA_v80.xml</button>

<div id="TileTRMM-A" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- Tile statistical TRMM data to the region (karttur-okadelta)
	The TRMM data must be processed
	If you set the parameter "asscript" to True (= default),
	you have to execute the shell script file as reorted by the processor,
	and then rerun the xml with overwrite set to False to add the layers to the database
	-->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '463.313'  yres = '463.313' resample='near' asscript='N'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<avg-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "avg-trmm-3b43v7-precip" prefix = "avg-trmm-3b43v7-precip" suffix = "v7-f-A">
			</avg-trmm-3b43v7-precip>
			<ols-ic-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-ic-trmm-3b43v7-precip" prefix = "ols-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-ic-trmm-3b43v7-precip>
			<ts-ic-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-ic-trmm-3b43v7-precip" prefix = "ts-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-ic-trmm-3b43v7-precip>
			<ols-sl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-sl-trmm-3b43v7-precip" prefix = "ols-sl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-sl-trmm-3b43v7-precip>
			<ts-mdsl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-mdsl-trmm-3b43v7-precip" prefix = "ts-mdsl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-mdsl-trmm-3b43v7-precip>
			<ts-losl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-losl-trmm-3b43v7-precip" prefix = "ts-losl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-losl-trmm-3b43v7-precip>
			<ts-hisl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-hisl-trmm-3b43v7-precip" prefix = "ts-hisl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-hisl-trmm-3b43v7-precip>
			<std-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "std-trmm-3b43v7-precip" prefix = "std-trmm-3b43v7-precip" suffix = "v7-f-A">
			</std-trmm-3b43v7-precip>
			<ols-rmse-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-rmse-trmm-3b43v7-precip" prefix = "ols-rmse-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-rmse-trmm-3b43v7-precip>
			<mk-z-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "mk-z-trmm-3b43v7-precip" prefix = "mk-z-trmm-3b43v7-precip" suffix = "v7-f-A">
			</mk-z-trmm-3b43v7-precip>
			<ols-r2-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-r2-trmm-3b43v7-precip" prefix = "ols-r2-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-r2-trmm-3b43v7-precip>
			<trmm-3b43v7-precip-change source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model-v7-f-A">
			</trmm-3b43v7-precip-change>
			<trmm-3b43v7-precip-delta source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-delta" prefix = "trmm-3b43v7-precip-delta" suffix = "slope@p-v7-f-A">
			</trmm-3b43v7-precip-delta>
		</srccomp>
	</process>

	<!-- This second process is required due to duplicate compids-->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '463.313'  yres = '463.313' resample='near' asscript='False'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip-change source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model@p-v7-f-A">
			</trmm-3b43v7-precip-change>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Mosaic monthly precipitation dataset

Process: [<span class='package'>MosaicModis</span>](../../subprocess/subproc-MosaicModis/).

<button id= "toggleMosaicTRMM-M" onclick="hiddencode('MosaicTRMM-M')">Hide/Show okadelta0230_mosaic_trmm_M_v80.xml</button>

<div id="MosaicTRMM-M" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth='7' endday='31' timestep='M'></period>

	<!-- Mosaic modis TRMM monthly tiles to region (karttur-okadelta) -->
	<process processid = 'MosaicModis' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters t_epsg ='4326'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "trmm-3b43v7-precip" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Mosaic statistical precipitation dataset

Process: [<span class='package'>MosaicModis</span>](../../subprocess/subproc-MosaicModis/).

<button id= "toggleMosaicTRMM-A" onclick="hiddencode('MosaicTRMM-A')">Hide/Show okadelta0240_mosaic_trmm_timespanA_v80.xml</button>

<div id="MosaicTRMM-A" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- mosaic modis TRMM statistical tiles to region (karttur-okadelta) -->
	<process processid = 'MosaicModis' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters t_epsg ='4326'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<avg-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "avg-trmm-3b43v7-precip" prefix = "avg-trmm-3b43v7-precip" suffix = "v7-f-A">
			</avg-trmm-3b43v7-precip>
			<ols-ic-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-ic-trmm-3b43v7-precip" prefix = "ols-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-ic-trmm-3b43v7-precip>
			<ts-ic-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-ic-trmm-3b43v7-precip" prefix = "ts-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-ic-trmm-3b43v7-precip>
			<ols-sl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-sl-trmm-3b43v7-precip" prefix = "ols-sl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-sl-trmm-3b43v7-precip>
			<ts-mdsl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-mdsl-trmm-3b43v7-precip" prefix = "ts-mdsl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-mdsl-trmm-3b43v7-precip>
			<ts-losl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-losl-trmm-3b43v7-precip" prefix = "ts-losl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-losl-trmm-3b43v7-precip>
			<ts-hisl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-hisl-trmm-3b43v7-precip" prefix = "ts-hisl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-hisl-trmm-3b43v7-precip>
			<std-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "std-trmm-3b43v7-precip" prefix = "std-trmm-3b43v7-precip" suffix = "v7-f-A">
			</std-trmm-3b43v7-precip>
			<ols-rmse-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-rmse-trmm-3b43v7-precip" prefix = "ols-rmse-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-rmse-trmm-3b43v7-precip>
			<mk-z-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "mk-z-trmm-3b43v7-precip" prefix = "mk-z-trmm-3b43v7-precip" suffix = "v7-f-A">
			</mk-z-trmm-3b43v7-precip>
			<ols-r2-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-r2-trmm-3b43v7-precip" prefix = "ols-r2-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-r2-trmm-3b43v7-precip>
			<trmm-3b43v7-precip-change source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model-v7-f-A">
			</trmm-3b43v7-precip-change>
			<trmm-3b43v7-precip-delta source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-delta" prefix = "trmm-3b43v7-precip-delta" suffix = "slope@p-v7-f-A">
			</trmm-3b43v7-precip-delta>
		</srccomp>
	</process>

	<process processid = 'MosaicModis' version = '1.3'>
		<parameters t_epsg ='4326'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip-change source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model@p-v7-f-A">
			</trmm-3b43v7-precip-change>
		</srccomp>
	</process>

</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Export monthly precipitation dataset

Process: [<span class='package'>exporttobytemodisRegionToRegion</span>](../../subprocess/subproc-exporttobytemodisRegionToRegion/).

<button id= "toggleExportTRMM-M" onclick="hiddencode('ExportTRMM-M')">Hide/Show okadelta0250_exporttoByte_trmm_M_v80.xml</button>

<div id="ExportTRMM-M" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<!-- Export monhtly TRMM precipitaiton to paletted byte images
		Palettes, scalings and legends must be defined-->
	<process processid = 'exporttobytemodisRegionToRegion' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'precipln'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip id = 'layer1' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Monthly precipitation movie frames

Process: [<span class='package'>movieframeModisRegionToRegion</span>](../../subprocess/subproc-movieframeModisRegionToRegion/).

<button id= "togglemovieframe" onclick="hiddencode('movieframe')">Hide/Show okadelta0255_movieframes_trmm_M_v80.xml</button>

<div id="movieframe" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<!-- Generate movie frames from the exported and paletted byte images -->
	<process processid = 'movieframeModisRegionToRegion' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters name = 'smap' width = '601' crop='600,526,0,0' emboss='KARTTUR' embossdims='600,150' embossptsize='80'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "/Volumes/karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip id = 'movieframe' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Monthly precipitation movie clock

Process: [<span class='package'>movieclock</span>](../../subprocess/subproc-movieclock/).

<button id= "togglemovieclock" onclick="hiddencode('movieclock')">Hide/Show okadelta0256_movieclock_trmm_M_v80.xml</button>

<div id="movieclock" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-okadelta' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998"  endyear = "2018" endmonth='07' endday='31' timestep='M'></period>

	<!-- Generate movieclock and the scritps to create the complete animation -->
	<process processid = 'movieclock' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters name = 'trmm' width = '600'></parameters>
		<dstpath volume = "/Volumes/karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<dstcomp>
			<trmm-3b43v7-precip id = 'layer3' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f">
			</trmm-3b43v7-precip>
		</dstcomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>
