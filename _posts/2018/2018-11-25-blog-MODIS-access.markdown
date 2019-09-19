---
layout: post
title: MODIS access
modified: '2018-11-25 T18:17:25.000Z'
categories: blog
excerpt: "Access, download and organize MODIS data"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-25 T18:17:25.000Z'
comments: true
share: true
figure1: TWIpercent_MCD43A4_h20v10_2005249_v006-tg01
figure2A: ols-sl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2B: ts-mdsl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2C: ts-losl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2D: ts-hisl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled

movie1: TWIpercent_MCD43A4_h20v10_2001009-2017361_v006-tg01
movie2: TWIpercent_MCD43A4_h21v08_2001009-2017361_v006-tg01

MODIS-0100_search-datapool: MODIS-0100_search-datapool
MODIS-0110_search-todb: MODIS-0110_search-todb
MODIS-0120_download_singletile: MODIS-0120_download_singletile
MODIS-0129_checksingletile: MODIS-0129_checksingletile
MODIS-0130_explodsingletile: MODIS-0130_explodsingletile

---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>
# Introduction

This post illustrates how to search, download and organize remote sensing data from the [Moderate Resolution Imaging Spectroradiometer (MODIS)](https://terra.nasa.gov/about/terra-instruments/modis) sensor using Karttur's GeoImagine Framework.

## Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../setup-copy-project-eclipse/). The Framework [postgres database must be setup](../setup-db/) and the [processes defined](../setup-processes/). The Framework MODIS python package must be installed, and the MODIS tiling system added to the postgres database.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

# MODIS

The [Moderate Resolution Imaging Spectroradiometer (MODIS)](https://terra.nasa.gov/about/terra-instruments/modis) is an optical and thermal sensor carried on two satellites, [Terra](https://terra.nasa.gov/) (launched in 1999) and [Aqua](https://aqua.nasa.gov/) (launched in 2002). The MODIS sensor has a spectral resolution of 36 bands and a wide swath that allows daily imaging of the entire globe. The spatial resolution varies from 250 m (or 232 to be exact) for red and near infra-red, 500 m for five (5) additional optical wavelengths designated for land observation, and 1 km for 29 bands mainly intended for atmospheric and oceanic observation, including thermal emissivity. The MODIS raw data is processed into a [series of products](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table), and both the raw data and the products are freely available. The products are stored in a wall-to-wall defined tile system using a [sinusoidal projection](https://modis-land.gsfc.nasa.gov/MODLAND_grid.html). Each tile is equally large and the Earth is divided into 36 horizontal and 18 vertical tiles.

In this post you will use the reflectance corrected product [MCD43A4 (version 006)](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mcd43a4_v006) that combine observations from both MODIS instruments into 16-day (16D) composites. The 16D composites are available for any consecutive days, but here we will use every 8th or 16th day. This means that we will use Day Of Year (DOY) 1, 9, 17 ... etc, where the day number refers to the central (9th) day of each 16D period (note that if you use MODIS product version 005 or earlier, the day number refers to the first day of the 16D period).

## Python Package

The GeoImagine Framework includes a package for specific MODIS processing: [geoimagine-modis](https://github.com/karttur/geoimagine-modis/). However, also several other packages in the Framework are needed for repeating the steps below.

## Project module

The project module file (<span class='file'>projMODIS.py</span>) is available in the <span class='package'>Project</span> package [projects](https://github.com/karttur/geoimagine-projects/).

<button id= "toggleprojfile" onclick="hiddencode('projfile')">Hide/Show projMODIS.py</button>

<div id="projfile" style="display:none">

{% capture text-capture %}
{% raw %}

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    #projFN ='/full/path/to/modis_YYYYMMDD.txt'
    projFN ='doc/MODIS/modis_YYYYMMDD.txt'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Process chain

The project file links to an ASCII text file that contains a list of the xml files to execute.

```
projFN ='doc/MODIS/modis_YYYYMMDD.txt'
```

As the path to the project file does **not** start with a slash "/", the path is relative to the project module itself. The [project package available on Karttur's GitHub page](../../../geoimagine-projects) contains the path and the files required for running the process chain. Both the text file and the xml files are available under the subfolder [<span class='file'>doc/MODIS</span>](../../../geoimagine-projects/doc/MODIS).

<button id= "toggleprojfile" onclick="hiddencode('processchain')">Hide/Show MODIS process chain</button>

<div id="processchain" style="display:none">
{% capture text-capture %}
{% raw %}

```
###################################
###           MODIS             ###
###################################
###################################

###################################
###     Search and download     ###
###################################

## Search data pool for MODIS products ##
#MODIS-0100_search-datapool.xml

## Transfer search results to db ##
#MODIS-0110_search-todb.xml

## Download the MODIS data for single tile position ##
#MODIS-0120_download_singletile.xml

## Check the db for downloaded single tile position##
#MODIS-0129_checksingletile.xml

###################################
###           Extract           ###
###################################

## Explode single tile position
#MODIS-0130_explodsingletile.xml
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Search and download

The MODIS data is freely available from the [Land Processes Distributed Active Archive Center (LP DAAC) Data Pool](https://lpdaac.usgs.gov/data_access/data_pool). Users are required to log in with their [Earthdata](https://urs.earthdata.nasa.gov/home) login credentials to obtain data. Once you have registered for an Earthdata account, you can use the Data Pool to search and download MODIS data, as well as other data. Karttur's GeoImagine Framework have special processes for bulk downloading and managing MODIS data.

#### Searching the MODIS online repository

The way Karttur´s GeoImagine Framework is organized, you first have to search the online repository for available MODIS tiles, then register the search results in the Framework postgres database. Once the data is registered you can download and extract the actual MODIS data.

#### Search

I have tried to find some library or database that lists the data available in the Data Pool, but have failed to find any. Instead I created a solution where I use <span class ='terminalapp'>wget</span> ("web get") for downloading an html coded list of available data. If you do not have <span class ='terminalapp'>wget</span>, [this](../setup-add-packages/) post includes the installation instructions

The Framework process for searching the online repository for MODIS data using <span class ='terminalapp'>wget</span> is <span class='package'>searchdatapool</span>. As the MODIS tiles are stored per date in the Data Pool that is how the data search is done. This means that the globally available tiles are always captured for each product and date that are included in the search.

{% capture foo %}{{page.MODIS-0100_search-datapool}}{% endcapture %}
{% include xml/MODIS-0100_search-datapool.html foo=foo %}

Before running the process [<span class='package'>searchdatapool</span>](../../subprocess/subproc-searchdatapool/) you must have the credentials for accessing the [Data Pool](https://lpdaac.usgs.gov/data_access/data_pool) in a <span class='file'>.netrc</span> file, with the username corresponding to the one given in the xml file ('YourEarthDataUser'). How to use <span class='file'>.netrc</span> for handling connection is detailed in [this](../setup-dblink/) post.

The process will drill into the Data Pool and load all the available data as html coded files. By default the process saves all the html files under the path <span class='file'>../modis/source/yyyy.mm.dd/</span> under the volume identified in the xml file. The files are ordinary html files, but with the <span class='file'>.html</span> extension omitted.

#### Transfer search to database

To transfer the search results to the GeoImagine Framework database you must run the process [<span class='package'>ModisSearchToDB</span>](../../subprocess/subproc-ModisSearchToDB/). This process reads the html files, extracts the required information and inserts the information in the database. When finished it moves the html file to a sub-folder called <span class='file'>done</span>. If, for some reason, you delete your database all you need to do is to take all the html files under the <span class='file'>done</span> sub-folder and move them one level up and then re-run [<span class='package'>ModisSearchToDB</span>](../../subprocess/subproc-ModisSearchToDB/).

{% capture foo %}{{page.MODIS-0110_search-todb}}{% endcapture %}
{% include xml/MODIS-0110_search-todb.html foo=foo %}

#### Downloading MODIS data

With the available MODIS Data Pool holdings registered in the database you can download any of the registered data using either [<span class='package'>downloadModisRegion</span>](../../subprocess/subproc-downloadModisRegion/) or [<span class='package'>downloadModisSingleTile</span>](../../subprocess/subproc-downloadModisSingleTile/).

When downloading you can either download the files on the fly, or write the download commands to a shell script file. The latter is the default. To change it you need to set the parameter _asscript_ to False. The example below downloads single tiles (h20v10).

{% capture foo %}{{page.MODIS-0120_download_singletile}}{% endcapture %}
{% include xml/MODIS-0120_download_singletile.html foo=foo %}

If you did not add the parameter _asscript_, including setting it to _False_, the process produces a script file that you must run manually. You can also copy the script to another machine (with better internet connection) and run the script from there. The machine you run from must have a <span class='file'>.netrc</span> file with your EarthData credentials. And the volume indicated in the xml must either exists on the machine from which you download, or you need to edit the script to reflect a volume that is available on the machine from which you download. To run the shell script you must first make it executable, and then execute it:

<span class='terminal'>$ chmod 777 /path/to/script.sh</span>

<span class='terminal'>$ /path/to/script.sh</span>

If you choose to use batch scripting you have to run a second process that checks the exploded files and transfers the results to the Framework database. You can either re-run the process that you used for generating the shell script file, making sure the overwrite option is set to False (default). Alternatively you can run the corresponding special process [<span class='package'>CheckMODISRegion</span>](../../subprocess/subproc-CheckMODISRegion/) or [<span class='package'>CheckMODISSingleTile</span>](../../subprocess/subproc-CheckMODISSingleTile/).

#### Check MODIS tiles

If you have used shell script batch processing for either downloading (pervious section) or extracting (next section) MODIS data, you can run one of the two versions of the <span class='package'>CheckMODIS</span> process to update the database. <span class='package'>CheckMODIS</span> will check the consistency of your local MODIS files and the database, and harmonise the database with the local data holdings.

{% capture foo %}{{page.MODIS-0129_checksingletile}}{% endcapture %}
{% include xml/MODIS-0129_checksingletile.html foo=foo %}

### Extracting MODIS layers

The layers included in each MODIS HDF file, as well as metadata, can be accessed using the GDAL command <span class='terminalapp'>gdalinfo</span>. ([GDAL is part of the GeoImainge Framework](https://karttur.github.io/setup-ide/setup-ide/install-gis/), and must be installed in order to extract the MODIS data.)

<span class='terminal'>gdalinfo path/to/modis/modisfile.HDF</span>

In Karttur's GeoImagine Framework the layers to extract have to be defined in the database, in the table _templates_ under the _modis_ schema. The template table also define the celltype, cellnull, projection and folder where to store the extracted layer. At present the _modis.templates_ table is pre-defined and to change it you either need to change the xml file defining the table, or manually change the table using postgres SQL ([this](../blog-SMAP-sql/) post shows how to update the _template_ table for SMAP data).

In this post you are going to explode the combined MODIS reflectance product, MCD43A4, version 006. By default all the seven bands included in the product are extracted (nir = near infra-red, mir = mid infra-red):

| Band | Wavelenght (nm) | Name  | code |
|:-----|:----------------|:------|:-----|
| 1    | 620–670         | red   | rl   |
| 2    | 841–876         | nir   | na   |
| 3    | 459–479         | blue  | bl   |
| 4    | 545–565         | green | gl   |
| 5    | 1230–1250       | mir A | ma   |
| 6    | 1628–1652       | mir B | mb   |
| 7    | 2105–2155       | mir C | mc   |


To extract the MODIS layers from the HDF files, either run [<span class='package'>ExplodeMODISRegion</span>](../../subprocess/subproc-ExplodeMODISRegion/) or [<span class='package'>ExplodeMODISSingleTile</span>](../../subprocess/subproc-ExplodeMODISSingleTile/).

{% capture foo %}{{page.MODIS-0130_explodsingletile}}{% endcapture %}
{% include xml/MODIS-0130_explodsingletile.html foo=foo %}

By default these processes generate shell script files that must be manually executed for extracting the requested layers. As explained above, if you choose to use batch scripting you have to run a second process that checks the exploded files and transfers the results to the Framework database. You can either re-run the process that you used for generating the shell script file, making sure the overwrite option is set to _False_ (default). Alternatively you can run the corresponding special process [<span class='package'>CheckMODISRegion</span>](../../subprocess/subproc-heckMODISRegion/) or [<span class='package'>CheckMODISSingleTile</span>](../../subprocess/subproc-CheckMODISSingleTile/) (see above).
