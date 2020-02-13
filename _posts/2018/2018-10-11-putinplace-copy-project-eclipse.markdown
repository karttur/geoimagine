---
layout: article
title: Copy and paste Karttur's GeoImagine Framework
categories: putinplace
excerpt: "Copy and paste selected packages and modules of Karttur's GeoImagine Framework in Eclipse"
previousurl: putinplace/clone-desktop-git
nexturl: prep/prep-dblink
tags:
  - Copy and paste Karttur's GeoImagine Framework
  - Setup Karttur's GeoImagine Framework
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-11 T18:17:25.000Z'
modified: '2018-10-11 T18:17:25.000Z'
comments: true
share: true
---

# Introduction

A local clone or copy of a PyDev project can be imported to <span class='app'>Eclipse</span> either as a complete project, or by building a backbone PyDev project and copying and pasting selected parts. To setup Karttur's GeoImagine Framework from a local clone you can use either method. This post describes how to setup a PyDev backbone and then add packages and modules by copy and paste. The post [Import Project to Eclipse](../putinplace-import-project-eclipse/) covers how to to import an entire PyDev project from a local clone.

The alternative is to clone the Framework directly from the repo on Karttur's GitHub pages as described in the post on [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git/).

# Prerequisites

To follow this post you must have cloned Karttur's GeoImagine Framework to your local machine. Described in the post on [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git).

# Cloning Karttur's GeoImagine Framework

The core of Karttur's GeoImagine Framework is freely available at Github.com. To see which parts are available at any time, check the [GeoImagine Python Packages](https://karttur.github.io/geoimagine/packages/) page.

What packages you need depends on the kind of data you are going to process in the framework. In general you need all packages, but packages for specific data sources can be excluded. Data source specific packages include:

- [Landsat (geoimagine-landsat)](https://github.com/karttur/geoimagine-landsat)
- [MODIS (geoimagine-modis)](https://github.com/karttur/geoimagine-modis)
- [Sentinel (geoimagine-sentinel)](https://github.com/karttur/geoimagine-sentinel)
- [SMAP (geoimagine-smap)](https://github.com/karttur/geoimagine-smap)

Most other spatial data sources are imported to the Framework using the [ancillary package](https://github.com/karttur/geoimagine-ancillary). Point data representing elevation and ground surveyed points or plots are imported separately (not yet available in the public version).

# Eclipse project

Compared to the post [Import Project to Eclipse](../putinplace-import-project-eclipse/), where the complete Framework PyDev project is imported to Eclipse, in this post you will add the packages you want to include one by one.

To do that, you must start by creating a new PyDev project in <span class='app'>Eclipse</span> as described in the blogpost [Setup Eclipse for PyDev](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/#create-pydev-project). Just create an empty PyDev project.

## Copy packages and modules

The easiest way to add the resources (packages and modules) that you require is to use a file explorer and drag and drop the packages you want to include into the <span class='app'>Eclipse</span> project  <span class='tab'>Navigation</span> pane.  You can also manually [create packages](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/#create-pydev-package) and then drag and drop the individual modules into that package. This gives you more control and you can skip some additional modules, for example the database modules (in the postgresdb package) that links to data sources that you are not interested in.

## Package naming

If you cloned Karttur's GeoImagine Framework as descried in the post [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git/) all the packages in your local clone will have the correct name. The repos actually holding the individual packages are all named with prefix "geoimagine" followed by a hyphen ("-") and then the actual name of the package. Thus, if you cloned or downloaded one of the submodules directly the naming is not correct. That is, however, easily fixed by removing the "geoimagine-" from the downloaded/cloned folder.
