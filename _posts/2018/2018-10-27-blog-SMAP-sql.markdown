---
layout: post
title: SMAP SQL
modified: '2018-10-27 T18:17:25.000Z'
categories: blog
excerpt: "Explore and define SMAP layers with SQL"
tags:
  - SMAP

image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-27 T18:17:25.000Z'
comments: true
share: true

---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

The full SMAP products downloaded as described in the [previous](../blog-SMAP/) post, contain multiple layers. In Karttur´s GeoImagine Framework, the layers to extract (or explode) from the SMAP product zip files are defined in a template table in the database. This post describes how to alter the layers to explode by updating the database table _SMAP.template_.

## Prerequisites

Apart from having setup Karttur's GeoImagine Framework, including the SMAP package, you must also make have installed a [graphical interface for the postgreSQL database](https://karttur.github.io/setup-ide/setup-ide/install-postgres/).

# SQL commands

Open your graphical interface for postgres, and the page that allows you to write SQL commands. Write the following SQL to find out which layers are defined for retrieval in the SMAP template table (in the example for the product 'SPL3SMP-E' and the morning pass):

```
SELECT source,folder,band,hdfgrid,retrieve FROM SMAP.template WHERE product = 'SPL3SMP-E' AND folder = 'soil-moisture-am';
```

Update the table _SMAP.template_ for the layer(s) you want to retrieve:

```
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'radar-water-body-fraction';
UPDATE SMAP.template SET folder = 'water-body-fraction-am' WHERE product = 'SPL3SMP-E' AND band = 'radar-water-body-fraction';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'static-water-body-fraction';
UPDATE SMAP.template SET folder = 'water-body-fraction-am' WHERE product = 'SPL3SMP-E' AND band = 'static-water-body-fraction';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'freeze-thaw-fraction';
UPDATE SMAP.template SET folder = 'freeze-thaw-am' WHERE product = 'SPL3SMP-E' AND band = 'freeze-thaw-fraction';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'vegetation-water-content';
UPDATE SMAP.template SET folder = 'veg-water-am' WHERE product = 'SPL3SMP-E' AND band = 'vegetation-water-content';

UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'radar-water-body-fraction-pm';
UPDATE SMAP.template SET folder = 'water-body-fraction-pm' WHERE product = 'SPL3SMP-E' AND band = 'radar-water-body-fraction-pm';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'static-water-body-fraction-pm';
UPDATE SMAP.template SET folder = 'water-body-fraction-pm' WHERE product = 'SPL3SMP-E' AND band = 'static-water-body-fraction-pm';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'freeze-thaw-fraction-pm';
UPDATE SMAP.template SET folder = 'freeze-thaw-pm' WHERE product = 'SPL3SMP-E' AND band = 'freeze-thaw-fraction-pm';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP-E' AND band = 'vegetation-water-content-pm';
UPDATE SMAP.template SET folder = 'veg-water-pm' WHERE product = 'SPL3SMP-E' AND band = 'vegetation-water-content-pm';

UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'radar-water-body-fraction';
UPDATE SMAP.template SET folder = 'water-body-fraction-am' WHERE product = 'SPL3SMP' AND band = 'radar-water-body-fraction';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'static-water-body-fraction';
UPDATE SMAP.template SET folder = 'water-body-fraction-am' WHERE product = 'SPL3SMP' AND band = 'static-water-body-fraction';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'freeze-thaw-fraction';
UPDATE SMAP.template SET folder = 'freeze-thaw-am' WHERE product = 'SPL3SMP' AND band = 'freeze-thaw-fraction';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'vegetation-water-content';
UPDATE SMAP.template SET folder = 'veg-water-am' WHERE product = 'SPL3SMP' AND band = 'vegetation-water-content';

UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'radar-water-body-fraction-pm';
UPDATE SMAP.template SET folder = 'water-body-fraction-pm' WHERE product = 'SPL3SMP' AND band = 'radar-water-body-fraction-pm';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'static-water-body-fraction-pm';
UPDATE SMAP.template SET folder = 'water-body-fraction-pm' WHERE product = 'SPL3SMP' AND band = 'static-water-body-fraction-pm';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'freeze-thaw-fraction-pm';
UPDATE SMAP.template SET folder = 'freeze-thaw-pm' WHERE product = 'SPL3SMP' AND band = 'freeze-thaw-fraction-pm';
UPDATE SMAP.template SET retrieve = 'Y' WHERE product = 'SPL3SMP' AND band = 'vegetation-water-content-pm';
UPDATE SMAP.template SET folder = 'veg-water-pm' WHERE product = 'SPL3SMP' AND band = 'vegetation-water-content-pm';
```

Check layers that are retrieved:

```
﻿SELECT source,folder,band,hdfgrid,retrieve FROM SMAP.template WHERE product = 'SPL3SMP-E' AND retrieve = 'Y';
```

If you now run the process [<span class='package'>extractSmapHdf</span>](../../subprocess/subproc-extractsmaphdf/) as in the [SMAP processing](../blog-SMAP/) post, the layers with the _retrieve_ status set to _Y_ will be exploded.
