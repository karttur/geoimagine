---
layout: post
title: The SMAP python package
modified: '2018-10-24 T18:17:25.000Z'
categories: blog
excerpt: "Set the SMAP template database table for products and layers."
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-24 T18:17:25.000Z'
comments: true
share: true
figure1: avg-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2A: ols-sl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2B: ts-mdsl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2C: ts-losl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2D: ts-hisl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
---

# Introduction

The layout package requires som additional conda installations.

- reportlab

conda install -c anaconda reportlab

(check online before installing).



The SMAP projection, I can not find a way to use GDAL command line for getting the data out properly. I thus used

hdf5_2_geotiff.py by ???

Install using

conda updata conda

conda install pyproj

The will downgrade gdallib from 2.2 to 1.11, whohc is unfortunate. Let me see if that has any consequences. Yes, gdal crashes, so I resinstall gdal, With

<>conda install gdal<>

At least the program compiled.

Then just copy hdf5_2_geotiff.py the the SMAP package.
