---
layout: post
title: Additional packages
modified: '2018-10-17 T18:17:25.000Z'
categories: depreciated
excerpt: "Add additional python packages to Anaconda"
tags:
  - GDAL
  - pypng
  - pyproj
  - reportlab
  - svgis
  - svgwrite
  - seasonal
  - sentinelsat
  - shapely
  - xmltodict
  - wget
  - plotnine
  - landsatxplore
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-17 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

This post was originally written prior to setting up the [conda virtual environment](../prep/prep-conda-environ/).

# Introduction

The full suite of capabilities that come with Karttur's GeoImagine Framework requires that you install some extra python packages with <span class='app'>Anaconda</span>. Which packages to install depends both on the Anaconda distribution and version, as well as the GeoImagine Framework packages.

If you are going to download data from [https://earthdata.nasa.gov](https://earthdata.nasa.gov) (e.g.SMAP or MODIS) you must also setup your machine to handle <span class='terminalapp'>wget</span>, as explained towards the end of this blog.

# Additional packages

 With a full installation of the Framework and Anaconda3 installed with Python 3.6.7, I needed to add the following python packages:

- GDAL
- pypng
- pyproj
- reportlab
- svgis
- svgwrite
- seasonal
- sentinelsat
- shapely
- xmltodict
- geopandas (not yet completed)
- georasters (not yet completed)
- rasterio (not yet completed, but installed)
- fiona (not yet completed)

See the [excellent web page](https://automating-gis-processes.github.io/2016/Lesson1-Intro-Python-GIS.html)

## GDAL

The [Geographic Data Abstraction Library (GDAL)](https://www.gdal.org/) is the core of all spatial processing in Karttur's GeoImagine Framework. Anaconda suggests that GDAL be installed using [conda-forge](https://anaconda.org/conda-forge/gdal):

<span class='terminal'>$ conda install -c conda-forge gdal</span>

However, dependent on how you installed other packages it might be better to use [<span class='terminalapp'>pip install</span>](https://pypi.org/project/GDAL/):

<span class='terminal'>$ pip install gdal</span>

## pypng

The Pure Python PNG (pypng) image encoder/decoder is a stand alone module that is used for writing png images. In the Framework pypng is used both for generating image maps, including movie frames, and other graphical output (e.g. legends). Use [<span class='terminalapp'>pip install</span>](https://pypi.org/project/pypng/) to get pypng added to your project.

<span class='terminal'>$ pip install pypng</span>

## pyproj

The package pyproj is a map projection library. In the Framework it is used for importing SMAP data. You can install pyproj either using [conda-forge](https://anaconda.org/anaconda/reportlab):

<span class='terminal'>$ conda install -c conda-forge pyproj</span>

or [<span class='terminalapp'>pip install</span>](https://pypi.org/project/pyproj/)

<span class='terminal'>$ pip install pyproj</span>

## reportlab

In the Framework, reportlab is used for generating pdf outputs, mainly for creating map legends. You can install reportlab either using [conda](https://anaconda.org/anaconda/reportlab):

<span class='terminal'>$ conda install -c anaconda reportlab</span>

or [<span class='terminalapp'>pip install</span>](https://pypi.org/project/reportlab/)

<span class='terminal'>$ pip install reportlab</span>

## svgis

SVGIS converts vector geodata to Scalable Vector Graphics (SVG). SVG can be styled using Cascade Style Sheets (CSS) and also read and manipulated by drawing programs. In the Framework SVGIS is primarily used for exporting vector data to use as overlays in map layouts.

SVGIS is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/svgis/)

<span class='terminal'>$ pip install svgis</span>

## svgwrite

SVGwrite is a more general library for writing SVG formated vector graphics.

SVGwrite is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/svgwrite/)

<span class='terminal'>$ pip install svgwrite</span>

## seasonal

The seasonal package estimate and remove trend and periodicity in time-series. In the Framework it is used for time-series decompostion and trend estimations.

**NOTE** that in the Framework [the seasonal package is edited to include more options and with altered default settings](#).

The seasonal package is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/seasonal/)

<span class='terminal'>$ pip install seasonal</span>

## sentinelsat

In the Framework Sentinelsat is used for searching, downloading and retrieving the metadata and the actual data of Sentinel satellite images from the Copernicus Open Access Hub.

Sentinelsat is installed with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/sentinelsat/).

<span class='terminal'>$ pip install sentinelsat</span>

## Shapely

Shapley is a versatile tool for manipulation and analysis of geometric objects in the Cartesian plane. In the Framework it is used for vector processing.

You can install shapely either using [conda-forge](https://anaconda.org/anaconda/shapely):

<span class='terminal'>$ conda install -c conda-forge shapely</span>

or with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/Shapely/).

<span class='terminal'>$ pip install Shapely</span>

## xmltodict

In Karttur's GeoImagine Framework, xmltodict is used for reading all the instructions. The Framework will not function without it.

You can install shapely either using [conda-forge](https://anaconda.org/conda-forge/xmltodict):

<span class='terminal'>$ conda install -c conda-forge xmltodist</span>

or with [<span class='terminalapp'>pip install</span>](https://pypi.org/project/xmltodict/).

<span class='terminal'>$ pip install xmltodict</span>

## landsatxplore

For downloading Landsat data from EarthExplorer (yu need to register)
[#](https://pypi.org/project/landsatxplore/)

<span class='terminal'>$ pip install landsatxplore</span>

## plotnine

<span class='terminal'>$conda install -c conda-forge plotnine</span>

## wget

Wget is a command-line tool for retrieving files using HTTP, HTTPS, FTP and FTPS (the most widely-used Internet protocols). In Karttur´s GeoImagine Framework, wget is used for accessing online available data from e.g.[https://earthdata.nasa.gov](https://earthdata.nasa.gov), including MODIS and SMAP. To install Wget on Mac osx you can use <span class='app'>Homebrew</span>.

<span class='terminal'>$ brew install wget</span>

The installation of <span class='app'>Homebrew</span> itself is covered in the blog post on [ImageMagick](https://karttur.github.io/setup-theme-blog/blog/install-imagemagick/).
