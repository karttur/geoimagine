---
layout: post
title: "Regional synthesis: 1 Create region"
modified: '2018-12-18 20:17'
categories: blog
excerpt: Create user defined project and region
tags:
  - Vertical Water Balance
  - transfer
  - updatedb
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-12-18 22:03'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post is the first hands-on post in the series of posts on \"Regional synthesis\" using Karttur's GeoImagine Framework. In this post you are going to create the region to use for synthesising data, methods and models. The example uses the Okavango Inland Delta In Botswana but you can define any other region you like.

# Prerequisites

To follow this post you must have setup the Karttur's GeoImagine Framework as described in [earlier](../blog-import-project-eclipse/) posts.

If you define a region that stretches to higher latitudes than 50 degrees you need to calculate the [Vertical Water Balance](../blog-VWB/) using the [IMERG dataset](../blog-IMERG/) instead of the [TRMM dataset](../blog-TRMM/).

# Karttur projects and regions

All the processes included in Karttur´s GeoImagine Framework must be associated with a _user_, a _project_, a _region_ and a _system_. Running the Framework from xml files, these are defined in the \<userproj\> child tag:

```
userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
```

For a process to be accepted at runtime, the user (_userid_) must 1) have sufficient privileges to run the process, and 2) either own or have rights to alter the defined region. The region is not explicitly stated, instead one of the three hierarchical levels of user defined spatial domains must be stated: _tract_, _site_ or _plot_. These three levels are hierarchical so that a _plot_ is always inside a _site_ that is always inside a _tract_. A _tract_ can contain any number of _sites,_ and a _site_ can contain any number of _plots_. Further, the _tract_ must either be equal to a default region, or associated with a default region. If a _plot_ is given, the processing will be for that plot alone; if a _site_ is given the processing will be for that site alone (but including all plots associated with that site); if a _tract_ is given the processing will be for the _tract_ including all sites and plots associated with that tract.

Most processing, except export and mosaic, are only allowed at the lowest level of data organization. Put differently, the processing of ancillary data is only permissible at the original ancillary level. All processing of MODIS data is only allowed using MODIS tiled data, etc. This means that when assembling data for a region, the data to assemble must be pre-processed at their original levels. You can not import ancillary data to a region and then process the data using ancillary associated processes at tile or mosaic levels.

The conceptual idea behind this principle is to make the processing as efficient as possible while preventing duplicate processing. Behind the scenes the assembly of regional data is always done using tiled data at the requested system level (i.e. modis or mgrs. This means that if you create a region and an existing region already includes the same tiles (of say modis), then all the processing for your newly defined region that were done for the pre-existing region, are already ready and will not be redone.

# Create a custom region

The Framework contains hundreds of default regions, including the world´s continents and countries. If your processing region coincides with a particular country or continent you just use that country/continent as your region.

In most cases it is, however, unlikely that the region you want to work with is identical to one of the default regions. You can then define your own region, albeit you still have to hook it to a default region. A customized region can be created either by importing a vector that defines the region, or by giving the co-ordinates (The latter is not included in the public version).

## Create region from existing vector

Creating a customized region from an existing vector is a 2-stage process; first you have to import the vector as an ancillary layer, and then you define a project from that vector. The two processes to call are [<span class='package'>organizeancillary</span>](../../subprocess/subproc-organizeancillary/) and [<span class='package'>ManageTractProj</span>](../../subprocess/subproc-ManageTractProj/)

### Organize Ancillary

In the example below the region is defined in a shape file called <span class='file'>oka-delta_mapbox.shp</span>. The shape file contains a single polygon feature identifying the region. To import it use the standard import process for any ancillary data, [<span class='package'>organizeancillary</span>](../../subprocess/subproc-organizeancillary/).

<button id= "toggleorganizeancillary" onclick="hiddencode('organizeancillary')">Hide/Show okadelta0110-import_study-area.xml</button>

<div id="organizeancillary" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period timestep='static'></period>

	<!-- Import the tract as an ancillary layer,
	the layer to import must exist-->
	<process processid ='organizeancillary' dsversion = '3.0'>
		<parameters importdef = 'shp'
			epsg = '4326'
			instid = 'karttur'
			dsname  = 'okavango'
			dsversion = "1.0"
			accessdate = "20010908"
			copyright = ""
			regionid = 'bw'
			regioncat = 'country'
			dataurl = ""
			metaurl=""
			title = "Kartturs Okavango study site"
			label = "Kartturs Okavango study site"
		> </parameters>
		<srcpath volume = "karttur3tb/ANCILIMPORT" hdrfiletype = "shp" datfiletype = "shp"></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = "shp" datfiletype = "shp"></dstpath>
		<srcraw id="okadelta-studyarea"
			datadir ='karttur/okavango/delta/mapbox'
			datafile = "oka-delta_mapbox"
			theme = "studyarea"
			subtheme = "wetlands"
			metadir =""
			metadfile =""
			title = "MSc study site"
			label = "MSc study site"
		></srcraw>
		<dstcomp>
			<okadelta-studyarea source = "karttur" product = "okavango" folder = "wetland" band = "okadelta-studyarea" prefix = "okadelta-studyarea" suffix = "v1"
				scalefac = "1" offsetadd = "0" dataunit = "na" celltype = 'vector' cellnull = '0' measure ='N' masked='N'>
			</okadelta-studyarea>
		</dstcomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Manage Tract Project

When you have imported the polygon you want to use for defining your region (tract), you can set up a new project by calling the process [<span class='package'>ManageTractProj</span>](../../subprocess/subproc-ManageTractProj/).

There are some requirements on the naming of both tracts and projects, both must contain at least one hyphen (”-”), and the number of letters before and after the first hyphen must be at least five.

In the example, that will be used throughout this series of blog posts on \"Regional synthesis\" the tract and the project have the same name: _karttur-okadelta_.

<button id= "toggleoManageTractProj" onclick="hiddencode('ManageTractProj')">Hide/Show okadelta0120_add-proj.xml</button>

<div id="ManageTractProj" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<period timestep='static'></period>

	<!-- Create a new project with a predefined tract as region -->
	<process processid ='ManageTractProj'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters
			compid ='wetland_okadelta-studyarea'
			defaultregion = 'bw'
			tractid = 'karttur-okadelta'
			tractname = 'Okavango Delta'
			projid = 'karttur-okadelta'
			projname = 'Okavango Delta'
			modtilelink = 'True'
			mgrstilelink = 'False'
			wrstilelink = 'False'>
			<tracttitle>Okavango Delta</tracttitle>
			<tractlabel>Okavango Delta</tractlabel>
			<projtitle>Okavango Delta</projtitle>
			<projlabel>Okavango Delta</projlabel>
		</parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'shp' datfiletype = 'shp'></srcpath>
		<dstpath volume = "karttur3tb" hdrfiletype = 'shp' datfiletype = 'shp'></dstpath>
		<srccomp>
			<okadelta-studyarea source = "karttur" product = "okavango" folder = "wetland" band = "okadelta-studyarea" prefix = "okadelta-studyarea" suffix = "v1" scalefac = "1" offsetadd = "0" dataunit = "na" celltype = 'vector' cellnull = '0' measure ='N' masked='N'>
			</okadelta-studyarea>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

The process [<span class='package'>ManageTractProj</span>](../../subprocess/subproc-ManageTractProj/) will seek out the MODIS (MODIS SIN grid) and Sentinel (MGRS) tiles covered by the region as requested. When sub-sequently running processes with the _tractid_ set to _karttur\_okadelta_ they will operate exclusively on these identified tiles. Only when the data is explored or exported will the processing actually be restricted to the region as defined by the user (i.e. the polygon imported in the first step above).
