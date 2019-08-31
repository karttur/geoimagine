---
layout: post
title: Copy and paste Karttur's GeoImagine Framework
modified: '2018-10-11 T18:17:25.000Z'
categories: setup
excerpt: "Copy and paste selected packages and modules of Karttur's GeoImagine Framework in Eclipse"
tags:
  - Copy and paste Karttur's GeoImagine Framework
  - Setup Karttur's GeoImagine Framework
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-11 T18:17:25.000Z'
comments: true
share: true
---

# Introduction

A PyDev project in <span class='app'>Eclipse</span> can be imported either as a complete project, or by building a backbone and copying and pasting selected parts. To setup Karttur's GeoImagine Framework you can use either method. This post describes how to setup a PyDev backbone and then add packages and modules by copy and paste. The [previous](../blog-import-project-eclipse/) post covers how to to import an entire PyDev project. Setting up the Python environment is covered in an [earlier](../setup-conda-environ/) post. If you have already finished  setting up the Framework, you can continue to the [next](../setup-xml/) post that describes the Framework key concepts and how to define processes and data.

# Prerequisites

To follow this post you must have the complete Spatial Data Integrated Development Environment (SPIDE) installed, including <span class='app'>Eclipse</span> set up for PyDev, <span class='app'>Anaconda</span> and <span class='app'>PostgreSQL</span>. How to do that is described in a separate blog: [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You need to install and setup all the parts in that blog, preferably using [Python3 and Anaconda3](https://karttur.github.io/setup-ide/blog/python3-upgrade/). How to create a customized virtual Python environment for Karttur's GeoImagine Framework within conda is described in a [previous](../setup-conda-environ/) post.

The rest of this post assumes that you have accomplished the installation of the SPIDE.

# Cloning Karttur's GeoImagine Framework

The core of Karttur's GeoImagine Framework is freely available at Github.com. To see which parts are available at any time, check the [GeoImagine Python Packages](https://karttur.github.io/geoimagine/packages/) page.

What packages you need depends on the kind of data you are going to process in the framework. In general you need all packages, but packages for specific data sources can be excluded. Data source specific packages include:

- [Landsat (geoimagine-landsat)](https://github.com/karttur/geoimagine-landsat)
- [MODIS (geoimagine-modis)](https://github.com/karttur/geoimagine-modis)
- [Sentinel (geoimagine-sentinel)](https://github.com/karttur/geoimagine-sentinel)
- [SMAP (geoimagine-smap)](https://github.com/karttur/geoimagine-smap)

Other spatial data sources are imported to the Framework using the [ancillary package](https://github.com/karttur/geoimagine-ancillary). Point data representing elevation and ground surveyed points or plots are imported separately (not yet available in the public version).

# Eclipse project

Compared to the [previous](../blog-import-project-eclipse/) post, where the PyDev project was imported to Eclipse, in this post you will add the packages you want to include one by one.

To do that, you must start by creating a new PyDev project in <span class='app'>Eclipse</span> as described in the blogpost [Setup Eclipse for PyDev](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/#create-pydev-project). Just create an empty PyDev project.

## Copy packages and modules

The easiest way to add the resources (packages and modules) that you require is to use a file explorer and drag and drop the packages you want to include into the <span class='app'>Eclipse</span> project  <span class='tab'>Navigation</span> pane.  You can also manually [create packages](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/#create-pydev-package) and then drag and drop the individual modules into that package. This gives you more control and you can skip some additional modules, for example the database modules (in the postgresdb package) that links to data sources that you are not interested in.

When saving or cloning, the package name is the same as the GitHub repository where it is stored, _WITH THE "geoimagine-" PART OMITTED._ Thus the package stored under the respository "geoimagine-setup_db" must be renamed as "setup_db" on your local system before you copy and paste them to your PyDev project.
