---
layout: post
title: "Regional synthesis: Overview"
modified: '2018-12-17 20:17'
categories: blog
excerpt: Overview of how to regionalize data
tags:
  - Regionalize
  - project
  - tract
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-12-17 22:03'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

All the previous blogs have dealt with different kinds of data sources, including how to import, reformat, fill, analyse and export different sources of data. The data sources have included static global datasets (e.g. the worlds continents and countries), coarse resolution dynamic (monthly) datasets (e.g. the GRACE data on soil moisture), medium resolution highly dynamic (daily) datasets (e.g. the SMAP datasets on soil moisture), medium resolution and dynamic (16D) multispectral satellite images (MODIS products), and high resolution intermittent multi-band satellite data (Sentinel, both radar and optical).

[Calculating the global Vertical Water Balance (VWB)](../blog-VWB/) you combined two ancillary data sources, the [TRMM precipitation](../blog-TRMM/) and the [FAO reference evapotranspiration](../blog/FAO-refevap). But so far you have not assembled or combined data from different source systems (e.g. ancillary, SMAP, MODIS, Sentinel etc).  

The series of blogposts on "Regional synthesis" will step through how to
- 1) [create a customized region](../blog-RegionalizeOka-1),
- 2) [Import ancillary data to this region](../blog-RegionalizeOka-1),
- 3) To be continued.

# Prerequisites

To start the regional synthesising project you must have setup Karttur's GeoImagine Framework as described in [earlier](../blog-import-project-eclipse/) posts. You must also have prepared the ancillary data you want to use.

# Setting a region and selecting datasets

The set of posts entitled "Regional synthesis" uses the Okavango Inland Delta in Botswana as example. As Botswana lies within the region covered by the Tropical Rainfall Measurement Mission (TRMM) dataset (between 50 degrees latitudes) the tutorial uses the Vertical Water Balance data calculated from the TRMM precipitation data.  If your region lies at higher latitudes you must calculate VWB from the the [IMERG](../blog-IMERG/) precipitation dataset before continuing.
