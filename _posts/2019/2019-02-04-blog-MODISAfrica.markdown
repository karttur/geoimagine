---
layout: post
title: "Africa water balance and soil moisture"
modified: '2019-02-03 20:17'
categories: blog
excerpt: Africa water balance and soil moisture"
tags:
  - vertical water balance
  - tile
  - mosaic
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2019-02-03 22:03'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

## Online resource

The project code and links, including the xml files are available under GitHub geoimagine-project.

# Create region

There is no initial default region that covers Africa south of the Sahara. To create a default region, login as superuser and define the corners of the default region in longitude and latitude. The parent region for Sub-Saharan Africa should be the African continent.

<button id= "toggledefaultregion" onclick="hiddencode('defaultregion')">Hide/Show regions-modtiles_v80.xml</button>

<div id="defaultregion" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<specialdefaultregions>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<period timestep = 'static'></period>

	<!-- Add default region africasubsahara (Africa)-->
	<process processid ='defaultregion'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters regioncat = 'subcontinent' regionid = 'africasubsahara' regionname = 'Africa South of Sahara'  parentid = 'Africa' parentcat = 'continent' stratum = '4'
		minlon = '-16.0' minlat = '-35.2' maxlon = '52' maxlat = '9.9999' epsg = '4326' version = '1'>
			<title>Sub-saharan Africa</title>
			<label>Africa South of the Sahara.</label>
		</parameters>
		<dstpath volume = 'karttur3tb' ></dstpath>
		<dstcomp>
			<roi  measure = 'N' source = 'karttur' product = 'karttur'  band = 'roi' prefix = 'roi'></roi>
		</dstcomp>
	</process>
</specialdefaultregions>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

At present you have to create the default region from the <span class='package'>setup_processes</span> package. To access the xml file above, either create a direct link to the xml file, or add it to the existing text file linking other xml command files.

## Link MODIS tiles

The xml below identifies all MODIS SIN tiles that overlap with the African Sub-Sahara region defined in the xml above. The process <span class='package'>LinkDefaultRegionsToMODIS</span> by default identifies all MODIS tiles for all regions. But if you set _overwrite_ = _False_ (the default setting) only default regions that do not have any identified MODIS tiles are tested. The source composition (\<srccomp\>) defined in the xml is for the shape file with the MODIS tiles as polygons. If your Framework lack the MODIS tiles, you need to setup the regions, including the MODIS tiling system as described in [this](../blog-setup-regions/) post.

<button id= "togglelinkmodis" onclick="hiddencode('linkmodis')">Hide/Show regions-modtiles_v80.xml</button>

<div id="linkmodis" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<regionsmodis>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period timestep='static'></period>

	<process processid ='LinkDefaultRegionsToMODIS' version = '3.0'>
		<parameters> </parameters>
		<overwrite>N</overwrite>
		<srcpath volume = "karttur3tb" hdrfiletype = "shp" datfiletype = "shp"></srcpath>
	    <srccomp>
	    	<modtiles source = "karttur" product = "modtiles" folder = "tiles" band = "modtiles" prefix = "modtiles" suffix = "lonlat">
			</modtiles>
	    </srccomp>
	</process>

</regionsmodis>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

You can check directly after the script finishes for the MODIS tiles linked to the region _africasubsahara_. Open the postgreSQL Graphical User Interface (GUI) and the production database, and then type the SQL command:

```
SELECT * FROM modis.regions where regionid = 'africasubsahara'
```

If you followed followed Karttur´s [installation guide for postgres](https://karttur.github.io/setup-ide/setup-ide/install-postgres/), you should have a GUI for postgres installed.

## Create user tract for Sub-Saharan Africa

The Framework is built in such a way that no user, including the super users, can use default regions for actual data processing. All processing can only be done vis-a-vis regions that are owned by the logged in user. Thus you have to create user regions (called "tracts") that correspond to the default regions that you created above.

<button id= "togglecreatedefregproj" onclick="hiddencode('defregproj')">Hide/Show add_user_projects-regions_africa-sub-sahara.xml</button>

<div id="defregproj" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>

	<!-- Manage user project -->
	<process processid ='ManageDefRegProj'>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<parameters defaultregion = 'africasubsahara'
		tractid = 'karttur-africasubsahara'
		tractname = 'karttur africasubsahara'
		projid = 'karttur-africasubsahara'
		projname = 'karttur africasubsahara'>
		<tracttitle>Karttur africasubsahara</tracttitle>
		<tractlabel>Karttur africasubsahara</tractlabel>
		<projtitle>Karttur africasubsahara</projtitle>
		<projlabel>Karttur africasubsahara</projlabel>
		</parameters>
	</process>

</manageprocess>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Explore MODIS Data Pool

Before downloading and processing any MODIS data you can update the Framework database on MODIS tiles available for download by running the process <span class='package'>searchDataPool</span>.

<button id= "toggledsearchDP" onclick="hiddencode('searchDP')">Hide/Show modis-search_data-pool.xml</button>

<div id="searchDP" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<searchdatapool>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2018' endyear = '2019' timestep='8D'></period>
	<process processid ='searchDataPool' dsversion = '1.3'>
		<parameters product="MCD43A4" version="006" serverurl="http://e4ftl01.cr.usgs.gov" ></parameters>
		<dstpath volume = "Karttur3tb" mainpath = "/Volumes/karttur3tb"></dstpath>
	</process>
</searchdatapool>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

In the example above the MODIS data holdings are updated for 2018 and 2019. If any additional data is found, it will be under the sub-folder <span class='file'>/Volumes/"volume"/DataPoolModis/</span> (where "volume" is the path given in the xml file).

## Transfer MDOIS tile to local db

If you identified any additional MODIS tiles in the previous step, you need to add them to the local postgres database. The process <span class='package'>ModisSearchToDB</span> will do that:

<button id= "toggletransfer" onclick="hiddencode('transfer')">Hide/Show modis-search_todb.xml</button>

<div id="transfer" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<searchtodb>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2018' endyear = '2019' timestep='8D'></period>
	<process processid ='ModisSearchToDB' dsversion = '1.3'>
		<parameters product="MCD43A4" version="006"></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
	</process>
</searchtodb>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Download MODIS tiles

The process for actually downloading regional MODIS tiles from the [DataPool](https://lpdaac.usgs.gov/data_access/data_pool) is <span class='package'>downloadModisRegionTiles</span>. By default the process only downloads tiles that are not registered as downloaded in the local database. If, ofr some reason, you want to download also tiles registered as already downloaded you set the parameter _downloaded_ to _True_. If the tile is already in the \<dstpath\> the process will not download the tile (even if _downloaded_ is set to _True_), unless _\<overwrite\>_ is set to _True_.

<button id= "toggledownload" onclick="hiddencode('download')">Hide/Show modis_downloaddatapool_v80.xml</button>

<div id="download" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<downloadMODIS>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2019" timestep='16D'></period>
	<process processid ='downloadModisRegionTiles' version = '1.3'>
		<parameters remoteuser= 'EarthDataLogin' product='MCD43A4' version='006' asscript='True'> </parameters>
		<dstpath volume = "karttur3tb/DataPoolModis"></dstpath>
    </process>
</downloadMODIS>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

In the above example the parameter _asscript_ is set to _True_ (= default, only set for clarity) and you can run the download script (reported when the script ends) from any machine. Just copy the script and change the local paths in the script. Remember that you must convert the shell script file to be executable before you can actually run it:

<span class='terminal'>$ chmod 777 /path/to/MCD43A4-karttur-africasubsahara.sh</span>

You need to make sure that your login credentials to the DataPool are correctly given on the machine you are using for the download (as explained in [this](https://karttur.github.io/setup-ide/setup-ide/connect-with-psycopg2/) post).

## Register downloaded tiles

If you set the download parameter _asscript_ to _True_ the MODIS tiles are both downloaded and registered in the local database on the fly. By default, however, the download is done via a shell script file and you must register the downloaded tiles by rerunning the process <span class='package'>downloadModisRegionTiles</span>.

Alternatively you can run the process <span class='package'>CheckMODISRegion</span> that by default checks both for downloaded and exploded tiles. You can turn off the checking of either by setting the parameters _checkdownloaded_ or _checkexploded_ to False. If you set both to False the script will report an error as there is nothing to check.

While the process <span class='package'>downloadModisRegionTiles</span> identifies tiles (<span class='file'>.hdf</span>) from the database, the process <span class='package'>downloadModisRegionTiles</span> searches the folder tree for <span class='file'>.hdf</span> files. The former is process is thus faster as it i) retrieves the tiles from the database, and ii) does not have to clean the identified tiles to fit the set timestep.  

<button id= "togglecheck" onclick="hiddencode('checkdownload')">Hide/Show modis_checktiles_downloaded_v80.xml</button>

<div id="checkdownload" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<checkMODIS>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2019" timestep='16D'></period>

	<process processid ='CheckMODISRegion' version = '1.3'>
		<parameters product='MCD43A4' version='006' checkexploded='False'> </parameters>
		<srcpath volume = "MJWEB/DataPoolModis"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
    </process>

</checkMODIS>
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Explode tile layers

The downloaded MODIS tiles come as <span class='file'>.hdf</span> files. The Framework can access this format, but only as a complete file (not as sequences of smaller buffers), and to processes MODIS data you need to explode (or extract) the bands (or layers) that you wish to use. Which bands to extract from each MODIS product is hardcoded in the postgres database, in the table _modis.template_. To see which bands to exctrat, and the default folder and layer name, use the postgreSQL GUI, e.g.:

```
SELECT * FROM modis.template WHERE source = 'MCD43A4v006';
```

The xml file command below explodes all tiles from the MODIS product MCD34A4 (version 006) over Sub-Saharan Africa fulfilling the period criteria. The default is again that the explosion is done _asscript_ (but I also added it explicitly for clarity in the example below):

<button id= "toggleexplode" onclick="hiddencode('expload')">Hide/Show modis_checktiles_exploaded_v80.xml</button>

<div id="expload" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<checkMODIS>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2019" timestep='16D'></period>
	<process processid ='ExplodeMODISRegion' dsversion = '1.3'>
		<parameters product='MCD43A4' version='006' asscript='True'></parameters>
		<srcpath volume = "karttur3tb/DataPoolModis"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
    </process>
</checkMODIS>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Register exploded files

If you set the parameter _asscript_ to _False_, the process <span class='package'>ExplodeMODISRegion</span> explodes and registers the layers on the fly, and then also updates the tiles table to state that the tile is exploded (after all requested layers belonging to that tile are exploded). If you do not set the parameter _asscript_, or set it to _False_, you have to either rerun the process <span class='package'>ExplodeMODISRegion</span>, or run the process <span class='package'>CheckMODISRegion</span>.

In the latter case you should set the parameter _checkdownload_ to _False_. If you leave both _checkdownloaded_ and _checkexploded_ to _True_, the process will first look for downloaded (<span class='file'>.hdf</span>) files, and then look for corresponding layer files (i.e. <span class='file'>.tif</span> files). If you set _checkdownloaded_ to _False_ the process will instead search for all <span class='file'>.tif</span> files falling inside the region and period defined. If you think that you have unregistered tiles (<span class='file'>.hdf</span>) as well as unregistered layers (<span class='file'>.hdf</span>) you should run the process twice, with _checkdownloaded_ set to to _True_ the first time and _False_ the second time. It is, however, much faster to rerun the process <span class='package'>ExplodeMODISRegion</span>, and if your database and datafile organization is flawless, that is the preferred option.

<button id= "togglecheckexplode" onclick="hiddencode('checkexpload')">Hide/Show modis_checktiles_exploaded_v80.xml</button>

<div id="checkexpload" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<checkMODIS>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2019" timestep='16D'></period>

	<process processid ='CheckMODISRegion' version = '1.3'>
		<parameters product='MCD43A4' version='006' checkdownloaded='False'> </parameters>
		<srcpath volume = "MJWEB/DataPoolModis"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
    </process>

</checkMODIS>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>


## Tile Ancillary data to Sub Saharan Africa

With the MODIS derived data organized into tiles, you need to convert other data into the same tiling system.

### TRMM

The Tropical Rainfall Measurement Mission (TRMM) data is at 0.25 degrees spatial resolution and extends between 50 degrees latitudes. For this project you are going to use the monthly TRMM product that is created using a range of satellite data and supported by ground observed preciptation (product 3B43). The temporal availability of the TRMM 3B43 is from to November 2018.

In a [previous post on TRMM]() the data is both cleaned, filled and masked to include only land. The xml file below tiles the monthly data to all MODIS tiles covered by the region "karttur-africasubsahara". The spatial resolution of the destinations tiles equals the resolutions of the MODIS product MCD43A4 (463 m)

<button id= "toggleTRMMtileM" onclick="hiddencode('TRMMtileM')">Hide/Show TRMMtileM.xml</button>

<div id="TRMMtileM" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<subsahara>

	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '463.313'  yres = '463.313' resample='near' asscript='True'></parameters>
		<srcpath volume = "Pegasus6"></srcpath>
		<dstpath volume = "TILES"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</subsahara>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

With the parameter _asscript_ set to _True_ you need to run the shell script fine reported when the process ends. And then rerun the same xml command to register the tiles in the database.

The spatial resolution of the TRMM tiles created from the xml above (463) is artificially high. It will only be used for cell by cell correlation with soil moisture derived from the MODIS product MCD43A4. The original TRMM data is in 0.25 degrees spatial resolution, which approximately translates to 28 km. The xml below creates the same tiles as the xml above, but at a spatial resolution of 27798.78 m. This odd number translates into exactly 40 columns and 40 rows for each MODIS tile. When you later create a mosaic and projects that mosaic back to Geographic coordinates you will see that the data exactly fits the original TRMM.

<button id= "toggleTRMMtile30km" onclick="hiddencode('TRMMtile30km')">Hide/Show TRMMtile30km.xml</button>

<div id="TRMMtile30km" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<subsahara>

	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

  <process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '27798.78'  yres = '27798.78' resample='near' asscript='True' suffix = 'v7-f-m-30km'></parameters>
		<srcpath volume = "Pegasus6"></srcpath>
		<dstpath volume = "TILES"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</subsahara>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

To compare TRMM with GRACE data wee need to create a third version of the TRMM tiles, in approximately 1 degree resolutions. That translates to a spatial resolution of 111195.12 (or 10 rows and 10 lines for each modis tile). As this tiling reduces the spatial resolution, you should set the parameter _resample_ to _average_.

<button id= "toggleTRMMtile1deg" onclick="hiddencode('TRMMtile1deg')">Hide/Show TRMMtile1deg.xml</button>

<div id="TRMMtile1deg" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<subsahara>

	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

  <process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '111195.12'  yres = '111195.12' resample='near' asscript='True' suffix = 'v7-f-m-1deg'></parameters>
		<srcpath volume = "Pegasus6"></srcpath>
		<dstpath volume = "TILES"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</subsahara>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

You can run all the three tiling processes together, but you must then set the parameter _asscript_ to _False_ and run all tiling on the fly.

<button id= "toggleTRMMtileAllM" onclick="hiddencode('TRMMtileAllM')">Hide/Show FAOrefet011.xml</button>

<div id="TRMMtileAllM" style="display:none">

{% capture text-capture %}
{% raw %}
```
<?xml version='1.0' encoding='utf-8'?>
<subsahara>

	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2018" endmonth ='7' endday = '31' timestep='M'></period>

	<!-- tile the original (monthly) TRMM data to the region (karttur-africasubsahara).
		The TRMM data must be downloaded and organized
		If you set the parameter "asscript" to True (= default),
		you have to execute the shell script file as reported by the process,
		and then rerun the xml with overwrite set to False to add the layers to the database
	-->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '463.313'  yres = '463.313' resample='near' asscript='False'></parameters>
		<srcpath volume = "Pegasus6"></srcpath>
		<dstpath volume = "TILES"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>

	<!-- The second process below tiles the same data, but at a spatial resolution of 27798.78 m -->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '27798.78'  yres = '27798.78' resample='near' asscript='False' suffix = 'v7-f-m-30km'></parameters>
		<srcpath volume = "Pegasus6"></srcpath>
		<dstpath volume = "TILES"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>

	<!-- The third process below tiles the same data, but at a spatial resolution of approx 1 deg (111195.12)  -->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '111195.12'  yres = '111195.12' resample='average' asscript='False' suffix = 'v7-f-m-1deg'></parameters>
		<srcpath volume = "Pegasus6"></srcpath>
		<dstpath volume = "TILES"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>

</subsahara>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

One of the ideas with the Framework is that processing should not be redundant. For Ancillary time-series data all time-series processing should be done using the original (system:ancillary) rather than the tiled (system:modis or mgrs) data. The TRMM time series analysis should hence be done in _system_ = _ancillary_ and any statistical, trend or model results transferred using tiling (rather than processing at the tile level). The xml below tiles the TRMM time-series data to all tiles included in the default region "africasubsahara" (the region on which the tract "karttur-africasubsahara" is built).

<button id= "toggleTRMMtileA" onclick="hiddencode('TRMMtileA')">Hide/Show FAOrefet010_convert_daytomonth.xml</button>

<div id="TRMMtileA" style="display:none">

{% capture text-capture %}
{% raw %}

```
<okadeltaproject>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "1998" endyear = "2017" timestep='timespan-A'></period>

	<!-- Tile statistical TRMM data to the region (karttur-okadelta)
	The TRMM data must be processed
	If you set the parameter "asscript" to True (= default),
	you have to execute the shell script file as reorted by the processor,
	and then rerun the xml with overwrite set to False to add the layers to the database
	-->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '27798.78'  yres = '27798.78' resample='near' asscript='N' suffix = 'v7-f-A-30km'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<avg-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "avg-trmm-3b43v7-precip" prefix = "avg-trmm-3b43v7-precip" suffix = "v7-f-A">
			</avg-trmm-3b43v7-precip>
			<ols-ic-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-ic-trmm-3b43v7-precip" prefix = "ols-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-ic-trmm-3b43v7-precip>
			<ts-ic-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-ic-trmm-3b43v7-precip" prefix = "ts-ic-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-ic-trmm-3b43v7-precip>
			<ols-sl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-sl-trmm-3b43v7-precip" prefix = "ols-sl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-sl-trmm-3b43v7-precip>
			<ts-mdsl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-mdsl-trmm-3b43v7-precip" prefix = "ts-mdsl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-mdsl-trmm-3b43v7-precip>
			<ts-losl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-losl-trmm-3b43v7-precip" prefix = "ts-losl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-losl-trmm-3b43v7-precip>
			<ts-hisl-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ts-hisl-trmm-3b43v7-precip" prefix = "ts-hisl-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ts-hisl-trmm-3b43v7-precip>
			<std-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-stats" band = "std-trmm-3b43v7-precip" prefix = "std-trmm-3b43v7-precip" suffix = "v7-f-A">
			</std-trmm-3b43v7-precip>
			<ols-rmse-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-rmse-trmm-3b43v7-precip" prefix = "ols-rmse-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-rmse-trmm-3b43v7-precip>
			<mk-z-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "mk-z-trmm-3b43v7-precip" prefix = "mk-z-trmm-3b43v7-precip" suffix = "v7-f-A">
			</mk-z-trmm-3b43v7-precip>
			<ols-r2-trmm-3b43v7-precip source = "trmm" product = "3b43" folder = "rainfall-A-trend" band = "ols-r2-trmm-3b43v7-precip" prefix = "ols-r2-trmm-3b43v7-precip" suffix = "v7-f-A">
			</ols-r2-trmm-3b43v7-precip>
			<trmm-3b43v7-precip-change source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model-v7-f-A">
			</trmm-3b43v7-precip-change>
			<trmm-3b43v7-precip-delta source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-delta" prefix = "trmm-3b43v7-precip-delta" suffix = "slope@p-v7-f-A">
			</trmm-3b43v7-precip-delta>
		</srccomp>
	</process>

	<!-- This second process is required due to duplicate compids-->
	<process processid = 'tileRegionToModisAncillary' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters src_defregid = 'trmm' epsg = '6842'  xres = '27798.78'  yres = '27798.78' resample='near' asscript='False'></parameters>
		<srcpath volume = "karttur3tb"></srcpath>
		<dstpath volume = "karttur3tb"></dstpath>
		<srccomp>
			<trmm-3b43v7-precip-change source = "trmm" product = "3b43" folder = "rainfall-A-change" band = "trmm-3b43v7-precip-change" prefix = "trmm-3b43v7-precip-change" suffix = "model@p-v7-f-A">
			</trmm-3b43v7-precip-change>
		</srccomp>
	</process>
</okadeltaproject>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

SNULLE

### GRACE


### GRACE animation with TRMM overlay

Assume that the GRACE estimated mm water pillar is primarily related to local rainfall. We are going to test that assumption by cross-correlating the local TRMM rainfall with the local variation in GRACE mm water pillar. But before we do the statistical cross correlation we can create an animation that show both time series in the same movie frame. The basic concept for how to create such an animation is found in the blog post [Animation with inset map](https://karttur.github.io/setup-theme-blog/blog/dualmovie/).

Inthe Framework, the process <span class='package'>movieoverlayframeModisRegion</span> creates the map parts of the movie frames, with one base maps and one overlay map. The xml below creates a map with the GRACE mm water pillar as the base map and the TRMM rainfall as the overlay. Both the GRACE and TRMM data must be mosaicked and exported as shown above.

```
<?xml version='1.0' encoding='utf-8'?>
<africasubsaharaproject>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2002" startmonth='4' startday='23' endyear = "2016" endmonth='12' endday='31' timestep='M'></period>

	<!-- Create movie frame -->
	<process processid = 'movieoverlayframeModisRegion' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'gracetrmm' basewidth = '800' basecrop='800,532,0,0'
		overlaywidth = '300' gravity='southwest' geomx='0' geomy='100'
		emboss='KARTTUR' embossdims='720,150' embossptsize='100' asscript='True'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "karttur3tb/movieclockoverlay" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<srccomp>
			<grace-ave id = 'base' source = "NASA-GRACE" product = "cmwater" folder = "cmwater" band = "grace-ave" prefix = "grace-ave" suffix = "RL05-f-1deg">
			</grace-ave>

			<trmm-3b43v7-precip id ='over' source = "trmm" product = "3b43" folder = "rainfall" band = "trmm-3b43v7-precip" prefix = "rainfall" suffix = "v7-f-m-30km">
			</trmm-3b43v7-precip>
		</srccomp>
	</process>
</africasubsaharaproject>
```

The movie clock is created in the same way as above.

```
<?xml version='1.0' encoding='utf-8'?>
<africasubsaharaproject>
	<userproj userid = 'karttur' projectid = 'karttur-africasubsahara' tractid= 'karttur-africasubsahara' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2002" startmonth='4' startday='23' endyear = "2016" endmonth='12' endday='31' timestep='M'></period>

	<!-- Create movie frame and movie -->
	<process processid = 'movieclockModisRegionToRegion' version = '1.3'>
		<overwrite>False</overwrite>
		<parameters name = 'default' width = '800' asscript='True'></parameters>
		<dstpath volume = "karttur3tb/movieclockoverlay" hdrfiletype = 'png' datfiletype = 'png'></dstpath>
		<dstcomp>
			<grace-ave id = 'base' source = "NASA-GRACE" product = "cmwater" folder = "cmwater" band = "grace-ave" prefix = "grace-ave" suffix = "RL05-f-1deg">
			</grace-ave>
		</dstcomp>
	</process>
</africasubsaharaproject>

```
BALL

The process <span class='package'>movieclockModisRegionToRegion</span> produces the shell scripts needed for assembling the final frames and for converting them to a movie. 
