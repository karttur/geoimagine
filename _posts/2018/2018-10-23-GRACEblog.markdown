---
layout: post
title: Processing of GRACE data
modified: '2018-10-23 T18:17:25.000Z'
categories: blog
excerpt: "Processing GRACE data using Karttur's GeoImagine Framework"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-23 T18:17:25.000Z'
comments: true
share: true
figure1: avg-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2A: ols-sl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2B: ts-mdsl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2C: ts-losl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2D: ts-hisl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
---

# Introduction

This post goes through the steps needed to produce colored maps of the trends in global water storage using data from the [GRACE (Gravity Recovery and Climate Experiment)](https://grace.jpl.nasa.gov) mission. To actually repeat the steps you must have installed Karttur´s GeoImagine Framework.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

# GRACE

The Gravity Recovery and Climate Experiment (GRACE) was built around two identical satellites orbiting the Earth. Traveling with a fixed distance in between them the gravitational pull caused minute changes in the vertical elevations between the two satellites. This change can be used for estimating the gravitational pull. Short term (days to months) changes in the gravitation is primarily related to the Earth's water reservoirs over land, ice and oceans, and earthquakes and crustal deformations.

I use GRACE TELLUS [Level-3 data grids of monthly surface mass changes](https://grace.jpl.nasa.gov/data/monthly-mass-grids/) to detect trends in water storage on land. The GRACE data that I use represent the changes in equivalent water thickness relative to a time-mean baseline. There are three different solutions for the calculations of equivalent water thickness, respectively produced by CSR (Center for Space Research at University of Texas, Austin), GFZ (GeoforschungsZentrum Potsdam) and JPL (Jet Propulsion Laboratory). You can use any of these solutions, but the official recommendation is that [users obtain all three data center's solutions (JPL, CSR, GFZ) and simply average them](https://grace.jpl.nasa.gov/data/choosing-a-solution/).

This blog summarises how the processing is done using Karttur´s GeoImagine Framework.

## Python Package

The GeoImagine Framework includes a package for specific GRACE processing: [geoimagine.grace](#). However, also several other packages in the Framework are needed for repeating the steps below.

## Data access and download

THe GRACE data is freely available from [GRACE TELLUS](https://grace.jpl.nasa.gov/data/get-data/). The data is available as ftp, and as the dataset is small and the experiment finished, I download the data using an FTP client ([Filezilla](https://filezilla-project.org)).

The data is available as NetCDF files, as GeoTIFF images and as ASCII text files. Karttur's GeoImagine Framework can import any of these formats, but the specific GRACE importer that solves the projection of the GRACE data on the fly use the ASCII data as input. When downloading the data, just keep the same folder structure as the online resource.

## Organizing the dataset

The GRACE dataset available online is not projected in the usual manner, but starts at the Greenwich Meridian and then extends eastwards. It wraps the dateline and the last column again ends at the Greenwich Meridian. To solve the projection on the fly when organizing GRACE data, use the process <span class='package'>OrganizeGrace</span> (only works on the ASCII data). This process is a subclass to <span class='package'>OrganizeAncillary</span>, and uses the same xml structure:

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='allscenes'></period>
	<process processid ='OrganizeGrace' dsversion = '3.0'>
		<parameters
			solutionset = 'JPL'
			dsversion = "RL05"
			accessdate = "20181018"
			dataurl = "https://grace.jpl.nasa.gov/data/get-data/"
			metaurl="https://grace.jpl.nasa.gov/data/get-data/"
			title = "GRACE global data"
			label = "GRACE (Gravity Recovery and Climate Experiment) global data"

		> </parameters>   	 
		<srcpath volume = "Karttur3tb/ANCILIMPORT" hdrfiletype = "gz" datfiletype = "txt"></srcpath>
		<dstpath volume = "Karttur3tb" hdrfiletype = "tif" datfiletype = "tif"></dstpath>
		<srcraw id="grace-jpl"
			datadir ='GRACE/ascii'
			theme = "hydrology"
			subtheme = "gravitywater"
			title = "GRACE global data"
			label = "GRACE (Gravity Recovery and Climate Experiment) global data"
		></srcraw>
		<dstcomp>
			<grace-jpl source = "NASA-GRACE" product = "jpl-cmwater" folder = "cmwater" band = "grace-jpl" prefix = "grace-jpl" suffix = "RL05" scalefac = "1" offsetadd = "0" dataunit = "cm" celltype = 'Float32' cellnull = '32767' measure ='R' masked='Y'>
			</grace-jpl>
		</dstcomp>
	</process>
```

The process <span class='package'>OrganizeAncillary</span> translates the raw GRACE data to organized and projected GeoTIFF layers.

If you want to use all the solutions for equivalent water thickness (CST, GFZ and JPL) you have to define three import processes (can be done in the same xml file).

## Filling missing data

The GRACE monthly dataset of equivalent water thickness has some gaps. The process <span class='package'>mendancillarytimeseries</span> fills the gaps. The default method for filling data is linear interpolation.

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "2002" startmonth='04' endyear = "2017" endmonth='01' timestep='MS'></period>

	<!-- mendanciltimeseries (TimeSeries) -->
	<process processid ='mendancillarytimeseries'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters></parameters>

		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<grace-jpl source = "NASA-GRACE" product = "jpl-cmwater" folder = "cmwater" band = "grace-jpl" prefix = "grace-jpl" suffix = "RL05">
			</grace-jpl>
		</srccomp>

		<dstcomp>
			<grace-jpl band = "grace-jpl" prefix = "grace-jpl" suffix = "RL05-filled">
			</grace-jpl>
		</dstcomp>
	</process>
</manageprocess>
```

## Average solutions

As note above, the recommendation is to use the average of the three solutions for the monthly equivalent water depth (CSR, GFZ and JPL). The process <span class='package'>average3ancillarytimeseries</span> will do this for you.

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '\*' plotid = '\*' system = 'ancillary'></userproj>
	<period startyear = "2002" startmonth='04' endyear = "2017" endmonth='01' timestep='MS'></period>

	<!-- mendanciltimeseries (TimeSeries) -->
	<process processid ='average3ancillarytimeseries'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters copycomp ='grace-gfz' acceptmissing ='False'></parameters>

		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<grace-jpl source = "NASA-GRACE" product = "jpl-cmwater" folder = "cmwater" band = "grace-jpl" prefix = "grace-jpl" suffix = "RL05-filled">
			</grace-jpl>
			<grace-csr source = "NASA-GRACE" product = "csr-cmwater" folder = "cmwater" band = "grace-csr" prefix = "grace-csr" suffix = "RL05-filled">
			</grace-csr>
			<grace-gfz source = "NASA-GRACE" product = "gfz-cmwater" folder = "cmwater" band = "grace-gfz" prefix = "grace-gfz" suffix = "RL05-filled">
			</grace-gfz>
		</srccomp>

		<dstcomp>
			<grace-ave product = "ave-cmwater" band = "grace-ave" prefix = "grace-ave" suffix = "RL05-filled">
			</grace-ave>
		</dstcomp>
	</process>

</manageprocess>
```

## Seasonal signal extraction

The process <span class='package'>extractseasonancillary</span> extracts the seasonal mean for each season in the dataset (monthly periods for the GRACE data). This process is not needed for the analysis of the GRACE data. To work, the period must include full years only.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "2003" startmonth='01' endyear = "2016" endmonth='12' timestep='MS'></period>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'extractseasonancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters trend = 'kernel' kernel='0.012,0.191,0.492,1.0,0.492,0.191,0.012'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<grace-ave source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater" band = "grace-ave" prefix = "grace-ave" suffix = "RL05-filled">
			</grace-ave>
		</srccomp>
	</process>		
</runprocess>
```

## Resample temporal resolution

In this example we are just going to look at the annual changes in water equivalent thickness using the GRACE data. To do that you must resample the monthly signals to an annual signal. The process for this is <span class='package'>resampletsancillary</span>

 For the GRACE data, that describes the relative change, it does not really matter if you resample using the average annual signal or sum up the monthly signals to an annual sum. In the example I have resampled to annual average.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "2003" startmonth='01' endyear = "2016" endmonth='12' timestep='MS'></period>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'resampletsancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<grace-ave source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater" band = "grace-ave" prefix = "grace-ave" suffix = "RL05-filled">
			</grace-ave>
		</srccomp>
	</process>		
</runprocess>
```

### Trend estimation

In this example the trend of the changes in equivalent water thickness will be done using the annual average GRACE data. The process for this is <span class='package'>trendtsancillary</span>. At time of writing, it can use two different linear methods for estimating the trend Ordinarly Least Sqaure (OLS) and Theil-Sen (TS). For determining the significance of the change in the linear trend the process uses the Mann-Kendall (MK) test. The script is set up so that you just state 'ols' or 'mk', and then the additional analysis follow along. With 'ols' given you also get the random mean square error ('rmse') and the correlations coefficient ('r2'), and with 'mk' you get the Theil-Sen regression (median and at 95 % confidence limits for upper and lower change). The script can also calculate the long term average and standard devations. The xml parameters below generate all the output options presently available:

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "2003" endyear = "2016" timestep='AS'></period>

	<!-- seasonaltrendcorr annual indexes and trends-->
	<process processid = 'trendtsancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters method = 'avg' ></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<grace-ave source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual" band = "grace-ave" prefix = "grace-ave" suffix = "RL05-filled">
			</grace-ave>
		</srccomp>
		<stats id = 'avg' band = "avg"></stats>
		<stats id= 'std' band = "std"></stats>
		<stats id= 'mk' band = "mk"></stats>
		<stats id= 'ols' band = "ols"></stats>
	</process>		
</runprocess>
```

## Significant changes and trends

The process <span class='package'>signiftrendsancillary</span> combines the MK test estimates of absolute changes over the defined period. Two layers are produced, one showing the changes for all areas, and one showing only areas with statistically significant changes.

```
<manageprocess>

	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "2003" endyear = "2016" timestep='timespan-A'></period>

	<process processid = 'signiftrendsancillary' version = '1.3'>
		<overwrite>True</overwrite>

		<parameters basename='grace-ave' threshold = '1.96'></parameters>		
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>		
			<mk-z-grace-ave id = 'significance' source = "NASA-GRACE" product = "ave-cmwater" folder = 'cmwater-annual-trend-A' band = "mk-z-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</mk-z-grace-ave>

			<ts-mdsl-grace-ave id = 'slope' source = "NASA-GRACE" product = "ave-cmwater" folder = 'cmwater-annual-trend-A' band = "ts-mdsl-grace-ave" prefix = "ts-mdsl-grace-ave" suffix = "RL05-filled">
			</ts-mdsl-grace-ave>

			<ts-ic-grace-ave id = 'intercept' source = "NASA-GRACE" product = "ave-cmwater" folder = 'cmwater-annual-trend-A' band = "ts-ic-grace-ave" prefix = "ts-ic-grace-ave" suffix = "RL05-filled">
			</ts-ic-grace-ave>		
		</srccomp>
		</process>
</manageprocess>
```

## Palette for GRACE

![Grace palette]({{ site.commonurl }}/images/cmwater-annual-stats-a_avg-grace-ave_precipln.png){: .pull-right}

If you want to produce color maps showing the GRACE data and the results of your trend analysis, you need to create the palette(s) to use. All palettes must be saved to the database before use, with the process <span class='package'>addrasterpalette</span>. Looking at the color ramp of the online GRACE data at the [official homepage](), I set the following palette:

```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<path></path>
	<!-- addrasterpalette preciplinear-->
	<process processid = 'addrasterpalette'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters palette = 'grace' compid='grace'>
			<setcolor id = '0' red = '96' green ='0' blue='0' alpha ='0' label='0' hint='0' ></setcolor>				
			<setcolor id = '63' red = '204' green ='74' blue='70' alpha ='0' label='25' hint='NA' ></setcolor>			
			<setcolor id = '125' red = '224' green ='224' blue='224' alpha ='0' label='50' hint='50' ></setcolor>
			<setcolor id = '187' red = '60' green ='170' blue='190' alpha ='0' label='75' hint='NA' ></setcolor>
			<setcolor id = '250' red = '4' green ='4' blue='110' alpha ='0' label='100' hint='100' ></setcolor>
			<setcolor id = '253' red = '240' green ='240' blue='132' alpha ='0' label='dry (0)' hint='NA' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>
</palette>
```

## Scaling for color map

To produce a color map, you need to scale your original map to range between 0 and 255, and then assign the palette. By default, Karttur´s GeoImagine Framework assumes that null (nodata) will equal 255, and that the values 251 to 254 represent colors for overlays, frames and text etc. Values in the range 0 to 250 represents the thematic feature of the layer. The process <span class='package'>createscaling</span> adds the scaling to the database.

```
<?xml version='1.0' encoding='utf-8'?>
<scaling>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>


	<!-- Create scaling -->

	<!-- NOTE THE ID IS OLNLY USED IN THE SCRIPTING SO IT CAN HAVE (UNIQUE) DUMMY VALUES HERE -->
	<!-- GRACE monthly cmwater-->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0 ='True' scalefac='22' power='0.4'></parameters>			
    	<comp id = '1' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-stats-A" band = 'avg-grace-ave' suffix = "RL05-filled"></comp>    	
	</process>

	<!-- GRACE annual average cmwater -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0 ='True' scalefac='5' power='0.67'></parameters>			
    	<comp id = '1' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-stats-A" band = 'avg-grace-ave' suffix = "RL05-filled"></comp>    	
		<comp id = '2' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-stats-A" band = 'std-grace-ave' suffix = "RL05-filled"></comp>    	
		<comp id = '3' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ts-ic-grace-ave' suffix = "RL05-filled"></comp>    	
		<comp id = '4' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ols-ic-grace-ave' suffix = "RL05-filled"></comp>    	
	</process>


	<!-- GRACE mk-z trend -->
	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='20' offsetadd='125'></parameters>			
    	<comp id = '1' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'mk-z-grace-ave' suffix = "RL05-filled"></comp>    	
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0 ='True' scalefac='15' power='0.67'></parameters>
		<comp id = '1' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ts-mdsl-grace-ave' suffix = "RL05-filled"></comp>    	
		<comp id = '2' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ts-losl-grace-ave' suffix = "RL05-filled"></comp>    		
    	<comp id = '3' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ts-hisl-grace-ave' suffix = "RL05-filled"></comp>    	
		<comp id = '4' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ols-sl-grace-ave' suffix = "RL05-filled"></comp>    	
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters mirror0 ='True' scalefac='10' ></parameters>
		<comp id = '1' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ols-rmse-grace-ave' suffix = "RL05-filled"></comp>    	
	</process>

	<process processid = 'createscaling' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters scalefac='100'></parameters>			
    	<comp id = '1' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = 'ols-r2-grace-ave' suffix = "RL05-filled"></comp>    	
	</process>
</scaling>
```

## Export color map

having defined a palette and the scaling for the different layers, you can export the layers as color maps (colored GeoTiff images). The process for doing that is <span class='package'>exporttobyteancillary</class>.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "2003" endyear = "2016" timestep='timespan-A'></period>

	<!-- exporttobyte palette: grace -->
	<process processid = 'exporttobyteancillary' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette= 'grace'></parameters>		
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>    	
		<srccomp>
			<avg-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-stats-A" band = "avg-grace-ave" prefix = "avg-grace-ave" suffix = "RL05-filled">
			</avg-grace-ave>
			<std-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-stats-A" band = "std-grace-ave" prefix = "std-grace-ave" suffix = "RL05-filled">
			</std-grace-ave>
			<ts-mdsl-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ts-mdsl-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ts-mdsl-grace-ave>
			<ts-hisl-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ts-hisl-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ts-hisl-grace-ave>
			<ts-losl-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ts-losl-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ts-losl-grace-ave>
			<ts-ic-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ts-ic-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ts-ic-grace-ave>
			<ols-sl-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ols-sl-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ols-sl-grace-ave>
			<ols-ic-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ols-ic-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ols-ic-grace-ave>
			<ols-r2-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ols-r2-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ols-r2-grace-ave>
			<ols-rmse-grace-ave id='value' source = "NASA-GRACE" product = "ave-cmwater" folder = "cmwater-annual-trend-A" band = "ols-rmse-grace-ave" prefix = "mk-z-grace-ave" suffix = "RL05-filled">
			</ols-rmse-grace-ave>

		</srccomp>
	</process>
</runprocess>
```

<figure class="half">
	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2A].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2B].file }}">

  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2C].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2D].file }}">

	<figcaption>Maps of the change in water equicvalent thickenss 2003 to 2016. The top row shows the Ordinary Least Square (OLS) slope and the Theil-Sen (TS) median slope. The bottom row shows the lower and higher 95 % confidence limit for TS slope. </figcaption>
</figure>
