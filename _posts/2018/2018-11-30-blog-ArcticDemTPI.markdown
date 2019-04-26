---
layout: post
title: TPI, TRI and roughness
modified: '2018-11-29 T18:17:25.000Z'
categories: blog
excerpt: "Arctic DEM terrain indexes."
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-29 T18:17:25.000Z'
comments: true
share: true
fig1a: tpi500detail
fig1b: tpi1000detail
fig1c: tpi1500detail
fig1d: tpi2000detail

---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

The relative variations in topography is highly scale sensitive, and also the key for categorising different landscape elements (plains valleys, peaks etc), as well as for determining landscape hydrological properties (recharge and discharge areas, channels etc). From a Digital Elevation Model (DEM), the relative variation can be calculated by comparing a single cells with its neighbours. In Karttur´s GeoImagine Framework, three different measures on the relative topographic variations are included:

- Topographic Position Index (TPI),
- Terrain Ruggedness index (TRI), and
- Roughness index (RI)

If you are looking for deriving slope, aspect or hillshade or from DEM, this is covered in the [previous](../blog-ArcticDemSlopeAspect/) post.

# Overview

This post covers the processing of TPI from DEM data tiled to the modis system. The processing of Terrain Ruggedness index (TRI) and Roughness (RN), are identical. All the indexes (TPI, TRI, RN) utilize the [GDAL DEM utility (gdaldem)](https://www.gdal.org/gdaldem.html). In Karttur's GeoImagine Framework you can set the TPI (TRI or RN) processing to produce destination layers at different spatial resolutions. This is convenient if you are intending to the TPI (TRI, RN) data for e.g. [landform classification](../blog-ArcticDEMLandform/).

The Topographic Position Index (TPI) is simply the difference between a cell elevation value and the average elevation of the neighborhood around that cell. The TRI is the and Roughness the...

# Terrain Position Index (TPI)

Positive values mean the cell is higher than its surroundings while negative values mean it is lower.
The degree to which it is higher or lower, plus the
slope of the cell, can be used to classify the cell
into slope position.  If it is significantly higher
than the surrounding neighborhood, then it is likely
to be at or near the top of a hill or ridge.  Signifi
cantly low values suggest the cell is at or near the
bottom of a valley.  TPI values near zero could
mean either a flat area or a mid-slope area, so the
cell slope can be used to distinguish the two.

## xml

Cellnull is fixed at -9999; in Karttur's version the indexes (TPI, TRI, RN) are all defaulted to the cell type Int16. This can not be changed unless editing the source code.

All destination layers have default names that builds on the input DEM and the spatial aggregation. Any number of spatial aggregations can be produced with a single command through the \<resolfac\> tag. The tag expects a single attribute _id_ that must be an integer. Each \<resolfac\> tag will lead to one layer, with the TPI resolution represeting a spatial aggregation as _id_\entified (e.g. with _id_ set to 2, the spatial resolution will be double the original source data etc). Note, however, that all produced layers will be in the original resolution to allow direct overlay and analysis. At the coarser resolution the coarser value will thus be represented by quadrants of cells with equal values. Visually it will seem like the spatial resolutions differs, but the underlaying raster data will be the same irrespective of the aggregation.

```
<?xml version='1.0' encoding='utf-8'?>
<tpiarcticdem>
	<userproj userid = 'karttur' projectid = 'karttur-arcticdemext' tractid= 'karttur-arcticdemext' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>
	<!-- TPI MODIS DEM -->
	<process processid = 'TPImodis' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters mosaic='False' compute_edges='True' resolid0='500'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<dem500 source = "NGA-NSF" product = "arcticdem" folder = "dem" band = "dem500" prefix = "dem500" suffix = "v30">
			</dem500>
		</srccomp>
		<resolfac id = "2"></resolfac>
		<resolfac id = "3"></resolfac>
		<resolfac id = "4"></resolfac>
	</process>
</tpiarcticdem>
```

The xml above produces four (4) TPI compositions at different aggregration levels at 1, 2, 3 and 4 times the spatial resolution of the source DEM (an equal resolution TPI is always produced even if not explicitly stated). The xml will produce TPI layers for all modis tiles covered by the user tract _karttur-arcticdemext_ (corresponding default region = _arcticdemext_) that was created in the [previous](../blog-ArcticDem/) post.

The figure below illustrates the TPI for a detailed scene and all four aggregation levels.

<figure class="half">

  <a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig1a].file }}"><img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1a].file }}" alt="image"></a>

  <a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig1b].file }}">
  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1b].file }}" alt="image"></a>

	<a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig1c].file }}">
  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1c].file }}" alt="image"></a>

	<a href="{{ site.commonurl }}/images/{{ site.data.images[page.fig1d].file }}">
  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1d].file }}" alt="image"></a>

	<figcaption>Comparison of Terrain Position index (TPI) at (clockwise, starting upper left): 500 m, 1000 m, 1500 m and 2000 m.</figcaption>
</figure>
