---
layout: post
title: Setup processes
modified: '2018-10-18 T18:17:25.000Z'
categories: setup
excerpt: "Setup the processes for Karttur's GeoImagine Framework"
tags:
 - addsubproc
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-18 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post will demonstrate how to add the process parameters in Karttur's GeoImagine Framework Spatial Data Integrated Development Environment (SPIDE). The processes as such are not added, only the parameters required for running the processes are added to the databases.

# Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must also have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../setup-copy-project-eclipse/). You must also have setup the complete Framework database as described in [this](../setup-db/) post.

How to run processes, including the setup described in this post, is covered in an [earlier](../setup-run/) post. The xml files required for running the processes described in the post are included in the [<span class='package'>setup_processes</span>](https://github.com/karttur/geoimagine-setup_processes/) package. To understand the structure of the xml file you can read [this](../setup-xml/) post.

If your PyDev project does not compile and stop because imports are not found, check which package that is lacking and use the post on [Additional packages](../blog-add-packages) for support on adding the missing package to you PyDev project.

# Framework processes

All functionalities of Karttur's GeoImagine Framework are called processes and operate based on parameters defined in the Framework database. Thus a process must be defined in the database before it can be used. Processes are grouped in roots, where a root is usually associated either with a typical class of functions (e.g. overlay, scalar, export) or data sources (e.g Landsat, Sentinel, MODIS etc).

If you followed the tutorial on [set up the database](../setup-db/) one root group ([_manageprocess_](../../rootproc-manageprocess/)) and one process ([_addsubproc_](../../subprocess/subproc-addsubproc/)) were inserted in the database. This added the capability of defining all other processes.

A complete list of both root and sub processes are available from the top menu, or [here](../../rootprocesses/) and [here](../../subprocesses/).

# Python package setup_processes

The setup of processes is done from the special package [<span class='package'>setup_processes</span>](https://github.com/karttur/geoimagine-setup_processes/). This package contains four <span class='file'>.py</span> files, the standard modules <span class='package'>\_\_init\_\_.py</span> and <span class='package'>version.py</span>, plus one main module and one module for adding regions:

- setup_process_main.py
- setup_process_regions.py

The package also contains several subfolders. The package subfolder [<span class='file'>dbdoc</span>](../../package/package-setup_processes/dbdoc/xml) contains all the core processes, whereas the other [subfolders](../../package/package-setup_processes/) contain thematic processes and default or template data related to different data source systems.

## setup_processes_main.py

The main module, <span class='module'>setup\_process\_main.py</span>, only contains one linked text file <span class='file'>process\_karttur\_setup\_YYYYMMDD.txt</span>.

```
if __name__ == "__main__":
    verbose = True
    ''' Link to project file that sets up all processes'''
    projFN = 'process_karttur_setup_YYYYMMDD.txt'
    Setup('dbdoc',projFN,verbose)
```

The textfile, however links to all the xml files (under the subfolder [dbdoc/xml](../../../geoimagine-setup_processes/dbdoc/xml)).

<button id= "toggleprocesschain" onclick="hiddencode('processchain')">Hide/Show process_karttur_setup_YYYYMMDD.txt</button>

<div id="processchain" style="display:none">

{% capture text-capture %}
{% raw %}

```
##### GENERAL #####
# general_process_vXX.xml that installs the general processes is under db_setup
#xml/general_schema_v80_sql.xml

#periodicity_vXX.xml Installs periodicity processing used in all scripts handling actual spatial data
periodicity_v80.xml

##### USERLOCALE #####
#manageuser_vXX.xml Installs user management processes
manageuser_v80.xml

#manage_project_vXX.xml Installs project management processes
manage_project_v80.xml

#regions_v##.xml Installs region management processes
regions_v80.xml

##### ANCILLARY #####
#ancillaryprocess_vXX.xml Installs ancillary data processing
ancillaryprocess_v80.xml

##### LANDSAT #####
#landsatprocess_vXX.xml Installs landsat specific processing
landsatprocess_v80.xml

##### MODIS #####
#modisProcess_vXX.xml Installs MODIS specific processing
modisProcess_v80.xml

##### Linking regions to landsat and MODIS #####
#linkregions_landsat_modis_vXX.xml Installs processes for linking modis and landsat plot/scene positions to regions
linkregions_landsat_modis_v80.xml

##### SSPECIMEN #####
#specimenprocess_vXX.xml Installs specimen processes
specimenprocess_v80.xml

##### SQL DUMP#####
#managesqldumps_v80.xml Installs processes for dumping and restoring the database
managesqldumps_v80.xml

##### RASTER ANAD VECTOR PROCESSING #####
#vegindexprocesses_vXX.xml Installs vegetation index procesing
vegindexprocesses_v80.xml

#endmember_processes_vXX.xml Installs proceses for extracting and examining endmembers from optical satellite images
endmember_processes_v80.xml

#mapcalcprocesses_v80.xml Installs generic layer processing
mapcalcprocesses_v80.xml

#convert_ancillary_vXX.xml Installs specific layer conversion processing
convert_ancillary_v80.xml

#vectorprocess_v7XX.xml Installs vector processes
vectorprocess_v80.xml

#spataldb_process_vXX.xml define spatial db processes
spataldb_process_v80.xml

#imageprocess_vXX.xml Installs image spectral processing
imageprocess_v80.xml

##### Time series #####
#timeseriesprocesses_vXX.xml Installs time series processing
timeseriesprocesses_v80.xml

#timeseriesgraph_setup_vXX.xml Installs processes for time series graphics
timeseriesgraph_setup_v80.xml

##### Layout #####
#layoutprocess_vXX.xml Installs layout processes
layoutprocess_v80.xml

##### DEM #####
#dem_vXX.xml Installs dem processes
dem_v80.xml

##### Export #####
#ExportToByte_vXX.xml Installs export processes for layout
ExportToByte_v80.xml

#ExportZip_vXX.xml Installs export processes for Zip backup
ExportZip_v80.xml

##### Masking #####
#maskprocesses_vXX.xml Installs masking processes
maskprocesses_v80.xml

##### Mosaic #####
#mosaic_process_vXX.xml Installs mosaicing processes
mosaic_process_v80.xml

##### Tiling #####
#tiling_process_vXX.xm Installs tiling processes'''
tiling_process_v80.xml

##### Layout #####

##### Special #####
#special_processes_v80.xml Installs default special rocesses
special_processes_v80.xml

##### Scalar #####
#scalar_v80.xml Installs scalar processing
scalar_v80.xml

##### EXTRACT #####
#extraxtrasterundervector_vXX.xml installs rater extraction under vector
extraxtrasterundervector_v80.xml

#extraxtcsvplots_vXX.xml installs point extraction for csv point list
extraxtcsvplots_v80.xml

##### CLIMATEINDEX #####
#climateindexprocess_vXX.xml installs climateindex imports as ancillary process
#climateindexprocess_v80.xml

##### OVERLAY #####
overlay_v80.xml
overlay-special_v80.xml

##### GRACE #####
#graceProcess_vXX.xml Installs GRACE specific processing
graceProcess_v80.xml

##### SMAP #####
#smapProcess_vXX.xml Installs SMAP specific processing
smapProcess_v80.xml

###### SENTINEL #####
#sentinelProcess_v80_v80.xml installs the db entries for sentinel processes
sentinelProcess_v80.xml

###### GDAl utilities #####
gdal_utlities_v80.xml

##### Transform (rename) #####
transform_v80.xml

##### Updatedb #####
updatelayer_v80.xml
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

Running <span class='file'>setup\_processes\_main.py</span> installs all the interfaces for standard processing capabilities of the Framework.

## setup_process_regions.py

The module <span class='file'>setup_process_regions.py</span> can be used to setup regional datasets, including the predefined tiling systems. It is the main topic of the [next](../setup-regions/) post.
