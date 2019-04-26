---
layout: post
title: Adjust SMAP for open water
modified: '2018-10-28 T18:17:25.000Z'
categories: blog
excerpt: "Improve the SMAP moisture estimates around water bodies"
tags:
  - SMAP


image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-28 T18:17:25.000Z'
comments: true
share: true
SMAP-0190_udatedb_16D_20150423-present: SMAP-0190_udatedb_16D_20150423-present
SMAP-0240_overlayWaterBody_20150331-20181231_16D: SMAP-0240_overlayWaterBody_20150331-20181231_16D
SMAP-0320_extract-season_soil-moisture-wboadj_16D: SMAP-0320_extract-season_soil-moisture-wboadj_16D
SMAP-0330_interpolseasn-season_soil-moisture-wboadj_16D_2015-2019: SMAP-0330_interpolseasn-season_soil-moisture-wboadj_16D_2015-2019
SMAP-0320_extract-season_soil-moisture-fill-wboadj_16D: SMAP-0320_extract-season_soil-moisture-fill-wboadj_16D
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

The SMAP estimates for soil moisture and freeze/thaw state of the land surface are underestimated adjacent to open water bodies. The SMAP products include layers of estimated fractions of open water for each cell. These estimates, at least at time of writing, however, are static. In reality the open water surface fraction varies over time.

In this post the SMAP (static) estimates of fraction open water surface are used for adjusting the SMAP soil moisture and freeze/thaw estimates.

## Prerequisites

This post is an extension of the post on [SMAP processing](../blog-SMAP/) and to follow the process chain in this post you must have completed the initial SMAP processing. Or have access to the layers produced by the initial processing.

# SMAP water bodies

The SMAP products contain two estimates of water bodies: static water bodies and radar water bodies. Both are expressed as fractions of each cell. With two daily products and two water body fractions in each product, approximately 1500 annual layers of water body fractions are available per product. Over nearly four years of operation this amounts to close to 6000 layers. For the passive products, these 6000 layers are more or less identical.

Just looking at the soil moisture and freeze/thaw state of the land, it is obvious that open water surfaces causes underestimations of both. In my native Sweden mixed pixels between land and lakes is reported as thawed when the land is really frozen. Mixed pixels around African lakes are reported to have less soil moisture compared to pixels at larger proximity from the lakes.

The process chain below uses the SMAP internal water fraction layer for adjusting the estimated soil moisture and freeze/thaw states. Because the water fraction masks are static, the improvements are not ideal. Nevertheless they produce more realistic maps of the state of frozen ground and soil moisture conditions adjacent to open water bodies. Dynamic water bodies (e.g. intermittent flooded lakes) that are not captured by the open water masks of SMAP remain erroneous.

## Process chain

<button id= "toggleprojfile" onclick="hiddencode('processchain')">Hide/Show SMAP process chain</button>

<div id="processchain" style="display:none">
{% capture text-capture %}
{% raw %}

```
###################################
###################################
###             SMAP            ###
###################################
###################################

## To run this process chain you must have completed the SMAP initial processing ##

###################################
###          Update db          ###
###################################

## If you have access to SMAP data created by karttur's Geoimagine Framework ##
## you can access the data from your Framework installation by updating the db ##
## You can also use updatedb to clean your database and/or delete files from your Framework organized storage ##

## Update the db with the input data required for the water body adjustment ##
#smap-udatedb_16D_20150423-present.xml

###################################
###   Adjust for water bodies   ###
###################################

## Adjust SMAP estimates for open water bodies ##
#SMAP-0240_overlayWaterBody_20150331-20181231_16D.xml

###################################
###       Extract season        ###
###################################

## Extract seasonal signal ##
#SMAP-0320_extract-season_soil-moisture-wboadj_16D.xml

###################################
###  Interpolate with seasons   ###
###################################

## Interpolate nodata supported with seasonal signal ##
#SMAP-0330_interpolseasn-season_soil-moisture-wboadj_16D_2015-2019.xml

###################################
###   Extract season (again)    ###
###################################

## Extract seasonal signal for filled and interpolated soil moisture ##
## This is the signal that is used for assimilation of MODIS TWI ##
#SMAP-0320_extract-season_soil-moisture-fill-wboadj_16D.xml
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Update DB

Update DB is only useful if you ran the [initial SMAP process chain](../blog-SMAP/) on another machine and then transferred the data to be accessed with the machine you are working with.

{% capture foo %}{{page.SMAP-0190_udatedb_16D_20150423-present}}{% endcapture %}
{% include xml/SMAP-0190_udatedb_16D_20150423-present.html foo=foo %}

### Adjust for water bodies

The process [<span class='package'>fractionadjustsmapoverlay</span>](../../subprocess/subproc-fractionadjustsmapoverlay/) alters the values of one layer dependent on the values in a second layer. The process can be parameterized to use different algorithms for both relative increases and decreases. The results can also be calculated as weighted averages between the original and adjusted values, and a threshold for a maximum (minimum) allowed value can be set.

{% capture foo %}{{page.SMAP-0240_overlayWaterBody_20150331-20181231_16D}}{% endcapture %}
{% include xml/SMAP-0240_overlayWaterBody_20150331-20181231_16D.html foo=foo %}

### Extract season

To extract the seasonal signal with the adjusted data, run the process [<span class='package'>extractseasonsmap</span>](../../subprocess/subproc-extractseasonsmap/).

{% capture foo %}{{page.SMAP-0320_extract-season_soil-moisture-wboadj_16D}}{% endcapture %}
{% include xml/SMAP-0320_extract-season_soil-moisture-wboadj_16D.html foo=foo %}

### Interpolate nodata considering seasonal signal

Run the process [<span class='package'>seasonfilltsSmap</span>](../../subprocess/subproc-seasonfilltssmap/) to interpolate the adjusted SMAP data considering the seasonal signal. All cells with enough valid observations will then have a full record of data (without nodata gaps) whereas all other cells will have only nodata.

{% capture foo %}{{page.SMAP-0330_interpolseasn-season_soil-moisture-wboadj_16D_2015-2019}}{% endcapture %}
{% include xml/SMAP-0330_interpolseasn-season_soil-moisture-wboadj_16D_2015-2019.html foo=foo %}

### Extract filled season

If you want to make sure that you have the best possible seasonal signal, rerun the process [<span class='package'>extractseasonsmap</span>](../../subprocess/subproc-extractseasonsmap/) using the interpolated time series data. As the seasonal signals produced here are used in other projects for adjusting soil moisture estimates from optical sensors, that might be a good idea.

{% capture foo %}{{page.SMAP-0320_extract-season_soil-moisture-fill-wboadj_16D}}{% endcapture %}
{% include xml/SMAP-0320_extract-season_soil-moisture-fill-wboadj_16D.html foo=foo %}
