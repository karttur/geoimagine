---
layout: post
title: Vertical Water Balance
modified: '2018-11-23 20:17'
categories: blog
excerpt: Calculating Vertical Water Balance from TRMM rainfall FAO reference evapotranspiration
tags:
  - TRMM
  - Tropical Rainfall Measurement Mission
  - Vertical Water Balance
  - FAO refET
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-23 22:03'
comments: true
share: true
---

# Introduction

The Vertical Water Balance (VWB) is the difference between precipitation and evapotranspiration. Regions with precipitation exceeding evapotranspiration are called humid, and areas where evapotranspiration exceed precipitation arid. Many regions have wet and dry seasons, with humid conditions during the wet season and arid during the dry.

Herein, VWB is calculated as the monthly precipitation minus the monthly evapotranspiration. In this post I use the [Tropical Rainfall Measurement Mission (TRMM)](../blog-TRMM/) dataset together with the [FAO reference evapotranspiration (refET)](../blog-FAO-refevap/) to calculate VWB.


# Fit the TRMM and refET datasets

Accessing and organizing the [TRMM](../blog-TRMM/) and [refET](../blog-FAO-refevap/) datasets are covered in two previous posts. The refET data have a global coverage and a spatial resolution of 10 arc minutes, whereas the TRMM rainfall data have coarser spatial resolution (15 arc minutes) and covers a smaller region (between 50 degrees latitude). The TRMM data cover both land and water but the refET only covers land areas. The rainfall data represents monthly measured rainfall, the refET dataset is a statistical dataset representing monthly mean conditions for the period 1961 to 1990.

To overlay the rainfall and the refET you need to resample the refET to fit the rainfall data. Then you need to mask out land and water. You also need to combine a statistical dataset with a resolved time series. All this can be done using Karttur´s GeoImagine Framework.

## Transform the refET

The global refET dataset with monthly average evapotranspiration needs to be fitted to the TRMM dataset. In Kartttur's GeoImagine Framework the process for doing that is <span class='package'>gdal_translateancillary</span>, that is just an interface to the GDAL utility <span class='terminalapp'>gdal_translate</span>. In the xml file below, the parameters define the translation by setting a pre-defined default region ('trmm') and the columns ('xsize') and rows ('ysize') spanning the default region:

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='staticmonthly'></period>
	<process processid ='gdal_translateancillary' version = '3.0'>
		<parameters dst_region = 'trmm' xsize = '1440' ysize ='400' resampling ='average'></parameters>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<fao-refet source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M">
			</fao-refet>
		</srccomp>
		<dstcomp>
			<fao-refet source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M" scalefac = "1" offsetadd = "0" dataunit = "mm" celltype = 'Int16' cellnull = '-32768' measure = 'R'>
			</fao-refet>
		</dstcomp>
	</process>
</organize>
```

## Create a landmask

The FAO refET data only covers land areas. To create a mask, use the transformed version of the refET that fits the TRMM region for defining a mask. You could use any of the months in the refET dataset for defining the mask bu to make sure you mask out all regions you can also use all 12 months of refET to define the mask (just to make sure in case there are errors in the FAO refET nodata mask). The process <span class='package'></span> will do it for you:

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='staticmonthly'></period>
	<process processid = 'createstaticmaskancillary' version = '1.3'>
		<parameters nullmask = 'True' maskvals ='0' ></parameters>
		<srcpath volume='OPUS'></srcpath>
		<dstpath volume='OPUS'></dstpath>
		<srccomp>
			<fao-refet source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M" scalefac = "1" offsetadd = "0" dataunit = "mm" celltype = 'Int16' cellnull = '-32768' measure = 'R'>
			</fao-refet>
		</srccomp>
		<dstcomp>
			<landmask-trmm source = "TRMM" product = "landmask" folder = "mask" band = "landmask-trmm" prefix = "landmask-trmm" suffix = "FAOET" cellnull='0'>
			</landmask-trmm>
		</dstcomp>
	</process>
</runprocess>
```

Note that the tractid is set to 'karttur-trmm', which is the region owned by the user karttur that is based on the default region trmm. When operating on the spatial data, the karttur region 'karttur-trmm' will use the default region ('trmm') for all naming. This is, of course, to prevent any user to operate on any default region. A user can only operate on its own regions.

### Apply mask

The mask you just created from the refET data must be applied to the complete time series of TRMM rainfall data. This is done with the process <span class='package'>applystaticmaskancillary</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = '1998' startmonth = '01' startday = '01' endyear = '2018' endmonth = '08' endday = '01'  timestep='M'></period>
	<process processid = 'applystaticmaskancillary' version = '1.3'>
		<parameters ></parameters>
		<srcpath volume='OPUS'></srcpath>
		<dstpath volume='OPUS'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  id='layer' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f" timestep='M'>
			</trmm-3b43v7-precip>
		</srccomp>
		<srccomp>
			<landmask-trmm id='mask' source = "TRMM" product = "landmask" folder = "mask" band = "landmask-trmm" prefix = "landmask-trmm" suffix = "FAOET" cellnull='0'  timestep='static'>
			</landmask-trmm>
		</srccomp>
		<dstcomp>
			<trmm-3b43v7-precip  id='layer' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</dstcomp>
	</process>
</runprocess>
```

## Calculate Vertical Water Balance

You should now have two time series covering the same spatial region, with the same spatial resolution and the same area of valid data: the dynamic TRMM precipitation dataset and the statistical FAO refET dataset. You can now calculate the Vertical Water Balanace (VWB). As the refET dataset is a statistical seasonal dataset, the calculation of VWB equals removing the seasonal signal from the precipitation time series. As this is water balance data, it can be done in three ways: 1) as the complete difference, 2) only retaining rainfall surplus, or 3) only retaining rainfall deficit. In Karttur's GeoImagine Framework you can do all three options using the process <span class='package'>subtractseasonsancillary</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = '1998' startmonth = '01' startday = '01' endyear = '2018' endmonth = '08' endday = '01'  timestep='M'></period>
	<process processid = 'subtractseasonsancillary' version = '1.3'>
		<parameters balance='diff'></parameters>
		<srcpath volume='OPUS'></srcpath>
		<dstpath volume='OPUS'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  id='layer' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m" timestep='M'>
			</trmm-3b43v7-precip>
		</srccomp>
		<srccomp>
			<fao-refet id = 'season' source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M" timestep='seasonal-M'>
			</fao-refet>
		</srccomp>
		<dstcomp>
			<trmm-fao-vwb source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m">
			</trmm-fao-vwb>
		</dstcomp>
	</process>
	<process processid = 'subtractseasonsancillary' version = '1.3'>
		<parameters balance='surplus'></parameters>
		<srcpath volume='OPUS'></srcpath>
		<dstpath volume='OPUS'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  id='layer' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m" timestep='M'>
			</trmm-3b43v7-precip>
		</srccomp>
		<srccomp>
			<fao-refet id = 'season' source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M" timestep='seasonal-M'>
			</fao-refet>
		</srccomp>
		<dstcomp>
			<trmm-fao-vwb-surplus source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m">
			</trmm-fao-vwb-surplus>
		</dstcomp>
	</process>
	<process processid = 'subtractseasonsancillary' version = '1.3'>
		<parameters balance='deficit'></parameters>
		<srcpath volume='OPUS'></srcpath>
		<dstpath volume='OPUS'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  id='layer' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m" timestep='M'>
			</trmm-3b43v7-precip>
		</srccomp>
		<srccomp>
			<fao-refet id = 'season' source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "M" timestep='seasonal-M'>
			</fao-refet>
		</srccomp>
		<dstcomp>
			<trmm-fao-vwb-deficit source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m">
			</trmm-fao-vwb-deficit>
		</dstcomp>
	</process>
</manageprocess>
```

# Resample to annual timestep

To simplify the statistical evaluation and trend analysis, you can translate the data to annual time steps with the process <span class='package'>resampletsancillary</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>
	<process processid = 'resampletsancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters method = 'sum' targettimestep = 'A' ></parameters>
		<srcpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-3b43v7-precip  source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m" >
			</trmm-3b43v7-precip>
		</srccomp>
		<dstcomp>
			<trmm-3b43v7-precip band = "trmm-3b43v7-precip" suffix = "auto" dataunit = 'mm/yr'>
			</trmm-3b43v7-precip>
		</dstcomp>
	</process>
</runprocess>
```

# Trend analysis

There are indications that climate change is causing a drying in dry regions/seasons and wetting in wet regions/seasons. To test that you can analyse the overall trends in VWB and compare it with the trends in humid and arid regions. Details about linear trend analysis in Karttur's GeoImagine Framework is given in the [post on SMAP processing](../blog-SMAP/), here is just the xml file for analysing the trends in VWB:

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='A'></period>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'trendtsancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
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
		<overwrite>True</overwrite>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
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
		<overwrite>True</overwrite>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<trmm-fao-vwb-deficit source = "trmm-vwb" product = "3b43" folder = "vwb-A" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m-A">
			</trmm-fao-vwb-deficit>
		</srccomp>
		<stats id = 'avg' band = "avg"></stats>
		<stats id= 'std' band = "std"></stats>
		<stats id= 'mk' band = "mk"></stats>
		<stats id= 'ols' band = "ols"></stats>
	</process>

</runprocess>
```
# Layout

If you want to create color maps/images and animations for presenting the VWB data you must create the required layout.

## Add palette

The VWB palettes below, created with the process <span class='package'>addrasterpalette</span>, are Karttur's default VWB palettes.

```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- addrasterpalette VWBtotal-->
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

## Set scaling

Layout exports require scaling the original data to byte (0 - 255) range. Details on the scaling is given in the post on [SPAM processing](../blog-SPAM/). The xml below defines the scaling of both the monthly and annual VWB layers, and all the layers produced as part of the trend analysis.

```
<?xml version='1.0' encoding='utf-8'?>
<scaling>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.75' scalefac='1.0' mirror0='True'></parameters>		
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m"></comp>
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.85' scalefac='0.1' mirror0='True'></parameters>		
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

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.85' scalefac='0.2'></parameters>		
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb" prefix = "avg-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb-surplus" prefix = "avg-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-stats" band = "std-trmm-fao-vwb-deficit" prefix = "avg-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
		<comp id = '4' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb" prefix = "avg-trmm-fao-vwb" suffix = "v7-f-m"></comp>    	
		<comp id = '5' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb-surplus" prefix = "avg-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>    	
		<comp id = '6' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-rmse-trmm-fao-vwb-deficit" prefix = "avg-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='40' offsetadd='125' ></parameters>			
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb" prefix = "mk-z-trmm-fao-vwb" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb-surplus" prefix = "mk-z-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "mk-z-trmm-fao-vwb-deficit" prefix = "mk-z-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='100'></parameters>			
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-r2-trmm-fao-vwb" prefix = "ols-r2-trmm-fao-vwb" suffix = "v7-f-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-r2-trmm-fao-vwb-surplus" prefix = "ols-r2-trmm-fao-vwb-surplus" suffix = "v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-trend" band = "ols-r2-trmm-fao-vwb-deficit" prefix = "ols-r2-trmm-fao-vwb-deficit" suffix = "v7-f-m-A"></comp>
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0='True' power='0.9' scalefac='2'></parameters>

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

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters power = '0.87' scalefac='1' mirror0='True'></parameters>
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-change" prefix = "trmm-fao-vwb-change" suffix = "model-v7-f-m-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-change" prefix = "trmm-fao-vwb-surplus-change" suffix = "model-v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-change" prefix = "trmm-fao-vwb-deficit-change" suffix = "model-v7-f-m-A"></comp>
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='1' mirror0='True'></parameters>
		<comp id = '1' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-delta" prefix = "trmm-fao-vwb-delta" suffix = "slope@p-v7-f-m-A"></comp>
		<comp id = '2' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-surplus-delta" prefix = "trmm-fao-vwb-surplus-delta" suffix = "slope@p-v7-f-m-A"></comp>
		<comp id = '3' source = "trmm-vwb" product = "3b43" folder = "vwb-A-change" band = "trmm-fao-vwb-deficit-delta" prefix = "trmm-fao-vwb-deficit-delta" suffix = "slope@p-v7-f-m-A"></comp>
	</process>
</scaling>
```

## Add movieclock

You do not need to add a movieclock layout, the default movieclock works fine. But if you want to create a customised movieclock, the process is <span class='package'></span>. The only parameter that is required is the name of the movieclock, all other parameters are set to default unless explicitly given as parameters.

```
<?xml version='1.0' encoding='utf-8'?>
<movieclock>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<path></path>

	<process processid = 'addmovieclock'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters name = 'vwb'>
		</parameters>
	</process>
</movieclock>
```

# Export images and animation

You can now export any of the VWB layers created above.

## Export monthly images

The full series of monthly VWB images is needed if you want to create an animation:
The following xml exports the monthly VWB, the overall VWB, the humid VWB and the arid VWB.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'vwb'></parameters>		
		<srcpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>    	
		<srccomp>
			<trmm-fao-vwb id = 'layer1' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb" prefix = "trmm-fao-vwb" suffix = "v7-f-m">
			</trmm-fao-vwb>
			<trmm-fao-vwb-surplus id = 'layer2' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-surplus" prefix = "trmm-fao-vwb-surplus" suffix = "v7-f-m">
			</trmm-fao-vwb-surplus>
			<trmm-fao-vwb-deficit id = 'layer3' source = "trmm-vwb" product = "3b43" folder = "vwb" band = "trmm-fao-vwb-deficit" prefix = "trmm-fao-vwb-deficit" suffix = "v7-f-m">
			</trmm-fao-vwb-deficit>
		</srccomp>
	</process>
</runprocess>
```

#
