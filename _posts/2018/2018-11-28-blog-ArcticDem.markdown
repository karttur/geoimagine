---
layout: post
title: Arctic DEM
modified: '2018-11-29 T18:17:25.000Z'
categories: blog
excerpt: "Downloading and organization the Arctic Digital Elevation Model (DEM)"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-29 T18:17:25.000Z'
comments: true
share: true
fig1: arcticdem_polar-stereographic
fig2: arcticdem_h18v02
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

A Digital Elevation Model (DEM) is a general representation of heights above or below a reference geoid (where the geoid is a mathematical shape of an orb, for instance Earth). A Digital Terrain Model (DTM) refers to the natural surface of the Earth, i.e. disregarding vegetation, buildings and other 3 dimensional (3D) human structures. A Digital Surface Model (DSM) instead includes all human 3D objects. Theoretically the conceptual definitions of DTM and DSM are more strict, with DEM being more widely defined. In reality the three concepts are mixed and note seldom used interchangeably. The [Arctic DEM](https://www.pgc.umn.edu/data/arcticdem/) is defined as a DSM.

# Overview

In this post you will add the ArcticDEM to your GeoImagine Framework. To be effective and cover the correct region, you have to start with defining a default region that fits the ArcticDEM. Then you have to link that default region to a project owned by your user (i.e. the system superuser). When you have created your own project and region you can import the ArcticDEM as an ancillary layer, and then tile it to the MODIS SIN grid (modis) system.

# Arctic DEM

The Arctic DEM is an effort led by the United States National Geospatial-Intelligence Agency (NGA) and the National Science Foundation (NSF) to create a high resolution DEM of the Arctic land area. The DEM is created from optical stereo imagery, high-performance computing, and open source photogrammetry software. The DEM covers all land areas north of 60 degrees, all territory of Greenland, the State of Alaska in entirety, and the Kamchatka Peninsula of the Russian Federation.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1].file }}">
<figcaption> {{ site.data.images[page.fig1].caption }} </figcaption>
</figure>

## Create a default regions

The Arctic DEM does not really fit in any of the [predefined default regions](../blog-regions/) in Karttur's GeoImagine Framework. To accommodate and work with the Arctic region, you can create some new default regions. In my version I created three new default regions as defined in the xml file below:

<button id= "togglecreateregion" onclick="hiddencode('createregion')">Hide/Show add_special_default_regions_v80.xml</button>

<div id="createregion" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<specialdefaultregions>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<period timestep = 'static'></period>

	<!-- Add default region arcticland (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'arcticland' regionname = 'Arctic circumpolar land'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '58.0' maxlon = '180' maxlat = '84.0' epsg = '4326' version = '1'>
			<title>Global arctic land zone</title>
			<label>Region covering arctic cricumpolar land masses extending from 58 to 84 degrees north.</label>
		</parameters>
		<dstpath volume = 'karttur3tb' ></dstpath>
		<dstcomp>
			<roi  measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region arcticdem (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'arcticdem' regionname = 'Arctic circumpolar DEM'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '58.0' maxlon = '180' maxlat = '90.0' epsg = '4326' version = '1'>
			<title>Global arctic DEM</title>
			<label>Region covering 60 to 90 degrees north, coinciding with the core region of the Arctic DEM.</label>
		</parameters>
		<dstpath volume = 'karttur3tb' ></dstpath>
		<dstcomp>
			<roi  measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region arcticdemext (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'arcticdemext' regionname = 'Arctic circumpolar DEM'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '50.0' maxlon = '180' maxlat = '90.0' epsg = '4326' version = '1'>
			<title>Global arctic extended DEM</title>
			<label>Region covering 50 to 90 degrees north, coinciding with the extended region of the Arctic DEM.</label>
		</parameters>
		<dstpath volume = 'karttur3tb' ></dstpath>
		<dstcomp>
			<roi  measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

</specialdefaultregions>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Create user tracts linked to arctic regions

The Framework is built in such a way that no user, including the super users, can use default regions for actual data processing. All processing can only be done vis-a-vis regions that are owned by the logged in user. Thus you have to create user regions (called "tracts") that correspond to the default regions that you created above.

<button id= "togglecreatedefregproj" onclick="hiddencode('defregproj')">Hide/Show add_user_projects-regions_arctic.xml</button>

<div id="defregproj" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- Manage user project -->
	<process processid ='ManageDefRegProj'>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<parameters defaultregion = 'arcticland'
		tractid = 'karttur-arcticland'
		tractname = 'karttur arcticland'
		projid = 'karttur-arcticland'
		projname = 'karttur arcticland'>
		<tracttitle>Karttur arcticland</tracttitle>
		<tractlabel>Karttur arcticland</tractlabel>
		<projtitle>Karttur arcticland</projtitle>
		<projlabel>Karttur arcticland</projlabel>
		</parameters>
	</process>

	<!-- Manage user project -->
	<process processid ='ManageDefRegProj'>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<parameters defaultregion = 'arcticdem'
		tractid = 'karttur-arcticdem'
		tractname = 'karttur arcticdem'
		projid = 'karttur-arcticdem'
		projname = 'karttur arcticdem'>
		<tracttitle>Karttur arcticdem</tracttitle>
		<tractlabel>Karttur arcticdem</tractlabel>
		<projtitle>Karttur arcticdem</projtitle>
		<projlabel>Karttur arcticdem</projlabel>
		</parameters>
	</process>

	<!-- Manage user project -->
	<process processid ='ManageDefRegProj'>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<parameters defaultregion = 'arcticdemext'
		tractid = 'karttur-arcticdemext'
		tractname = 'karttur arcticdemext'
		projid = 'karttur-arcticdemext'
		projname = 'karttur arcticdemext'>
		<tracttitle>Karttur arcticdemext</tracttitle>
		<tractlabel>Karttur arcticdemext</tractlabel>
		<projtitle>Karttur arcticdemext</projtitle>
		<projlabel>Karttur arcticdemext</projlabel>
		</parameters>
	</process>

</manageprocess>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Data access and download

The [Artic DEM](https://www.pgc.umn.edu/data/arcticdem/) is freely available from [GRACE TELLUS](http://data.pgc.umn.edu/elev/dem/setsm/ArcticDEM). The data are available through ftp (ftp.data.pgc.umn.edu/ and then under the folder tree elev/dem/setsm/ArcticDEM). The mosaics at 100 m and coarser resolution are available as single file mosaics.

Karttur's GeoImagine Framework does not include any process for downloading the Arctic DEM. To download the Arctic DEM, please use any FTP client (for example [Filezilla](https://filezilla-project.org)).

At time of writing, the Arctic DEM version is 3.0, and the two files that I downloaded where the 100 and 500 m mosaics:

- arcticdem_mosaic_100m_v3.0.tif
- arcticdem_mosaic_500m_v3.0.tif

## Import as ancillary data

DEM data is imported to the Framework as ancillary data, in the example import below both the 100 and 500 m versions are imported. Note that the project and tract for importing are set to the extended arctic region, as defined above.

<button id= "toggleimport" onclick="hiddencode('import')">Hide/Show ancillary-import-arcticDEM.xml</button>

<div id="import" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<importarcticdem>
	<userproj userid = 'karttur' projectid = 'karttur-arcticdemext' tractid= 'karttur-arcticdemext' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='static'></period>
	<process processid ='organizeancillary' dsversion = '3.0'>
		<parameters importdef='geotiff'
			epsg = '3413'
			instid = 'NGA-NSF'
			dsname  = 'arcticdem'
			dsversion = "3.0"
			accessdate = "20181110"
			copyright = ""
			regionid = 'arcticdem'
			regioncat = 'global'
			dataurl = ""
			metaurl=""
			title = "Arctic DEM"
			label = "Arctice Digitial Surface Model"
		> </parameters>

		<srcpath volume = "Karttur3tb/ANCILIMPORT" hdrfiletype = "tif" datfiletype = "tif"></srcpath>
		<dstpath volume = "Karttur3tb" hdrfiletype = "tif" datfiletype = "tif"></dstpath>

		<srcraw
			id="dem500"
			datadir ='ArcticDEM'
			datafile = "arcticdem_mosaic_500m_v3.0"
			theme = "DEM"
			subtheme = "DSM"
			metadir =""
			metadfile =""
			title = "Arctic DEM"
			label = "Arctice Digitial Surface Modeln"
		></srcraw>
		<dstcomp>
			<dem500 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem500" prefix = "dem500" suffix = "v30" scalefac = "1" offsetadd = "0" dataunit = "masl" celltype = 'Float32' cellnull = '-9999' measure ='R' masked='N'>
			</dem500>
		</dstcomp>

		<srcraw
			id="dem100"
			datadir ='ArcticDEM'
			datafile = "arcticdem_mosaic_100m_v3.0"
			theme = "DEM"
			subtheme = "DSM"
			metadir =""
			metadfile =""
			title = "Arctic DEM"
			label = "Arctice Digitial Surface Modeln"
		></srcraw>
		<dstcomp>
			<dem100 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem100" prefix = "dem100" suffix = "v30" scalefac = "1" offsetadd = "0" dataunit = "masl" celltype = 'Float32' cellnull = '-9999' measure ='R' masked='N'>
			</dem100>
		</dstcomp>

	</process>		
</importarcticdem>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Link MODIS tiles

The ArcticDEM mosaics at 100 and 500 m downloaded and imported above are too large for some of the processes. One of the basic concepts behind Karttur´s GeoImagine Framework is to use tiling systems for processing the Earth's surface piecewise. The two main tiling systems in use are the MODIS sinusoidal system and MGRS.

The xml below identifies all MODIS SIN tiles that overlap with the Arctic regions defined in the xml above. The process <span class='package'>LinkDefaultRegionsToMODIS</span> by default identifies all MODIS tiles for all regions. But if you set _overwrite_ = _False_ (the default setting) only default regions that do not have any identified MODIS tiles are tested. The source composition (\<srccomp\>) defined in the xml is for the shape file with the MODIS tiles as polygons. If your Framework lack the MODIS tiles, you need to setup the regions, including the MODIS tiling system as described in [this](../blog-setup-regions/) post.

<button id= "togglelinkmodis" onclick="hiddencode('linkmodis')">Hide/Show regions-modtiles_v80.xml</button>

<div id="linkmodis" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<regionsmodis>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>

	<process processid ='LinkDefaultRegionsToMODIS' version = '3.0'>
		<parameters> </parameters>
		<overwrite>N</overwrite>
		<srcpath volume = "karttur3tb" hdrfiletype = "shp" datfiletype = "shp"></srcpath>
	    <srccomp>
	    	<modtiles source = "karttur" product = "modtiles" folder = "tiles" band = "modtiles" prefix = "modtiles" suffix = "lonlat">
			</modtiles>
	    </srccomp>
	</process>

</regionsmodis>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

To run the actual tiling below, you must have identified the tiles covering the region.

## MODIS tiling

At this stage your Framework should contain:

- ArcticDEM (imported as ancillary layer)
- Arctic default regions coinciding with the spatial extent of the arcticDEM
- User project and tract built from the ArcticDEM fitted default region(s)
- MODIS tiles coinciding with the ArcticDEM fitted default region(s)

If you have all of the above, you can can tile the ArcticDEM data to the MODIS SIN grid system.

<button id= "toggletiling" onclick="hiddencode('tiling')">Hide/Show tile_ArcticDEM2modis.xml</button>

<div id="tiling" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<tilearcticdem>
	<userproj userid = 'karttur' projectid = 'karttur-arcticdemext' tractid= 'karttur-arcticdemext' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>
	<!-- tileregiontomodis -->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'karttur-arcticdemext' epsg = '6842'  xres = '463.313'  yres = '463.313' resample='near'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<dem500 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem500" prefix = "dem500" suffix = "v30">
			</dem500>
		</srccomp>
	</process>
</tilearcticdem>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

The xml above generates a shell script that you must run manually. The code snippet below shows the code for generating a single tile (h18v02 central Scandinavia) shown in the figure below.

```
mkdir -p /Volumes/karttur3tb/modis/NGA-NSF/tiles/dem/h18/v02/0;
/Library/Frameworks/GDAL.framework/Versions/2.1/Programs/gdalwarp -t_srs "+proj=sinu +lon_0=0 +x_0=0 +y_0=0 +a=6371007.181 +b=6371007.181 +units=m +no_defs " -tr 463.313000000 463.313000000  -te 0.0 6671703.118 1111950.51966667 7783653.63766667  -r near  /Volumes/karttur3tb/ancillary/NGA-NSF/region/dem/arcticdemext/0/dem500_arcticdem_arcticdemext_0_v30.tif /Volumes/karttur3tb/modis/NGA-NSF/tiles/dem/h18/v02/0/dem500_arcticdem_h18v02_0_v30.tif;
```

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig2].file }}">
<figcaption> {{ site.data.images[page.fig2].caption }} </figcaption>
</figure>
