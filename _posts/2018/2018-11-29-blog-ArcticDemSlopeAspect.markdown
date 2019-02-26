---
layout: post
title: Terrain anlysis
modified: '2018-11-29 T18:17:25.000Z'
categories: blog
excerpt: "Deriving slope, aspect and hillshape from the Arctic DEM"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-29 T18:17:25.000Z'
comments: true
share: true
fig1: dem_detail_h18v02
fig2: hillshade_detail_h18v02
fig3: slope_detail_h18v02
fig4: aspect_detail_h18v02
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

From a Digital Elevation Model (DEM), like the Arctic DEM introduced in the [previous](../blog-ArcticDem/) post, a range of terrain metrics can be extracted. Perhaps the most common metrics are slope and aspect where slope is the steepness and aspect the horizontal direction of the slope. To illustrate the 3D character of a DEM, the hillshade can be computed and set as an opacity-transparency mask.

# Overview

This post covers the processing of hillshade, slope and aspect from DEM data tiled to the modis system. In Karttur's GeoImagine Framework, the standard terrain metrices are all calculated using the [GDAL DEM utility (gdaldem)](https://www.gdal.org/gdaldem.html).

The [next](../blog.ArcticDemTPI/) post introduces metrics that can be used for capturing elevation variations and positions. More advanced terrain metrics can be extracted by using the GRASS raster command _r.param.scale_ (https://grass.osgeo.org/grass74/manuals/r.param.scale.html).

## Hillshade

The [<span class='package'>hillshade</span>](../../subprocess/subproc-hillshademodis/) outputs an 8-bit raster with a shaded relief effect useful for visualizing the terrain. You can optionally specify the azimuth and altitude of the light source, a vertical exaggeration factor and a scaling factor to account for differences between vertical and horizontal units.

### xml

The xml parameters that can be given are identical to the parameters in the [GDAL DEM utility (gdaldem)](https://www.gdal.org/gdaldem.html). Note that the destination _cellnull_ is fixed at -9999.

All destination layers have default names that builds on the input DEM and the spatial aggregation.

You can generate separate terrain metrics for each MODIS tile, and fill the edge by setting the parameter _compute_edges_ to _True_. The edges will not be as accurate as the internal pixels and if you want to create a more correct terrain metrics you should mosaic the data prior to extracting the metrics.

<button id= "toggleimportclimateindex" onclick="hiddencode('importclimateindex')">Hide/Show importclimateindex.xml</button>

<div id="importclimateindex" style="display:none">

{% capture text-capture %}
{% raw %}

```
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>

	<process processid ='organizeancillary' dsversion = '3.0'>
		<overwrite>True</overwrite>
		<parameters importdef='climateindex'
			epsg = '4326'
			instid = 'NOAA'
			dsname  = 'climateindex'
			dsversion = "1.0"
			accessdate = "20181211"
			copyright = ""
			regionid = 'global'
			regioncat = 'global'
			dataurl = "https://www.esrl.noaa.gov/psd/data/climateindices/list/"
			metaurl="https://www.esrl.noaa.gov/psd/data/climateindices/list/"
			title = "NOAA climate indexes"
			label = "NOAA climate indexes"
		> </parameters>

		<srcpath volume = "Karttur3tb" hdrfiletype = "data" ></srcpath>
		<dstpath volume = "Karttur3tb" hdrfiletype = "data"></dstpath>

		<srcraw
			id="best"
			datadir ='climateindex'
			datafile = "best"
			theme = "climateindex"
			subtheme = "ENSO"
			cellnull = '-9.99'
			title = "Bivariate ENSO Timeseries"
			label = "Bivariate El Nino Southern Oscillaltion Timeseries (Climate index)"
		></srcraw>
		<dstcomp>
			<best source = "NOAA" product = "climateindex" folder = "climateindex" band = "best" prefix = "best" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</best>
		</dstcomp>

		<srcraw
			id="pna"
			datadir ='climateindex'
			datafile = "pna"
			theme = "climateindex"
			subtheme = "Teleconnections"
			cellnull = '-99.9'
			title = "Pacific North American Index"
			label = "Pacific North American Index (Teleconnetion climate index)"
		></srcraw>
		<dstcomp>
			<pna source = "NOAA" product = "climateindex" folder = "climateindex" band = "pna" prefix = "pna" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</pna>
		</dstcomp>

		<srcraw
			id="nao"
			datadir ='climateindex'
			datafile = "nao"
			theme = "climateindex"
			subtheme = "Teleconnection"
			cellnull = '-99.9'
			title = "North Atlantic Oscillation"
			label = "North Atlantic Oscillation (Teleconnetion climate index) from CPC"
		></srcraw>
		<dstcomp>
			<nao source = "NOAA" product = "climateindex" folder = "climateindex" band = "nao" prefix = "nao" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</nao>
		</dstcomp>

		<srcraw
			id="pdo"
			datadir ='climateindex'
			datafile = "pdo"
			theme = "climateindex"
			subtheme = "Teleconnection"
			cellnull = '-9.9'
			title = "Pacific Decadal Oscillation"
			label = "Pacific Decadal Oscillation (Teleconnetion climate index)"
		></srcraw>
		<dstcomp>
			<pdo source = "NOAA" product = "climateindex" folder = "climateindex" band = "pdo" prefix = "pdo" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</pdo>
		</dstcomp>

		<srcraw
			id="nina3"
			datadir ='climateindex'
			datafile = "nina3"
			theme = "climateindex"
			subtheme = "ENSO"
			cellnull = '-99.9'
			title = "East Central Tropical Pacific SST"
			label = "East Central Tropical Pacific SST (ENSO + Pacific Sea Surfrance Temperature climate index) using ersstv5 from CPC"
		></srcraw>
		<dstcomp>
			<nina3 source = "NOAA" product = "climateindex" folder = "climateindex" band = "nina3" prefix = "nina3" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</nina3>
		</dstcomp>

		<srcraw
			id="soi"
			datadir ='climateindex'
			datafile = "soi"
			theme = "climateindex"
			subtheme = "Atmosphere"
			cellnull = '-99.99'
			title = "Southern Oscillation Index"
			label = "Southern Oscillation Index (Atmosphere Climate Index)"
		></srcraw>
		<dstcomp>
			<soi source = "NOAA" product = "climateindex" folder = "climateindex" band = "soi" prefix = "soi" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</soi>
		</dstcomp>

		<srcraw
			id="solar"
			datadir ='climateindex'
			datafile = "solar"
			theme = "climateindex"
			subtheme = "Solar"
			cellnull = '-999'
			title = "Solar Flux Index"
			label = "Southern Oscillation Index (Atmosphere Climate Index)"
		></srcraw>
		<dstcomp>
			<solar source = "NOAA" product = "climateindex" folder = "climateindex" band = "solar" prefix = "solar" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</solar>
		</dstcomp>

	</process>

</organize>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>


<button id= "togglehillshade" onclick="hiddencode('hillshade')">Hide/Show importclimateindex.xml</button>
<div id="hillshade" style="display:none">
{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<arcticdem>
	<userproj userid = 'karttur' projectid = 'karttur-arcticdemext' tractid= 'karttur-arcticdemext' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>
	<process processid = 'HillShadeModis' version = '1.3'>
		<parameters mosaic='False' compute_edges='True'</parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<dem500 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem500" prefix = "dem500" suffix = "v30">
			</dem500>
		</srccomp>
	</process>
</arcticdem>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Slope

The [<span class='package'>slope</span>](../../subprocess/subproc-slopemodis/) outputs an 32-bit Float raster with a  slope in degrees unless the _-p_ (_percent_) parameter is set.

### xml

The xml parameters that can be given are identical to the parameters in the [GDAL DEM utility (gdaldem)](https://www.gdal.org/gdaldem.html). Note that the destination _cellnull_ is fixed at -9999.


The destination layer organization is defaulted and can not be set by the user.

<button id= "toggleslope" onclick="hiddencode('slope')">Hide/Show ArcticDEM_Slope.xml</button>
<div id="slope" style="display:none">
{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<arcticdem>
	<userproj userid = 'karttur' projectid = 'karttur-arcticdemext' tractid= 'karttur-arcticdemext' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>
	<process processid = 'SlopeModis' version = '1.3'>
		<parameters mosaic='False' compute_edges='True' </parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<dem500 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem500" prefix = "dem500" suffix = "v30">
			</dem500>
		</srccomp>
	</process>
</arcticdem>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Aspect

The [<span class='package'>slope</span>](../../subprocess/subproc-aspectmodis/) outputs an 32-bit Float raster with azimuth in degrees; if the parameter _-trigonometry_ is given, the output is in angle degrees with zero set to the East (rather than North).

### xml

The xml parameters that can be given are identical to the parameters in the [GDAL DEM utility (gdaldem)](https://www.gdal.org/gdaldem.html). Note that the destination _cellnull_ is fixed at -9999.

The destination layer organization is defaulted and can not be set by the user.

<button id= "toggleaspect" onclick="hiddencode('aspect')">Hide/Show ArcticDEM_Slope.xml</button>
<div id="aspect" style="display:none">
{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<arcticdem>
	<userproj userid = 'karttur' projectid = 'karttur-arcticdemext' tractid= 'karttur-arcticdemext' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>
	<process processid = 'AspectModis' version = '1.3'>
		<parameters mosaic='False' compute_edges='True' </parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<dem500 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem500" prefix = "dem500" suffix = "v30">
			</dem500>
		</srccomp>
	</process>
</arcticdem>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

<figure class="half">

  <a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig1].file }}"><img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1].file }}" alt="image"></a>

  <a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig2].file }}">
  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig2].file }}" alt="image"></a>

	<a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig3].file }}">
  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig3].file }}" alt="image"></a>

	<a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig4].file }}">
  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig4].file }}" alt="image"></a>

	<figcaption>Digital Elevation Model and dereived terrain metrics (clockwise, starting upper left): DEM, hillshade, slope and aspect.</figcaption>
</figure>
