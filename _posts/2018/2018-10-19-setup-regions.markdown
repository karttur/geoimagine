---
layout: post
title: Regions
modified: '2018-10-19 T18:17:25.000Z'
categories: setup
excerpt: "Setup the regions for Karttur's GeoImagine Framework"
tags:
 - defaultregionfromvector
 - regioncategories
 - defaultregion
 - organizeancillary
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-19 T18:17:25.000Z'
comments: true
share: true

add_arbitrary_default_regions_v80: add_arbitrary_default_regions_v80
add_default_regions_from-vector_v80: add_default_regions_from-vector_v80
add_region_categories_v80: add_region_categories_v80
ancillary-import-USGS-WRS: ancillary-import-USGS-WRS
ancillary-import-kartturROI_2014: ancillary-import-kartturROI_2014

---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

In Karttur's GeoImagine Framework all spatial data processing requires a pre-defined _region_. When you [setup the Framework database](../setup-db/) the top region _globe_ was added to the system. All other regions are hierarchically defined starting from _globe_. In this post you will add pre-defined regions and create the links between regions and the two tiling systems used with the framework: _modis_ and _mgrs_.

# Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must also have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../setup-copy-project-eclipse/). You must also have setup the complete Framework database as described in of the [previous](../setup-db/) posts.

How to run processes, including the setup described in this post, is covered in an [earlier](../setup-run/) post. The xml files required for running the processes described in the post are included in the [<span class='pacakge'>setup_processes</span>](https://github.com/karttur/geoimagine-setup_processes/) package. To understand the structure of the xml file you can read [this](../setup-xml/) post.

If your PyDev project does not compile and stop because imports are not found, check which package that is lacking and use the post on [Additional packages](../blog-add-packages) for support on adding the missing package to you PyDev project.

# Python module

The setup of regions is done from the python module <span class='file'>setup_process_regions.py</span>. In the main section you can define which parts to install. If you want to change the region categories or default regions that are installed in more detail you need to edit the linked xml files.

<button id= "togglesetuptxt" onclick="hiddencode('setuptxt')">Hide/Show setup_process_regions.py (main section)</button>

<div id="setuptxt" style="display:none">

{% capture text-capture %}
{% raw %}
```
if __name__ == "__main__":
    '''
    '''
    DefaultRegions = True
    MODIS = False
    Landsat = False
    Sentinel = False
    Ancillary = False
    Climate = False
    verbose = True

    '''Link to project file that sets up default regions, arbitrary regions and special regions.
    '''
    if DefaultRegions:
        projFN = 'regions_karttur_setup_20181116.txt'
        Setup('regiondoc',projFN,verbose)

    if MODIS:
        '''Stand alone script that defines the MODIS tile coordinates'''

        FPN = ModisTileCoords()
        '''
        exitstr = 'The script ModisTileCoords() produced a shape with all MODIS SIN tiles projected to Geographic coordiantes.\n \
            Copy the shape data sourse: %(fpn)s,\n and edit the xml file for importing this layer.\n \
            Then comment out the "exit" command and re-run the module.' %{'fpn':FPN}
        exit(exitstr)
        '''
        projFN = 'modis_karttur_setup_20181116.txt'
        Setup('modisdoc',projFN,verbose)

    if Sentinel:
        '''Link to project file that sets up the Sentinel tiling system'''
        projFN = 'sentinel_karttur_setup_2018116.txt'
        Setup('sentineldoc',projFN,verbose)

    if Landsat:
        pass

    if MODIS and Sentinel:
        '''Stand alone script that links sentinel and modis, requires that all sentinel tiles are in the db'''
        LinkSentineModisTiles()

    if MODIS and Landsat:
        LinkLandsatModisTiles()

    if Sentinel and Landsat:
        LinkSentinelLandsatTiles()

    if Ancillary:
        ''' link to project file that imports default ancillary data'''
        projFN = 'ancillary_karttur_setup_20180221_0.txt'
        Setup('ancildoc',projFN,verbose)

    if Climate:
        ''' Climate data'''
        projFN = 'climate_karttur_setup_20181116.txt'
        Setup('climatedoc',projFN,verbose)

```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

# Region categories

As mentioned in the Introduction, the top region is predefined as the entire _globe_. In the Framework the _globe_ region belongs to the _stratum_ 0. _stratum_ 0 only contains this single region. To accommodate all other potential regions, the following hierarchical region categories are defined:

| Stratum | Name                   | Parent             |
|:--------|:-----------------------|:-------------------|
| 0       | globe                  | self               |
| 1       | global                 | globe              |
| 2       | pancontinent           | global             |
| 2       | panoceanic             | global             |
| 3       | continent              | pancontinent       |
| 3       | marinecontinent        | global             |
| 3       | oceanic                | panoceanic         |
| 4       | subcontinent           | continent          |
| 4       | marinesubcontinent     | marinecontinent    |
| 4       | suboceanic             | oceanic            |
| 5       | basin                  | pancontinent       |
| 6       | subbasin               | basin              |
| 5       | sovereign              | global             |
| 6       | country                | sovereign          |
| 6       | marinecountry          | global             |
| 6       | continentcountry       | subcontinent       |
| 6       | marinecontinentcountry | marinesubcontinent |
| 7       | state                  | country            |
| 8       | province               | state              |
| 9       | district               | province           |
| 10      | community              | district           |
| 11      | quarter                | community          |
| 12      | domain                 | any                |
| 12      | tract                  | any                |
| 13      | site                   | tract              |

While all processing is related to pre-defined regions at stratum 1 to 11, all user projects must be associated with a tract (stratum 12) that can be divided into sites (stratum 13). All tracts are associated with one (1), and only one, default region (at stratum 1 to 11).

Region categories are added to the Framework through the process [<span class='package'>regioncategories</span>](../../subprocess/subproc-regioncategories/). The xml file below adds all the categories listed above, and also outlines the differences between different categories.

{% capture foo %}{{page.add_region_categories_v80}}{% endcapture %}
{% include xml/add_region_categories_v80.html foo=foo %}

the above xml file is included in <span class='file'>regions_karttur_setup_20181116.txt</span>, and if you set _DefaultRegions_ to _True_ in the main section on <span class='file'>setup_process_regions.py</span> (hidden above) and run the script, you will add the default region categories to the Framework.

# Adding default regions

Default regions (at stratum 1 to 11) can be added using either a rectangular area defined from the corner points or from existing polygons. The Framework comes with two types of default regions: arbitrary (rectangular) default regions, and the world's continents and countries in two different formats (bounded by the land-sea and including marine areas). If you run the module <span class='file'>setup_process_regions.py</span> with _DefaultRegions_ set to _True_ all the default arbitrary regions as well as both formats of global continents and countries are added.

## Arbitrary default regions

The Framework comes with the option to define a number of (arbitrary) default regions, including for tropical, subtropical, temperate and arctic regions. You do not need to add these regions unless you intend to work with them.

The pre-defined arbitrary regions also include a special region, __trmm__, that coincide with the global rainfall estimates from the Tropical Rainfall Measusrement Missions (TRMM) mission. If you intend to use the TRMM rainfall data, please make sure that you add the __trmm__ region.

All the arbitrary regions are defined from corner coordinates and are added to the Framework with the process [<span class='package'>defaultregion</span>](../../subprocess/subproc-defaultregion/).

{% capture foo %}{{page.add_arbitrary_default_regions_v80}}{% endcapture %}
{% include xml/add_arbitrary_default_regions_v80.html foo=foo %}

## Global country datasets

The Framework contains cleaned and prepared datasets for:

- global countries (_country_)
- global countries per continent (_continentcountry_)
- continental sub-Regions (_subcontinent_)
- continents (_contient_)
- marine countries (_marinecountry_)
- marine continent countries (_marinecontinentcountry_)
- marine continents (_marinecontinent_)
- marine continent subregions (_marinesubcontinent_)

The first four are based on the 2014 national boundaries with polygons at high spatial resolution following the coastline. The last four "marine" versions include the maritime area. The latter polygons are thus guaranteed to contain all coastal and near-shore areas. Before converting the datasets to default regions you must import them as ancillary layers using the process [<span class='package'>organizeancillary</span>](../../subprocess/subproc-organizeancillary/).

{% capture foo %}{{page.ancillary-import-kartturROI_2014}}{% endcapture %}
{% include xml/ancillary-import-kartturROI_2014.html foo=foo %}

### Regions from vectors

With the polygon data imported, you can convert the content to default regions with the process [<span class='package'>defaultregionfromvector</span>](../../subprocess/subproc-defaultregionfromvector/). In order for that to work, the attribute table of the polygons must contain the following pre-defined columns:

- name
- category
- parentid
- parentcat

{% capture foo %}{{page.add_default_regions_from-vector_v80}}{% endcapture %}
{% include xml/add_default_regions_from-vector_v80.html foo=foo %}

# Adding default system layers and data

The module <span class='file'>setup_process_regions.py</span> also contains options for installing and defining system layers and data, including for:

- MODIS
- Landsat
- Sentinel
- Ancillary
- Climate

In the main section of <span class='file'>setup_process_regions.py</span>, change the boolean variable defining whether to install the feature you are interested to _True_ and run the module.

If you intend to use the Framework for calculations with any satellite data, you need to setup either the MODIS or Sentinel systems (or both).
