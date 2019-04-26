---
layout: post
title: Regions
modified: '2018-10-19 T18:17:25.000Z'
categories: blog
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
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

In Karttur's GeoImagine Framework all spatial data processing requires a pre-defined _region_. When you [setup the Framework database](../blog-setup-db/) the top region _globe_ was added to the system. All other regions are hierarchically defined starting from _globe_. In this post you will add pre-defined regions and create the links between regions and the two tiling systems used with the framework: _modis_ and _mgrs_.

# Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must also have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../blog-copy-project-eclipse/). You must also have setup the complete Framework database as described in of the [previous](../blog-setup-db/) posts.

How to run processes, including the setup described in this post, is covered in an [earlier](../blog-run/) post. The xml files required for running the processes described in the post are included in the [<span class='pacakge'>setup_processes</span>](https://github.com/karttur/geoimagine-setup_processes/) package. To understand the structure of the xml file you can read [this](../blog-xml/) post.

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
    Sentinel = True
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

<button id= "toggleregioncats" onclick="hiddencode('regioncats')">Hide/Show add_region_categories.xml</button>

<div id="regioncats" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<manageregion>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- Stratum 0 must be added prior to ading other region categroies-->
	<!-- Add region categories-->
	<processx processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'globe' stratum = '0' parentcat = 'self'>
			<title>Globe region</title>
			<label>The entire earth ball - parentid of all other regions</label>
		</parameters>
	</processx>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' stratum = '1' parentcat = 'globe'>
			<title>Global regions, apart from the earth itself </title>
			<label>Global regions include regions that cover more than one continent, usually girdling the Earth.</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'pancontinent' stratum = '2' parentcat = 'globe'>
			<title>Continental landmasses</title>
			<label>Pancontinental include Americas, Eurasia, Africa, Australia, Oceania and Antarctica.</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'panoceanic' stratum = '2' parentcat = 'globe'>
			<title>Panoceanic regions, covering more than one ocean</title>
			<label>Panoceanic regions include the Arctic, North Atlantic, Indian, Pacific and Antarctic oceans.</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'continent' stratum = '3' parentcat = 'pancontinent'>
			<title>The classical 7 continents</title>
			<label>Continental include North America, South America, Europe, Asia, Africa, Oceania and Antarctica</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'marinecontinent' stratum = '3' parentcat = 'globe'>
			<title>The classical 7 continents, including marine regions</title>
			<label>Marine Continental include North America, South America, Europe, Asia, Africa, Oceania and Antarctica</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'oceanic' stratum = '3' parentcat = 'panoceanic'>
			<title>Oceanic regions, covering more than one ocean</title>
			<label>Oceanic regions include the Arctic, North Atlantic, South Atlantic, Indian, North Pacific, South Pacific and Antarctic oceans .</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'subcontinent' stratum = '4' parentcat = 'continent'>
			<title>Regions with subcontinental coverage, covering more than one country</title>
			<label>Subcontinental regions cover arbitrary regions, defined by e.g. political, climatic or topographic conditions</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'marinesubcontinent' stratum = '4' parentcat = 'marinecontinent'>
			<title>Regions with subcontinental coverage, covering more than one country</title>
			<label>Subcontinental regions cover arbitrary regions, defined by e.g. political, climatic or topographic conditions</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'suboceanic' stratum = '4' parentcat = 'oceanic'>
			<title>Regions with suboceanic coverage, including enclosed seas</title>
			<label>Suboceanic regions cover both defined enclosed seas as well as other oceanic regions falling within a single of the seven classical oceans</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'basin' stratum = '5' parentcat = 'pancontinent'>
			<title>Regions with hydrological basin coverage</title>
			<label>The basin region category contains the worlds hydrological basins (watersheds)</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'subbasin' stratum = '6' parentcat = 'basin'>
			<title>Regions with hydrological subasin coverage</title>
			<label>The subbasin region category contains subbasins of basins (watersheds)</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'sovereign' stratum = '5' parentcat = 'globe'>
			<title>Sovereign (composite) nation states</title>
			<label>Sovereign (composite) nation states</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'country' stratum = '6' parentcat = 'sovereign'>
			<title>Country</title>
			<label>Country (usually with recognized iso-code)</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'marinecountry' stratum = '6' parentcat = 'globe'>
			<title>Country incl maritime area</title>
			<label>Country incl maritime area (usually with recognized iso-code)</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'continentcountry' stratum = '6' parentcat = 'subcontinent'>
			<title>Country, or part of country, falling within one of the classical 7 continents</title>
			<label>Transcontinental countries are split into parts</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'marinecontinentcountry' stratum = '6' parentcat = 'marinesubcontinent'>
			<title>Country, or part of country, falling within one of the classical 7 continents</title>
			<label>Transcontinental countries are split into parts</label>
		</parameters>
	</process>


	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'state' stratum = '7' parentcat = 'country'>
			<title>State</title>
			<label>State as part of a country (countries with no states are set to country = state)</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'province' stratum = '8' parentcat = 'state'>
			<title>Province within a country</title>
			<label>Provinces as part of a state</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'district' stratum = '9' parentcat = 'province'>
			<title>District within Province</title>
			<label>District is an arbitrary political division used for designating regions within a province</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'community' stratum = '10' parentcat = 'district'>
			<title>Community within dstrict</title>
			<label>Community is an arbitrary political division used for designating regions within a district</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'quarter' stratum = '11' parentcat = 'community'>
			<title>Quarter within community</title>
			<label>Quarter is an arbitrary division used for designating regions within a community</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'domain' stratum = '12' parentcat = '*'>
			<title>Arbitrary spatial extent having any region of categories 0 to 11 as parentid</title>
			<label>User defined but public region definition</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'tract' stratum = '12' parentcat = '*'>
			<title>Tract is a user defined region category (private or public) and can have any region of categories 0 to 11 as parentid</title>
			<label>Tract is arbitrary defined by users, and can be kept private or made available for public use</label>
		</parameters>
	</process>

	<process processid ='regioncategories'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'site' stratum = '13' parentcat = 'tract'>
			<title>Site is a user defined region category having tract as parentid</title>
			<label>Site is arbitrary defined by users</label>
		</parameters>
	</process>

</manageregion>

```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

the above xml file is included in <span class='file'>regions_karttur_setup_20181116.txt</span>, and if you set _DefaultRegions_ to _True_ in the main section on <span class='file'>setup_process_regions.py</span> (hidden above) and run the script, you will add the default region categories to the Framework.

# Adding default regions

Default regions (at stratum 1 to 11) can be added using either a rectangular area defined from the corner points or from existing polygons. The Framework comes with two types of default regions: arbitrary (rectangular) default regions, and the world's continents and countries in two different formats (bounded by the land-sea and including marine areas). If you run the module <span class='file'>setup_process_regions.py</span> with _DefaultRegions_ set to _True_ all the default arbitrary regions as well as both formats of global continents and countries are added.

## Arbitrary default regions

The Framework comes with the option to define a number of (arbitrary) default regions, including for tropical, subtropical, temperate and arctic regions. You do not need to add these regions unless you intend to work with them.

The pre-defined arbitrary regions also include a special region, __trmm__, that coincide with the global rainfall estimates from the Tropical Rainfall Measusrement Missions (TRMM) mission. If you intend to use the TRMM rainfall data, please make sure that you add the __trmm__ region.

All the arbitrary regions are defined from corner coordinates and are added to the Framework with the process [<span class='package'>defaultregion</span>](../../subprocess/subproc-defaultregion/).

<button id= "toggledefaultregions" onclick="hiddencode('defaultregions')">Hide/Show add_arbitrary_default_regions_v80.xml</button>

<div id="defaultregions" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<period timestep = 'static'></period>

	<!-- Add default region globall (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'global' regionname = 'Global'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-90' maxlon = '180' maxlat = '90' epsg = '4326' version = '1'>
			<title>Global region</title>
			<label>Global region</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			 <roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region tropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'globaltropics' regionname = 'Globaltropics'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-23.43705' maxlon = '180' maxlat = '23.43705' epsg = '4326' version = '1'>
			<title>Global tropical region</title>
			<label>Region between the tropics</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			 <roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region northtropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'northtropical' regionname = 'North Tropical zones'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '0' maxlon = '180' maxlat = '23.43705' epsg = '4326' version = '1'>
			<title>Global norhtern tropical region</title>
			<label>Region between the equator and north 23.5 degrees</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default southtropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'southtropical' regionname = 'South Tropical zones'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-23.43705' maxlon = '180' maxlat = '0' epsg = '4326' version = '1'>
			<title>Global southern tropical region</title>
			<label>Region between the equator and south 23.5 degrees</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region norhtsubtropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'northsubtropical' regionname = 'North Subtropical zone'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '23.43705' maxlon = '180' maxlat = '40' epsg = '4326' version = '1'>
			<title>Global northern subtropical region</title>
			<label>Region extending between the northern tropic (23.5 degrees) to 40 degrees north</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region southsubtropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'southsubtropical' regionname = 'South Subtropical zone'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-40' maxlon = '180' maxlat = '-23.43705' epsg = '4326' version = '1'>
			<title>Global northern subtropical region</title>
			<label>Region extending between the southern tropic (23.5 degrees) to 40 degrees south</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi  measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region pantropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'pantropical' regionname = 'Global Pantropical zone'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-40' maxlon = '180' maxlat = '40' epsg = '4326' version = '1'>
			<title>Global panropical region</title>
			<label>Region including the tropics and subtropics (between 40 degrees north and south)</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region trmmtropical (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'trmm' regionname = 'TRMM tropical zone'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-50' maxlon = '180' maxlat = '50' epsg = '4326' version = '1'>
			<title>TRMM precipitation coverage region</title>
			<label>Region for the TRMM data products</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			 <roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region northtemperate (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'northtemperate' regionname = 'North Temperate zone'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '40' maxlon = '180' maxlat = '66.565325' epsg = '4326' version = '1'>
			<title>Global northern temperate zone</title>
			<label>Region extending between 40 degrees north and the arctic circles (66.5 degrees)</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>

	</process>

	<!-- Add default region southtemperate (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'southtemperate' regionname = 'South Temperate zone'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-66.565325' maxlon = '180' maxlat = '-40' epsg = '4326' version = '1'>
			<title>Global southern temperate zone</title>
			<label>Region extending between 40 degrees south and the antarctic circles (66.5 degrees)</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region arctic (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'arctic' regionname = 'Arctic'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '66.565325' maxlon = '180' maxlat = '90' epsg = '4326' version = '1'>
			<title>Global arctic zone</title>
			<label>Region extending from the arctic circles (66.5 degrees) to the North Pole</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi  measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>

	<!-- Add default region arctic (global)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'global' regionid = 'antarctic' regionname = 'Antarctic'  parentid = 'globe' parentcat = 'globe' stratum = '1' minlon = '-180' minlat = '-90' maxlon = '180' maxlat = '-66.565325' epsg = '4326' version = '1'>
			<title>Global antarctic zone</title>
			<label>Region extending from the antarctic circles (66.5 degrees) to the South Pole</label>
		</parameters>
		<dstpath volume = 'OPUS' ></dstpath>
		<dstcomp>
			<roi measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>
</manageprocess>

```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

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

<button id= "toggleimport" onclick="hiddencode('import')">Hide/Show ancillary-import-kartturROI_2014.xml</button>

<div id="import" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' system = 'ancillary'></userproj>
	<period startyear = "2014" endyear = "2014" timestep='singleyear'></period>

	<process processid ='organizeancillary'>
		<parameters importdef='shp'
			epsg = '4326'
			instid = 'karttur'
			dsname = 'globalROI'
			source = 'karttur'
			dsversion = "1.0"
			accessdate = "20170320"
			regionid = 'globe'
			regioncat = 'globe'
			datadir ='worldclim'
			datafile=''
			metapath =""
			dataurl = ""
			metaurl=""
			title = "Global default regions"
			label = "Global default regions based on countries and continents"
			replacestr = ''
			replacetag = ''
		> </parameters>

		<srcpath volume = "OPUS/ANCILIMPORT" hdrfiletype = "shp" datfiletype = ""></srcpath>
		<dstpath volume = "OPUS" hdrfiletype = "shp" datfiletype = ""></dstpath>

		<srcraw id='country'
			datadir ='karttur/political'
			datafile = "countries_karttur_global_2014"
			datalayer = "countries"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>
			<country masked='Y'  measure = "N" source = "karttur" product = "karttur"
			     folder = 'defaultregions' band = "country" prefix = "country" suffix = "0"
			     scalefac = "1" offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</country>
		</dstcomp>


		<srcraw id='country-continent'
			datadir ='karttur/political'
			datafile = "countries-continents_karttur_global_2014"
			datalayer = "countries-continents"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>
			<country-continent masked='Y' measure = "N" source = "karttur" product = "karttur"
					   folder = 'defaultregions' band = "country-continent"
					   prefix = "country-continent" suffix = "0" scalefac = "1"
					   offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</country-continent>
		</dstcomp>

		<srcraw id ='continent-subregions'
			datadir ='karttur/subregions'
			datafile = "continent-subregions_karttur_global_2014"
			datalayer = "continent-subregions"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>
			 <continent-subregions masked='Y' measure = "N" source = "karttur" product = "karttur"
					       folder = 'defaultregions' band = "continent-subregions"
					       prefix = "continent-subregions" suffix = "0" scalefac = "1"
					       offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</continent-subregions>
		</dstcomp>
		<srcraw id='continents'
			datadir ='karttur/continents'
			datafile = "continents_karttur_global_2014"
			datalayer = "continents"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>
			<continents masked='Y' measure = "N" source = "karttur" product = "karttur"  folder = 'defaultregions'
			 band = "continents" prefix = "continents" suffix = "0" scalefac = "1"
			 offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</continents>
		</dstcomp>

		<srcraw id='marine-countries'
			datadir ='karttur/marinecountries'
			datafile = "marine-countries_karttur_2014"
			datalayer = "marine-countries"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>

			<marine-countries masked='Y' measure = "N" source = "karttur" product = "karttur"  folder = 'defaultregions'
			 band = "marine-countries" prefix = "marine-countries" suffix = "0"
			 scalefac = "1" offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</marine-countries>

		</dstcomp>

		<srcraw id='marine-continent-countries'
			datadir ='karttur/marinecountries'
			datafile = "marine-continent-countries_karttur_2014"
			datalayer = "marine-continent-countries"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>
			 <marine-continent-countries masked='Y' measure = "N" source = "karttur" product = "karttur"
						     folder = 'defaultregions' band = "marine-continent-countries"
						     prefix = "marine-continent-countries" suffix = "0" scalefac = "1"
						     offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</marine-continent-countries>
		</dstcomp>

		<srcraw id="marine-continent-subregions"
			datadir ='karttur/marinesubregions'
			datafile = "marine-continent-subregions_karttur_2014"
			datalayer = "marine-continent-subregions"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>

			<marine-continent-subregions masked='Y' measure = "N" source = "karttur" product = "karttur"
			 folder = 'defaultregions' band = "marine-continent-subregions"
			 prefix = "marine-continent-subregions" suffix = "0"
			 scalefac = "1" offsetadd = "0" dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</marine-continent-subregions>
		</dstcomp>

		<srcraw id="marine-continents"
			datadir ='karttur/marinecontinents'
			datafile = "marine-continents_karttur_2014"
			datalayer = "marine-continents"
			measure = "N"
			dsversion = "2014"
			accessdate = "20170403"
			product = 'karttur'
			theme = "roi"
			subtheme = "defaultregion"
			copyright = ""
			dataurl = ""
			metapath =""
			metaurl=""
			title = "Global countries (with iso-codes)"
			label = "Cleaned vectors from ShareGeo representing global countries for 2014"
		></srcraw>
		<dstcomp>
			<marine-continents masked='Y' measure = "N" source = "karttur" product = "karttur"
			 folder = 'defaultregions' band = "marine-continents"
			 prefix = "marine-continents" suffix = "0" scalefac = "1" offsetadd = "0"
			 dataunit = "boundary" celltype = 'vector' cellnull = '-32768'>
			</marine-continents>

		</dstcomp>

	</process>
</organize>

```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Regions from vectors

With the polygon data imported, you can convert the content to default regions with the process [<span class='package'>defaultregionfromvector</span>](../../subprocess/subproc-defaultregionfromvector/). In order for that to work, the attribute table of the polygons must contain the following pre-defined columns:

- name
- category
- parentid
- parentcat

<button id= "toggledefaultregionfromvector" onclick="hiddencode('defaultregionfromvector')">Hide/Show add_default_regions_from-vector.xml</button>

<div id="defaultregionfromvector" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = '2014' endyear = '2014' timestep='singleyear'></period>


	<!-- For a region to be added, the category, the parentid category and the explicit parentid must all exist-->

	<!-- Add contient regions from shape file-->
	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'NAME' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>NAME</titlecol>
			<labelcol>CATEGORY</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<continents source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "continents" prefix = "continents" suffix = "0"></continents>
		</srccomp>
		<dstcopy srccomp='continents' band='continents'></dstcopy>
	</process>

	<!-- Add continent-subregions from shape file-->
	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'NAME' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>NAME</titlecol>
			<labelcol>CATEGORY</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<continent-subregions source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "continent-subregions" prefix = "continent-subregions" suffix = "0"></continent-subregions>
		</srccomp>
		<dstcopy srccomp='continent-subregions' band='continent-subregions'></dstcopy>

	</process>

	<!-- Add country regions from shape file (globe as parentid so OK)-->
	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'ISO_A2' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>FORMALNAME</titlecol>
			<labelcol>TYPE</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<country source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "country" prefix = "country" suffix = "0"></country>
		</srccomp>
		<dstcopy srccomp='country' band='country'></dstcopy>


	</process>

	<!-- Add country-continent from shape file-->
	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'CODE' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>FORMALNAME</titlecol>
			<labelcol>TYPE</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<country-continent source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "country-continent" prefix = "country-continent" suffix = "0"></country-continent>
		</srccomp>
		<dstcopy srccomp='country-continent' band='country-continent'></dstcopy>

	</process>

	<!-- Marine countries and continents-->
	<!-- Add regions from shape file-->

	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'NAME' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>NAME</titlecol>
			<labelcol>CATEGORY</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<marine-continents source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "marine-continents" prefix = "marine-continents" suffix = "0"></marine-continents>
		</srccomp>
		<dstcopy srccomp='marine-continents' band='marine-continents'></dstcopy>
	</process>

	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'NAME' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>NAME</titlecol>
			<labelcol>CATEGORY</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<marine-continent-subregions source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "marine-continent-subregions" prefix = "marine-continent-subregions" suffix = "0"></marine-continent-subregions>
		</srccomp>
		<dstcopy srccomp='marine-continent-subregions' band='marine-continent-subregions'></dstcopy>
	</process>

	<!-- Add regions from shape file-->
	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'CODE' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>FORMALNAME</titlecol>
			<labelcol>TYPE</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<marine-countries source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "marine-countries" prefix = "marine-countries" suffix = "0"></marine-countries>
		</srccomp>
		<dstcopy srccomp='marine-countries' band='marine-countries'></dstcopy>
	</process>

	<!-- Add regions from shape file-->
	<process processid ='defaultregionfromvector'>
		<parameters idcol = 'CODE' namecol = 'NAME' categorycol ='CATEGORY' parentidcol = 'PARENTNAME' parentcatcol = 'PARENTCAT'  stratumcol = 'STRATUM' version = 'kt1' epsg = '4326' >
			<titlecol>FORMALNAME</titlecol>
			<labelcol>TYPE</labelcol>
		</parameters>
		<srcpath volume = "OPUS"></srcpath>
		<dstpath volume = "OPUS"></dstpath>
		<srccomp>
			<marine-continent-countries source = "karttur" product = "karttur" folder = 'defaultregions'
			     band = "marine-continent-countries" prefix = "marine-continent-countries" suffix = "0"></marine-continent-countries>
		</srccomp>
		<dstcopy srccomp='marine-contient-countries' band='marine-continent-countries'></dstcopy>
	</process>

</manageprocess>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

# Adding default system layers and data

The module <span class='file'>setup_process_regions.py</span> also contains options for installing and defining system layers and data, including for:

- MODIS
- Landsat
- Sentinel
- Ancillary
- Climate

In the main section of <span class='file'>setup_process_regions.py</span>, change the boolean variable defining whether to install the feature you are interested to _True_ and run the module.

If you intend to use the Framework for calculations with any satellite data, you need to setup either the MODIS or Sentinel systems (or both).
