---
layout: post
title: Additional packages

categories: depreciated
excerpt: "Add additional python packages to Anaconda"
tags:
- landsatxplore
- plotnine
- pypng
- reportlab
- seasonal
- sentinelsat
- svgis
- svgwrite
- wget

image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-16 T18:17:25.000Z'
modified: '2019-09-20 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

This post was originally written prior to setting up the [conda virtual environment](../prep/prep-conda-environ/).

# Introduction

The full suite of capabilities that come with Karttur's GeoImagine Framework requires that you install some extra python packages with <span class='app'>Anaconda</span>. Which packages to install depends both on the Anaconda distribution and version, as well as the GeoImagine Framework packages.

If you have setup the GeoImagine Framework with a [conda virtual python environment](../setup-conda-environ/) you probably already have all the required python packages installed.

If you are going to download data from [https://earthdata.nasa.gov](https://earthdata.nasa.gov) (e.g.SMAP or MODIS) you must also setup your machine to handle <span class='terminalapp'>wget</span>, as explained towards the end of this blog.

# Conda virtual environments

it is strongly recommended to setup your Python interpreter using conda virtual environment as described in a [previous](../setup-conda-environ/) post.

If, for some reason, you want to create an empty virtual environment instead, open the <span class='app'>terminal</span> and write the command:

<span class='terminal'>$ conda create --no-default-packages -n geoimagine0 python</span>

where _geoimagine0_ is the name of the virtual environment.

Activate the virtual Python environment by typing:

<span class='terminal'>$ conda activate geoimagine0</span>

You can now install any packages to your virtual environment using eg. <span class='terminal'>$ conda install</span> or <span class='terminal'>$ pip install</span>.

# Core (default) packages

 With a full installation of the Framework and Anaconda3 installed with Python 3, you need to add the following default Python packages:

 - numpy
 - scipy
 - pandas
 - geopandas
 - rasterio
 - psycopg2
 - statsmodels
 - numba
 - xmltodict

If you followed the manual on [setting up a virtual Python environment in conda](../setup-conda-environ/), these are the same packages as listed as defaults when setting up a virtual environment. You should thus already have then installed. If not, you can also install the above packages into an (empty) existing virtual environment. It is best to install all packages at once, so that all of the dependencies are installed at the same time.

Activate the virtual environment you want to use (e.g. _geoimagine0_)

<span class='terminal'>$ conda activate geoimagine0</span>

and then install all the core packages:

<span class='terminal'>(geoimagine0) ... $ conda install numpy scipy pandas geopandas rasterio psycopg2 statsmodels numba xmltodict</span>

## Packages installed with the above commands

Installing the default packages above, results in a long list of also other packages, called dependencies, that are also installed. The trick is that all will be installed using shared resources and there will not be any conflicts between different versions. A full list of installed packages are reported at the prompt, or you can use <span class='terminalapp'>conda</span> to list all packages installed with a particular virtual environment:

<span class='terminal'>(geoimagine0) ... $ conda list</span>

Some of the additional packages installed with the command above include the following packages (among others) for spatial data processing:

 - GDAL
 - fiona
 - shapely
 - pyproj
 - proj4

If you want to explore other Python packages for spatial data processing please have a look at [this excellent web page](https://automating-gis-processes.github.io/2016/Lesson1-Intro-Python-GIS.html).

## Additional packages required

Apart from the above packages, you also need to install some packages using other channels as well as other installation managers. The additional packages that are needed include:

 - landsatxplore
 - plotnine
 - pypng
 - reportlab
 - seasonal
 - sentinelsat
 - stldecompose (LOESS decomposition)
 - svgis
 - svgwrite
 - wget

## landsatxplore

[Landsatxplore](https://pypi.org/project/landsatxplore/) is a package for searching and downloading Landsat satellite image scenes from [EarthExplorer](https://earthexplorer.usgs.gov). There are alternative packages that can be used for the same task, but Karttur's GeoImagine Framework is set up for using Landsatxplore. If you want to use Landsat data from EarthExplorer you need to register as an EarthExplorer user.

[Landsatxplore](https://pypi.org/project/landsatxplore/) is not available at any conda channel and you need to use the <span class='terminalapp'>pip</span> installation manager.

<span class='terminal'>$ pip install landsatxplore</span>

## plotnine

[plotnine](https://plotnine.readthedocs.io/en/stable/) is a powerful graphics editor that you can use for composing maps and layouts in Python. It is like a Python version of the popular "Grammar of graphics" concept used by _ggplot_. The grammar allows users to compose plots by explicitly mapping data to the visual objects that make up the plot. plotnine is available on several conda channels, and can for instance be installed using the command:

<span class='terminal'>$ conda install -c conda-forge plotnine</span>

## pypng

The Pure Python PNG (pypng) image encoder/decoder is a stand alone module that is used for writing png images. In the Framework, pypng is used both for generating image maps, including movie frames, and other graphical output (e.g. legends). Use [<span class='terminalapp'>pip install</span>](https://pypi.org/project/pypng/) to get pypng added to your project.

<span class='terminal'>$ pip install pypng</span>

## reportlab

Reportlab is not used in the present FRamework version. It can be used for generating pdf outputs, mainly for creating map legends.

if you want to install reportlab make sure it can be installed without conflicts using [<span class='terminalapp'>conda</span>](https://anaconda.org/anaconda/reportlab):

<span class='terminal'>$ conda install -c anaconda reportlab</span>

reportlab is also available as [<span class='terminalapp'>pip install</span>](https://pypi.org/project/reportlab/)

<span class='terminal'>$ pip install reportlab</span>

## seasonal

The seasonal package estimate and remove trend and periodicity in time-series. In the Framework it is used for time-series decomposition and trend estimations.

**NOTE** that in the Framework __the seasonal package is edited to include more options and with altered default settings__.

The seasonal package is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/seasonal/)

<span class='terminal'>$ pip install seasonal</span>

## sentinelsat

In the Framework Sentinelsat is used for searching, downloading and retrieving the metadata and the actual data of Sentinel satellite images from the Copernicus Open Access Hub.

Sentinelsat is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/sentinelsat/).

<span class='terminal'>$ pip install sentinelsat</span>

## svgis

SVGIS converts vector geodata to Scalable Vector Graphics (SVG). SVG can be styled using Cascaded Style Sheets (CSS) and also read and manipulated by drawing programs. In the Framework SVGIS is primarily used for exporting vector data to use as overlays in map layouts.

SVGIS is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/svgis/)

<span class='terminal'>$ pip install svgis</span>

## svgwrite

SVGwrite is a more general library for writing SVG formated vector graphics. It is used for creating legends and other layout items for maps. The preferred installation is using [<span class='terminalapp'>conda</span>](https://anaconda.org/omnia/svgwrite):

<span class='terminal'>$ conda install -c omnia svgwrite</span>

svgwrite is also available as [<span class='terminalapp'>pip install</span>](https://pypi.org/project/svgwrite/)

<span class='terminal'>$ pip install svgwrite</span>

## wget

Wget is a command-line tool for retrieving files using HTTP, HTTPS, FTP and FTPS (the most widely-used Internet protocols). In Karttur´s GeoImagine Framework, wget is used for accessing online available data from e.g.[https://earthdata.nasa.gov](https://earthdata.nasa.gov), including MODIS and SMAP. To install Wget on Mac osx you can use <span class='app'>Homebrew</span>.

<span class='terminal'>$ brew install wget</span>

The installation of <span class='app'>Homebrew</span> itself is covered in the blog post on [ImageMagick](https://karttur.github.io/setup-theme-blog/blog/install-imagemagick/).
