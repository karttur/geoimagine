---
layout: post
title: Basin delineation in GRASS
categories: grass
excerpt: "River basin delineation in GRASS7"
tags:
  - GRASS7
  - basin
  - delineation
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
modified: '2020-10-04 T06:17:25.000Z'
modified: '2020-10-04 T06:17:25.000Z'
comments: true
share: true
figure1: GRASS7_Amazonia-Startup_welcome01
figure2: GRASS7_1stStartup_create-location
figure3: GRASS7_1stStartup_define-location
figure4A: GRASS7_1stStartup_import-data
figure4B: GRASS7_1stStartup_import-success
figure5: GRASS7_Amazonia-drainage

---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>
# Introduction

Water flow and river basins have a momentous influence on both natural landscapes and process as well as on human societies. To understand water flow through the landscape, correctly delineate the boundaries between different basins is essential. This post is a manual in how to use a combination of Python scripting and GRASS GIS for delineating basins from Digital Elevation Models (DEMs).

## Prerequisites

You must have GRASS 7 installed as described in the post on [Install GDAL, QGIS and GRASS](https://karttur.github.io/setup-ide/setup-ide/install-gis/#grass). You also need a projected raster DEM. And you must have [setup GRASS](../grass-GRASS7-startup) for the region covered in the raster DEM. Note that the DEM should have valid elevations for all cells representing land, and NULL for all cells into which your basins finally drain (normally the sea, but any other water body works).

## GRASS

In this manual, I only cover the command line GRASS tools for processing. But all the processing can also be done using the GRASS Graphical User Interface (GUI).

Before you start GRASS, start up a <span class='app'>Terminal</span> session. Otherwise GRASS might not start properly. If you want to start GRASS7 directly from the command line, just type in the full path to the <span class='file'>grass.sh</span> executable script:

<span class='terminal'>/Applications/GRASS-7.X.X.app/Contents/MacOS/Grass.sh
</span>

Otherwise locate your installation of GRASS7 and start it.

GRASS should then show the window _GRASS GIS 7.x.x Startup_. If the location you want to work with is already defined in your GRASS database, it is listed as a GRASS location (the location Amazonia in the example below), otherwise you need to define a new GRASS location.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

If your location is already defined click the <span class='button'>Start GRASS session</span> button and skip the next session.

### Start location

You only need to follow this section if you have not defined the location or imported the DEM to use for the basin analysis.

To start a new location from GRASS startup window use the <span class='button'>New</span> button between the smaller windows for _2 Select GRASS Location_ and _3. Select GRASS Mapset_ (figure above). GRASS then presents you with a new window, _Define new GRASS Location_.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2].file }}">
<figcaption> {{ site.data.images[page.figure2].caption }} </figcaption>
</figure>

Assuming that you have a prepared raster DEM, for example from Karttur's GeoImagine Framework, the best option is to use that layer for defining the location and its projection, extent and resolution.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure3].file }}">
<figcaption> {{ site.data.images[page.figure3].caption }} </figcaption>
</figure>

Accept the new location definition by clicking <span class='button'>Next</span>. You will then get the option of importing the raster file used for defining the location. You can choose to accept, and the DEM will be automatically imported to the default mapset _PERMANENT_. As this is the source map for all subsequent map calculation, keeping it in the mapset _PERMANENT_ is good practice.        

<figure class='half'>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure4A].file }}">
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure4B].file }}">
<figcaption> {{ site.data.images[page.figure4A].caption }} </figcaption>
</figure>

#### Rename layer

In the following sections of this manual, the name of the DEM layer to use for delineating basins will be assumed to be _DEM_. If you imported the DEM as part of the definition of your location, it will be given the same name as the original map. If you forgot the name, use the GRASS general command [g.list](https://grass.osgeo.org/grass78/manuals/g.list.html) to list the layers in the current mapset:

 <span class='terminal'>> g.list type=raster</span>

 If your DEM is not listed, make sure you are in the correct mapset with the command [g.mapset](https://grass.osgeo.org/grass78/manuals/g.mapset.html):

  <span class='terminal'>> g.mapset -p</span>

  <span class='terminal'>> g.mapset mapset=_name_</span>


Rename any layer in your current mapset with the GRASS general command [g.rename](https://grass.osgeo.org/grass78/manuals/g.rename.html):

<span class='terminal'>> g.rename raster=DEM_SRTM_hydro-amazonia_0_cgiar-250,DEM</span>

#### Import DEM

To manually import the DEM, and at the same time set a custom name you can use the GRASS command [r.in.gdal](https://grass.osgeo.org/grass78/manuals/r.in.gdal.html). Add the _-e_ flag to set the region to the extent of the imported DEM if not already set to fit this dataset.

<span class='terminal'>> r.in.gdal -e input=/Volumes/GRASS2020/MODIS/SRTM/region/DEM/hydro-amazonia/DEM_SRTM_hydro-amazonia_0_cgiar-250.tif output=DEM --overwrite
</span>

### Check out projection and location

Use the GRASS terminal window (commandline) and check out the projection and the region:

<span class='terminal'>> g.proj -p</span>

and

<span class='terminal'>> g.region -p</span>

For the basin delineation you must use a proper projection using the metric (or US customary) system. Your DEM should cover the entire region, normally at full spatial resolution (unless you want to use a more coarse resolution for the basin delineation).

### Create a new mapset

The DEM raster file that you imported, either when you defined the projection and location, or as a separate raster layer, should have ended up in the mapset _PERMANENT_. For the delineation work, deriving a range of intermediate layers, and finally getting a map of all the basin outlets, it is better to change to a user defined mapset.

<span class='terminal'>> g.mapset -c drainage</span>

### Identify basin outlets

Identification of all potential drainage basin outlets is done in GRASS, but then needs to be cleaned up using a Python script (below). Before running the GRASS script you need to decide on the cut-off area for defining a drainage basin. That is done in a text file with only two lines, in the example the cutoff is set at 2000 cells:

```
2000 thru 99999999 = 1
* = NULL
```

#### Watershed accumulation and basin area

The GRASS raster command [r.watershed](https://grass.osgeo.org/grass78/manuals/r.watershed.html) calculates a variety of hydrological parameters, including the upstream (accumulation) area of each cell. Note that the accumualtion area is calculacated as number of cells. [r.watershed](https://grass.osgeo.org/grass78/manuals/r.watershed.html) can be run assigning a Single Flow Direction (SFD) out of each cell, or a Multiple Flow Direction (MFD). MFD is in general preferred and also the default, but SFD has advantages when it comes to basin delineation. If you want to avoid negative numbers for upstream area, set the _-a_ flag.

To apply an SFD flow routing, set the flag _-s_. In the example below I have set both the _-a_ and _-s_ flags, and I have requested the production of layers for _accumulation_ and _basin_:

<span class='terminal'>> r.watershed -as elevation=DEM@PERMANENT accumulation=SFD_upstream basin=SFD_basin threshold=10000 --overwrite</span>

```
SECTION 1a (of 5): Initiating Memory.
SECTION 1b (of 5): Determining Offmap Flow.
 100%
SECTION 2: A* Search.
 100%
SECTION 3: Accumulating Surface Flow with SFD.
 100%
SECTION 4: Watershed determination.
 100%
SECTION 5: Closing Maps.
Writing out only positive flow accumulation values.
Cells with a likely underestimate for flow accumulation can no longer be
identified.
```

Omitting the _-s_ flag causes [r.watershed](https://grass.osgeo.org/grass78/manuals/r.watershed.html) to run in default mode, applying an MFD flow routing.

<span class='terminal'>r.watershed -a elevation=DEM@PERMANENT accumulation=MFD_upstream basin=MFD_basin threshold=10000 --overwrite</span>

```
SECTION 1a (of 5): Initiating Memory.
SECTION 1b (of 5): Determining Offmap Flow.
 100%
SECTION 2: A* Search.
 100%
SECTION 3a: Accumulating Surface Flow with MFD.
 100%
SECTION 3b: Adjusting drainage directions.
 100%
SECTION 4: Watershed determination.
 100%
SECTION 5: Closing Maps.
Writing out only positive flow accumulation values.
Cells with a likely underestimate for flow accumulation can no longer be
identified.
```

If you look at the accumulation layer, the major Rivers (e.g. the Amazon River) should have the largest accumulation values.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure5].file }}">
<figcaption> {{ site.data.images[page.figure5].caption }} </figcaption>
</figure>

#### Identify terminal water body

A powerful raster commands in GRASS is the raster map calculator [r.mapcalc](https://grass.osgeo.org/grass78/manuals/r.mapcalc.html). You can use [r.mapcalc](https://grass.osgeo.org/grass78/manuals/r.mapcalc.html) to create a layer where the terminal water body, into which the basins you want to delineate have their outlets. This is equal to setting all land areas (or areas in your DEM layer with valid data) to NULL, and your terminal water body (e.g. the areas assigned with NULL in the DEM) to a value of 1.

<span class='terminal'>> r.mapcalc "drain_terminal = if(isnull('DEM@PERMANENT'), 1, null())"</span>

#### Get shoreline

With the terminal water body identified, the shoreline with all the basin outlets will all be found in the neighbouring cells of the water body. In GRASS you can use the proximity analysis tool [r.buffer](https://grass.osgeo.org/grass78/manuals/r.buffer.html) to identify the coastline from the terminal water body. To capture all shoreline cells set the distance to one cell * sqrt of 2 + plus a little extra. The spatial resolution of the DEM used in this example is 231.6 m. I thus set the distance threshold for the proximity analysis to 330 m.

<span class='terminal'>> r.buffer input=drain_terminal output=shoreline distances=330 units=meters --overwrite</span>

#### Extract accumulated drainage for shoreline

With both the shoreline and the flow accumulation identified on a per pixel level, you can once again apply [r.mapcalc](https://grass.osgeo.org/grass78/manuals/r.mapcalc.html), but this time for masking out the accumulated upstream area of only the coastline (i.e. the potential basin outlets).

<span class='terminal'>> r.mapcalc "coastline_SFD_flowacc = if((shoreline > 1), SFD_upstream, null())"</span>

<span class='terminal'>> r.mapcalc "coastline_MFD_flowacc = if((shoreline > 1), MFD_upstream, null())"</span>

#### Threshold minimum drainage area

The map of the upstream (accumulated) cells masked to show only the shoreline contains the upstream area of the whole land mass. But you only want the river basins, not the cells that empty directly into the terminal water body, or via insignificant water courses. You need to [r.reclass](https://grass.osgeo.org/grass78/manuals/r.reclass.html) the raster layer with the upstream area to retain only the cells above a given threshold. Remember that the accumulated upstream drainage is given in cells. In the example below I have set the threshold to 2000. As the map has a spatial resolution of 231.6 m, this equals approximately 100 (107 to be exact) square kilometres.

<span class='terminal'>> r.reclass input=coastline_SFD_flowacc output=basin_SFD_outlets rules='/Volumes/GRASS2020/GRASSsupport/reclass/reclass_flow_acc_2000.txt' --overwrite</span>

<span class='terminal'>> r.reclass input=coastline_MFD_flowacc output=basin_MFD_outlets rules='/Volumes/GRASS2020/GRASSsupport/reclass/reclass_flow_acc_2000.txt' --overwrite</span>

#### Vectorize basin outlet candidates

Grass 6
<span class='terminal'>> r.to.vect input=basin_outlets output=basin_outlets_pt feature=point</span>

Grass 7
<span class='terminal'>> r.to.vect input=basin_SFD_outlets output=basin_SFD_outlet_pt type=point</span>

<span class='terminal'>> r.to.vect input=basin_MFD_outlets output=basin_MFD_outlet_pt type=point</span>

#### Add tables to vector databases

Use GRASS vector command [v.db.addcolumn](https://grass.osgeo.org/grass78/manuals/v.db.addcolumn.html) to add columns to the vector attribute tables. The columns will be used for storing the cell data on upstream area and the basin id (sequential number).

<span class='terminal'>> v.db.addcolumn map=basin_SFD_outlet_pt columns='upstream DOUBLE PRECISION'</span>

<span class='terminal'>> v.db.addcolumn map=basin_SFD_outlet_pt columns='basin INT'</span>

or with multiple columns added in one command:

<span class='terminal'>> v.db.addcolumn map=basin_MFD_outlet_pt columns='upstream DOUBLE PRECISION, basin INT'</span>

#### Add basin data to vector databases

To transfer the cell data underlying each point to the vector attribute table, use the GRASS vector command [v.what.rast](https://grass.osgeo.org/grass78/manuals/v.what.rast.html).

<span class='terminal'>> v.what.rast map=basin_SFD_outlet_pt raster=SFD_upstream column=upstream</span>

<span class='terminal'>> v.what.rast map=basin_SFD_outlet_pt raster=SFD_basin column=basin</span>

<span class='terminal'>> v.what.rast map=basin_MFD_outlet_pt raster=MFD_upstream column=upstream</span>

<span class='terminal'>> v.what.rast map=basin_MFD_outlet_pt raster=MFD_basin column=basin</span>

#### Export basin outlet candidates

The basin outlet candidate points must be cleaned up - outlets from some rivers occupy more than 1 cell. I do this cleaning using Python scripts, and for that I require shape file as input. Thus the candidate points must be exported with [v.out.ogr](https://grass.osgeo.org/grass78/manuals/v.out.ogr.html). Start by creating the target directory, and then export the GRASS vector as a shape file:

<span class='terminal'>> mkdir -p /Volumes/GRASS2020/GRASSproject/global_drainage_basins/regions/amazonia</span>

<span class='terminal'>> v.out.ogr type=point input=basin_SFD_outlet_pt format=ESRI_Shapefile output=/Volumes/GRASS2020/GRASSproject/global_drainage_basins/regions/amazonia/basin-SFD-outlet-pt_SRTM_hydro-amazonia_0_cgiar-250.shp --overwrite</span>

<span class='terminal'>> v.out.ogr type=point input=basin_MFD_outlet_pt format=ESRI_Shapefile output=/Volumes/GRASS2020/GRASSproject/global_drainage_basins/regions/amazonia/basin-MFD-outlet-pt_SRTM_hydro-amazonia_0_cgiar-250.shp --overwrite</span>
