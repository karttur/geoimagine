---
layout: post
title: MODIS processing
modified: '2018-11-11 T18:17:25.000Z'
categories: blog
excerpt: "MODIS Transformed Wetness Index (TWI)"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-11 T18:17:25.000Z'
comments: true
share: true
figure1: TWIpercent_MCD43A4_h20v10_2005249_v006-tg01
figure2A: ols-sl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2B: ts-mdsl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2C: ts-losl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2D: ts-hisl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled

movie1: TWIpercent_MCD43A4_h20v10_2001009-2017361_v006-tg01
movie2: TWIpercent_MCD43A4_h21v08_2001009-2017361_v006-tg01
---

# Introduction

This post illustrates how to search, download and organize MODIS data, and then use the MODIS data for constructing the [Transformed Wetness Index (TWI)](https://www.mdpi.com/2072-4292/10/4/611), and finally how to analyse trends in TWI. To actually repeat the steps you must have installed Karttur´s GeoImagine Framework.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

# MODIS

The [Moderate Resolution Imaging Spectroradiometer (MODIS)](https://terra.nasa.gov/about/terra-instruments/modis) is an optical and thermal sensor carried on two satellites, [Terra](https://terra.nasa.gov/) (launched in 1999) and [Aqua](https://aqua.nasa.gov/) (launched in 2002). The MODIS sensor has a spectral resolution of 36 bands and a wide swath that allows daily imaging of the entire globe. The spatial resolution varies from 250 m (or 232 to be exact) for red and near infra-red, 500 m for five (5) additional optical wavelengths designated for land observation, and 1 km for 29 bands mainly intended for atmospheric and oceanic observation, including thermal emissivity. The MODIS raw data is processed into a [series of products](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table), and both the raw data and the products are freely available. The products are stored in a wall-to-wall defined tile system using a [sinusoidal projection](https://modis-land.gsfc.nasa.gov/MODLAND_grid.html). Each tile is equally large and the Earth is divided into 36 horizontal and 18 vertical tiles.

In this post you will use the reflectance corrected product [MCD43A4 (version 006)](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mcd43a4_v006) that combine observations from both MODIS instruments into 16-day (16D) composites. The 16D composites are available for any consecutive days, but here we will use every 8th or 16th day. This means that we will use Day Of Year (DOY) 1, 9, 17 ... etc, where the day number refers to the central (9th) day of each 16D period (note that if you use MODIS product version 005 or earlier, the day number refers to the first day of the 16D period).

## Python Package

The GeoImagine Framework includes a package for specific MODIS processing: [geoimagine-modis](https://github.com/karttur/geoimagine-modis/). However, also several other packages in the Framework are needed for repeating the steps below.

## Data access and download

THe MODIS data is freely available from the [Land Processes Distributed Active Archive Center (LP DAAC) Data Pool](https://lpdaac.usgs.gov/data_access/data_pool). Users are required to log in with their [Earthdata](https://urs.earthdata.nasa.gov/home) login credentials to obtain data. Once you have registered for an Earthdata account, you can use the Data Pool to search and download MODIS data, as well as other data. Karttur's GeoImagine Framework have special processes for bulk downloading and managing MODIS data.

## Searching the MODIS online repository

The way Karttur´s GeoImagine Framework is organized, you first have to search the online repository for available MODIS tiles, then register the search results in the Framework postgres database. Once the data is registered you can download and extract the actual MODIS data.

### Search

I have tried to find some library or database that lists the data available in the Data Pool, but have failed to find any. Instead I created a solution where I use <span class ='terminalapp'>wget</span> ("web get") for downloading an html coded list of available data. The Framework process for searching the online repository for MODIS data using <span class ='terminalapp'>wget</span> is <span class='package'>searchdatapool</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<searchdatapool>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2000' endyear = '2018' timestep='8D'></period>

	<process processid ='searchDataPool' dsversion = '1.3'>
		<parameters product="MCD43A4" version="006" remoteuser='YourEarthDataUser' serverurl="http://e4ftl01.cr.usgs.gov" ></parameters>
		<dstpath volume = "Karttur3tb" mainpath = "/Volumes/Karttur3tb/Downloads/MODIS"></dstpath>
	</process>

</searchdatapool>
```

Before running the process <span class='package'>searchdatapool</span> you must have the credentials for accessing the  [Data Pool](https://lpdaac.usgs.gov/data_access/data_pool) in a <span class='file'>netrc</span> file, with the username corresponding to the one given in the xml file ('YourEarthDataUser').

The process will drill into the Data Pool and load all the available data as html coded files. By default the process saves all the html files under the path <span class='file'>../modis/source/yyyy.mm.dd/</span> under the volume identified in the xml file. The files are ordinary html files, but with the <span class='file'>.html</span> extension omitted.

## Transfer search to database

To transfer the search results to the GeoImagine Framework database you must run the process <span class='package'>ModisSearchToDB</span>. This process reads the html files, extracts the required information and inserts the information in the database. When finished it moves the html file to a sub-folder called <span class='file'>done</span>. If, for some reason, you delete your database all you need to do is to take all the html files under the <span class='file'>done</span> sub-folder and move them one level up and then re-run <span class='package'>ModisSearchToDB</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<modissearchtodb>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2000' endyear = '2018' timestep='8D'></period>
	<process processid ='ModisSearchToDB' dsversion = '1.3'>
		<parameters product="MCD43A4" version="006"></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
	</process>
</modissearchtodb>
```

## Downloading MODIS data

With the available MODIS Data Pool holdings registered in the database you can download any of the registered data using either <span class='package'>downloadModisRegion</span> or <span class='package'>downloadModisSingleTile</span>.

When downloading you can either download the files on the fly, or write the download commands to a shell script file. The latter is the default. To change it you need to set the parameter _asscript_ to False.

```
<?xml version='1.0' encoding='utf-8'?>
<downloadMODIS>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2017" timestep='16D'></period>

	<process processid ='downloadModisSingleTile' version = '1.3'>
		<parameters remoteuser= 'YourEarthDataUser' product='MCD43A4' version='006' htile='20' vtile='10' downloaded='True' asscript='True'> </parameters>
		<dstpath volume = "karttur3tb"></dstpath>
    </process>
</downloadMODIS>
```

If you did not add the parameter _asscript_, including setting it to False, the process produces a script file that you must run manually. You can also copy the script to another machine (with better internet connection) and run the script from there. The machine you run from must have a <span class='file'>.netrc</span> file with your EarthData credentials. And the volume indicated in the xml must either exists on the machine from which you download, or you need to edit the script to reflect a volume that is available on the machine from which you download. To run the shell script you must first make it executable, and then execute it:

<span class='terminal'>$ chmod 777 /path/to/script.sh</span>

<span class='terminal'>$ /path/to/script.sh</span>

If you choose to use batch scripting you have to run a second process that checks the exploded files and transfers the results to the Framework database. You can either re-run the process that you used for generating the shell script file, making sure the overwrite option is set to False (default). Alternatively you can run the corresponding special process <span class='package'>CheckMODISRegion</span> or <span class='package'>CheckMODISSingleTile</span>.

## Check MODIS tiles

If you have used shell script batch processing for either downloading (pervious section) or extracting (next section) MODIS data, you can run one of the two versions of the <span class='package'>CheckMODIS</span> process to update the database. <span class='package'>CheckMODIS</span> will check the consistency of your local MODIS files and the database, and harmonize the database with the local data holdings.

```
<?xml version='1.0' encoding='utf-8'?>
<checkModis>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2018' timestep='8D'></period>

	<process processid ='CheckMODISSingleTile' dsversion = '1.3'>
		<parameters product='MCD43A4' version='006' htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
	</process>

</checkModis>
```

## Extracting MODIS layers

The layers included in each MODIS HDF file, as well as metadata, can be accessed using the GDAL command <span class='terminalapp'>gdalinfo</span>. ([GDAL is part of the GeoImainge Framework](https://karttur.github.io/setup-ide/setup-ide/install-gis/), and must be installed in order to extract the MODIS data.)

<span class='terminal'>gdalinfo path/to/modis/modisfile.HDF</span>

In Karttur's GeoImagine Framework the layers to extract have to be defined in the database, in the table _templates_ under the _modis_ schema. The template table also define the celltype, cellnull, projection and folder where to store the extracted layer. At present the _modis.templates_ table is pre-defined and to change it you either need to change the xml file defining the table, or manually change the table using postgres commands or a postgres Graphical User Interface.

In this post you are going to explode the combined MODIS reflectance product, MCD43A4, version 006. By default all the seven bands included in the product are extracted (nir = near infra-red, mir = mid infra-red):

| Band | Wavelenght (nm) | Name  | code |
|:-----|:----------------|:------|:-----|
| 1    | 620–670         | red   | rl   |
| 2    | 841–876         | nir   | na   |
| 3    | 459–479         | blue  | bl   |
| 4    | 545–565         | green | gl   |
| 5    | 1230–1250       | mir A | ma   |
| 6    | 1628–1652       | mir B | mb   |
| 7    | 2105–2155       | mir C | mc   |


To extract the MODIS layers from the HDF files, either run <span class='package'>ExplodeMODISRegion</span> or <span class='package'>ExplodeMODISSingleTile</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<explodeModis>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2018' timestep='8D'></period>
	<process processid ='ExplodeMODISSingleTile' dsversion = '1.3'>
		<parameters product='MCD43A4' version='006' htile='20' vtile='10' asscript='True'></parameters>
		<srcpath volume = "Karttur3tb/DataPoolModis"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
	</process>
</explodeModis>
```

By default the processes <span class='package'>ExplodeMODISRegion</span> and <span class='package'>ExplodeMODISSingleTile</span> generate shell script files that must be manually executed for extracting the requested layers. As explained above, if you choose to use batch scripting you have to run a second process that checks the exploded files and transfers the results to the Framework database. You can either re-run the process that you used for generating the shell script file, making user the overwrite option is set to False (default). Alternatively you can run the corresponding special process <span class='package'>CheckMODISRegion</span> or <span class='package'>CheckMODISSingleTile</span> (see above).

## Image Linear Transformation

The MODIS image reflectance data (table above) can be used for classical statistical image classifications, or e.g. machine learning classification. But the Karttur's GeoImagine Framework also contains a module for deterministic, rather than statistical, modeling. The deterministic modeling package can be used for defining linear transformations of the reflectance data to a biophysical feature space. In the remote sensing jargon, this is sometimes referred to as Tasseled Cap Transformation (TCT). Usually a TCT is based on fixed transformations coefficients, but in Karttur's GeoImagine Framework you can also create your own, customized and calibrated, thematic transformation for classification of specific features.

Here I will only illustrate how to implement a linear transformation. The processes for transforming MODIS reflectance data to a biophysical feature space are <span class='package'>LinearTransformMODISRegion</span> or <span class='package'>LinearTransformMODISSingleTile</span>. The number of biophysical features can not exceed the number of bands. In the example below two biophysical features are produced, tc-soil and tc-wet.

```
<?xml version='1.0' encoding='utf-8'?>
<transform>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2017' timestep='16D'></period>
	<process processid ='LinearTransformMODISSingleTile' dsversion = '1.3'>
		<parameters product='MCD43A4' version='006' htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
		<srccomp>
			<rl id='rl' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "rl" prefix = "rl-srfi" suffix = "v006">
			</rl>
			<na id='na' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "na" prefix = "na-srfi" suffix = "v006">
			</na>
			<bl id='bl' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "bl" prefix = "bl-srfi" suffix = "v006">
			</bl>
			<gl id='gl' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "gl" prefix = "gl-srfi" suffix = "v006">
			</gl>
			<ma id='ma' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "ma" prefix = "ma-srfi" suffix = "v006">
			</ma>
			<mb id='mb' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "mb" prefix = "mb-srfi" suffix = "v006">
			</mb>
			<mc id='mc' source = "MCD43A4v006" product = "MCD43A4" folder = "srfi" band = "mc" prefix = "mc-srfi" suffix = "v006">
			</mc>
		</srccomp>
		<dstcomp>
			<ortho-soil id='tc-soil' source = "MCD43A4v006" product = "MCD43A4" folder = "tasscap" band = "ortho-soil" prefix = "ortho-soil" suffix = "v006-tg01">
			</ortho-soil>
			<ortho-wet id='tc-wet' source = "MCD43A4v006" product = "MCD43A4" folder = "tasscap" band = "ortho-wet" prefix = "ortho-wet" suffix = "v006-tg01">
			</ortho-wet>
		</dstcomp>
		<transformoffset>
			<offset id = 'bl' offset='-147'></offset>
			<offset id = 'gl' offset='-507'></offset>
			<offset id = 'rl' offset='-563'></offset>
			<offset id = 'na' offset='-1008'></offset>
			<offset id = 'ma' offset='-1531'></offset>
			<offset id = 'mb' offset='-1836'></offset>
			<offset id = 'mc' offset='-1699'></offset>
		</transformoffset>
		<transformscale>
			<scalefac id = 'bltc-soil'  compin = 'bl' compout='tc-soil' scalefac='0.3595'></scalefac>
			<scalefac id = 'gltc-soil'  compin = 'gl' compout='tc-soil' scalefac='0.3364'></scalefac>
			<scalefac id = 'rltc-soil'  compin = 'rl' compout='tc-soil' scalefac='0.3148'></scalefac>
			<scalefac id = 'natc-soil'  compin = 'na' compout='tc-soil' scalefac='0.3209'></scalefac>
			<scalefac id = 'matc-soil'  compin = 'ma' compout='tc-soil' scalefac='0.2498'></scalefac>
			<scalefac id = 'mbtc-soil'  compin = 'mb' compout='tc-soil' scalefac='0.6573'></scalefac>
			<scalefac id = 'mctc-soil'  compin = 'mc' compout='tc-soil' scalefac='0.2471'></scalefac>
			<scalefac id = 'bltc-wet'   compin = 'bl' compout='tc-wet' scalefac='0.4940'></scalefac>
			<scalefac id = 'gltc-wet'  compin = 'gl' compout='tc-wet' scalefac='0.3501'></scalefac>
			<scalefac id = 'rltc-wet'  compin = 'rl' compout='tc-wet' scalefac='0.1882'></scalefac>
			<scalefac id = 'natc-wet'  compin = 'na' compout='tc-wet' scalefac='0.0384'></scalefac>
			<scalefac id = 'matc-wet'  compin = 'ma' compout='tc-wet' scalefac='-0.3581'></scalefac>
			<scalefac id = 'mbtc-wet'  compin = 'mb' compout='tc-wet' scalefac='-0.1731'></scalefac>
			<scalefac id = 'mctc-wet'  compin = 'mc' compout='tc-wet' scalefac='-0.6621'></scalefac>
		</transformscale>
	</process>

</transform>
```

The two biophysical features tc-soil and tc-wet were specifically defined for extracting soil-moisture content from MODIS images. The conversion of tc-soil and tc-wetness to a soil-moisture index (the Transformed Wetness Index, TWI) is done though a scale preserving rotation and transformation process.

## Scale preserved rotation and transformation

Many of the classical indexes used in satellite image processing are derived from a normalized rationing:

index = (bandA - bandB) / (bandA + bandB)

including the Normalized Difference Vegetation Index (NDVI), the Normalized Difference Snow Index (NDSI) and the several version of the Normalized Difference Water Index (NDWI). Especially NDVI has been extensively applied for vegetation mapping and monitoring. More elaborate VIus also use information from other bands, or adjustment factors, for reducing biases cuased by e.g. atmospheric disturbances or soil backgrounds. A variery of different VI's are implement in Karttur's GeoImagine Framework. But the Framework also contains a more generic indexing tool, developed from [Jack Paris Grand Unified Vegetation Index (GRUVI)](https://www.microimages.com/sml/smlsamples-htm/ScriptsByJack.htm). The tool, however, can be used for indexing any surficial biophysical feature, not only vegetation.

In this post, you will implement the Transformed Wetness Index, which uses the tc-soil and tc-wet feuaters as input. For a full reference to the method, see [Gumbricht (2018)](https://www.mdpi.com/2072-4292/10/4/611).

```
<?xml version='1.0' encoding='utf-8'?>
<fgbg>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2002' timestep='16D'></period>

	<process processid ='fgbgmodisSingleTile' dsversion = '1.3'>
		<parameters slope='1.6' intercept='-2080' rescalefac='5942' calibfac='7000' htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
		<srccomp>
			<ortho-soil id='xband' source = "MCD43A4v006" product = "MCD43A4" folder = "tasscap" band = "ortho-soil" prefix = "ortho-soil" suffix = "v006-tg01">
			</ortho-soil>
			<ortho-wet id='yband' source = "MCD43A4v006" product = "MCD43A4" folder = "tasscap" band = "ortho-wet" prefix = "ortho-wet" suffix = "v006-tg01">
			</ortho-wet>
		</srccomp>
		<dstcomp>
			<TWI id='fg' source = "MCD43A4v006" product = "MCD43A4" folder = "TWI" band = "TWI" prefix = "TWI" suffix = "v006-tg01">
			</TWI>
		</dstcomp>
	</process>
</fgbg>
```

## Seasonal signal extraction

The time series of the Transformed Wetness Index (TWI), created in the previous section, is plagued with gaps, in particular over regions with heavy cloud cover during the wet season(s). For reconstructing an unbiased annual signal you need to fill the gaps prior to any temporal resampling. To fill the gaps, you first need to extract the multiyear seasonal signal.

The processes <span class='package'>extractseasonmodisRegion</span> and <span class='package'>extractseasonmodisSingleTile</span> extracts the seasonal multiyear signal. You can only give the source composition (\<srccomp\>) in this process.


```
<?xml version='1.0' encoding='utf-8'?>
<extractseason>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2017' timestep='16D'></period>

	<process processid ='extractseasonModisSingleTile' dsversion = '1.3'>
		<parameters htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
		<srccomp>
			<TWI source = "MCD43A4v006" product = "MCD43A4" folder = "TWI" band = "TWI" prefix = "TWI" suffix = "v006-tg01">
			</TWI>
		</srccomp>
	</process>

</extractseason>
```

The <span class=''>extractseasonModis</span> processes do not accept any destination composition (\<dstcomp\>). The naming and composition of the destination tine series is defaulted, and can not be manually set. The format of the seasonal layers will be exactly the same as the original time series. The seasonal layers will be stored under a thematic folder with the same name as the original time series, but with the suffix "-sesn".
The file naming will also be identical, except for the date part, that will be changed to the format:

"startyear"-"endyear"@"seasonalperiod"

The seasonal files resulting from the xml file above will thus have the date parts like: 2001-2017@D009, 2001-2017@D026 ... etc.

## Filling missing data

As noted in the previous section, the MODIS data have large gaps, and I choose to fill these gaps prior to analyzing trends and changes (and prior to creating animations). The processes for filling MODIS data gaps are <span class='package'>seasonfilltsModisRegion</span> and <span class='package'>seasonfilltsModisSingleTile</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<seasonfill>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2017' timestep='16D'></period>

	<process processid ='seasonfilltsModisSingleTile' dsversion = '1.3'>
		<parameters htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
		<srccomp>
			<TWI source = "MCD43A4v006" product = "MCD43A4" folder = "TWI" band = "TWI" prefix = "TWI" suffix = "v006-tg01">
			</TWI>
		</srccomp>
	</process>
</seasonfill>
```

The process xml command only requires the composition for the original time series. But the process expects that the corresponding seasonal signals (for the given period and timestep) already exist. Remember that the naming of the seasonal layers is defaulted, and can not be set. The <span class='package'>seasonfilltsModis</span> processes fill in all missing records in the original time series using a combination of interpolation and the average seasonal signal for the same period that filled.

The previous date, whether observed or interpolated itself, is always given a weight of 0.5. The remaining weight fraction (0.5) is divided between the next observation and the average seasonal signal. The closer in time the next observation, the higher the weight. By default, the weight for the next observation value is determined by the formula:

weight = 1.4/(distance)\*\*2+3.0)

resulting in the following default weights:

| Distance to next | Weight previous | Weight next | Weight seasonal |
|:-----------------|:----------------|:------------|:----------------|
| 0                | 0.5             | 0.47        | 0.03            |
| 1                | 0.5             | 0.35        | 0.15            |
| 2                | 0.5             | 0.2         | 0.3             |
| 3                | 0.5             | 0.12        | 0.38            |
| 4                | 0.5             | 0.07        | 0.43            |
| 5                | 0.5             | 0.05        | 0.45            |

Note that the previous period can itself be a result of an interpolation, in which case the seasonal signal and the next period have already influenced the previous period value.

## Convert TWI to percent soil moisture

In my [article on TWI](https://www.mdpi.com/2072-4292/10/4/611) I use an empirical algorithm for translating TWI from reflectance factor units to percent soil moisture. The formula is a scalar transformaion, and is implemented in the Framework as <span class='package'>twipercentmodisRegion</span> and <span class='package'>twipercentmodisSingleTile</span>.

```
<?xml version='1.0' encoding='utf-8'?>
<twipercent>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2017' timestep='16D'></period>

	<process processid ='twipercentmodisSingleTile' dsversion = '1.3'>
		<parameters constant='4300' divisor='430' power='1.067' powfac='0.0086' scalcefac='2' dstmax='200' dstmin='0' htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
		<srccomp>
			<TWI source = "MCD43A4v006" product = "MCD43A4" folder = "TWI-fill" band = "TWI" prefix = "TWI" suffix = "v006-tg01">
			</TWI>
		</srccomp>
		<dstcomp>
			<TWIpercent source = "MCD43A4v006" product = "MCD43A4" folder = "TWI-fill-percent" band = "TWIpercent" prefix = "TWIpercent" suffix = "v006-tg01"
			celltype = 'Byte' cellnull='255' scalefac ='2' offsetadd = '0' dataunit='vol*100/vol' measure='R'
			>
			</TWIpercent>
		</dstcomp>
	</process>
</twipercent>
```

The process setting up the conversion to percent above scales the output between 0 and 200, and thus has a scalefac = 2.

## Time series export and animation

After running the process <span class='package'>seasonfilltsModis</span> and the conversion to percent soil moisture, you should have a complete time series of 16D interval MODIS estimated percent soil moisture (TWI) layers. In my example here, I have included all years from 2001 to 2017, or 17 years. To create the animation I need to define a clock/timeline layout, the movie frame size, and if and how to emboss the finished movie. The post on [SMAP processing](../blog-SMAP/index.html) contains a more detailed step-by-step tutorial on how to create layouts for spatial data and the movieclock.

### Add movieclock

I will illustrate using two example (further down). The first is the MODIS tile h20v10, covering the wetlands of central southern Africa. To avoid covering the Okavango Inland Delta in Northern Botswana, I have to put the clock in the lower right corner. To do that I define a movieclock using all the default settings, but with the clock position set to the lower right (lr) corner:

```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<!-- addmovieclock -->
	<process processid = 'addmovieclock'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters name = 'twilr'
		position = 'lr'
		>
		</parameters>
	</process>
</palette>
```

### TWI palette and scaling

I also need a palette for the TWI (soil moisture) data. The palette is set reflecting the range of the TWI percent (from 0 to 200) data.

```
<?xml version='1.0' encoding='utf-8'?>
<palette>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<!-- addrasterpalette twi-->
	<process processid = 'addrasterpalette'>
		<parameters palette = 'twi' compid='test'>
			<setcolor id = '0' red = '255' green ='132' blue='94' alpha ='0' label='0' hint='0' ></setcolor>			
			<setcolor id = '25' red = '240' green ='224' blue='148' alpha ='0' label='10' hint='NA' ></setcolor>			
			<setcolor id = '50' red = '162' green ='162' blue='122' alpha ='0' label='50' hint='no correlation' ></setcolor>			
			<setcolor id = '100' red = '70' green ='89' blue='112' alpha ='0' label='100' hint='positive correclation' ></setcolor>
			<setcolor id = '150' red = '20' green ='60' blue='210' alpha ='0' label='150' hint='positive correclation' ></setcolor>
			<setcolor id = '200' red = '2' green ='1' blue='190' alpha ='0' label='200' hint='strong positive correlation' ></setcolor>
			<setcolor id = '250' red = '2' green ='1' blue='190' alpha ='0' label='250' hint='strong positive correlation' ></setcolor>
			<setcolor id = '253' red = '245' green ='237' blue='182' alpha ='0' label='dry (0)' hint='completely dry' ></setcolor>
			<setcolor id = '254' red = '32' green ='32' blue='32' alpha ='255' label='frame' hint='frame' ></setcolor>
			<setcolor id = '255' red = '250' green ='250' blue='250' alpha ='255' label='255' hint='no data' ></setcolor>
		</parameters>			
	</process>
</palette>
```

Also a scaling is needed, even if the scaling in this case is a direct 1:1 relation.

```
<?xml version='1.0' encoding='utf-8'?>
<scaling>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'system'></userproj>
	<!-- Create scaling -->
	<process processid = 'createscaling' version = '1.3'>
		<parameters scalefac='1' mirror0='False'></parameters>
		<comp id = '1' source = "MCD43A4v006" product = "MCD43A4" folder = "twi-fill-percent" band = "twipercent" prefix = "twipercent" suffix = "v006-tg01">	</comp>		
    	<comp id = '2' source = "MCD43A4v006" product = "MCD43A4" folder = "twi-percent" band = "twipercent" prefix = "twipercent" suffix = "v006-tg01">	</comp>		
	</process>
</scaling>
```

### Export

Once you have creates the palette and scaling for the MODIS TWI percent composition, you can export the data as color images (maps). The scaling can not be set in the <span class='package'>exporttobytesmap</span> process. It must be given in the database and related to the data to be exported using the theme (folder) and name (band) of the layer. The palette to use must be set as a parameter.

```
<?xml version='1.0' encoding='utf-8'?>
<export>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = '2001' endyear = '2017' timestep='16D'></period>
	<process processid ='exporttobyteModisSingleTile' dsversion = '1.3'>
		<overwrite>True</overwrite>
		<parameters palette='twi' htile='20' vtile='10'></parameters>
		<srcpath volume = "Karttur3tb"></srcpath>
		<dstpath volume = "Karttur3tb"></dstpath>
		<srccomp>
			<TWIpercent id='TWI' source = "MCD43A4v006" product = "MCD43A4" folder = "TWI-fill-percent" band = "TWIpercent" prefix = "TWIpercent" suffix = "v006-tg01">
			</TWIpercent>
		</srccomp>
	</process>
</export>
```

The export processes always exports the data using the same projection and the spatial resolution as the source data. When exporting the data for layout and mapping, the cell format is changed to Byte (0-255).

## MODIS TWI animation

To create animations based on the the MODIS sinusoidal tiles, you need to run the two processes <span class='package'>movieframeModisSingleTile</span> and <span class='package'>movieclockModisSingleTile</span>. The post on [SMAP processing](../blog-SMAP/index.html) contains a more detailed step-by-step tutorial on how to create animations from time series images.

The first process, <span class='package'>movieframeModisSingleTile</span>, creates the movie frames. By default it creates a shell script file, reported when process finished, that that you must run. For the MODIS tiles herein, I set the frame dimensions to 800*800 (rather than the original 2400*2400). The movies are thus smaller compared to the original data.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2017"  timestep='16D'></period>		

	<process processid = 'movieframeModisSingleTile' version = '1.3'>
		<parameters framewidth = '800' framecrop='800,800,0,0' emboss='KARTTUR' embossdims='720,150' embossptsize='100' htile='20' vtile='10'></parameters>
		<srcpath volume = "karttur3tb" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "/Volumes/karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>    	
		<srccomp>			
			<TWIpercent id='TWI' source = "MCD43A4v006" product = "MCD43A4" folder = "TWI-fill-percent" band = "TWIpercent" prefix = "TWIpercent" suffix = "v006-tg01">
			</TWIpercent>   	
		</srccomp>
	</process>
</runprocess>
```

The second process, <span class='package'>movieclockModisSingleTile</span>, creates one clock image per movie frame. It then also creates two shell script files, one for overlaying the clock frames over the movie frames, and one for generating the movies. You have to run both manually as explained in the post on [SMAP processing]((../blog-SMAP/index.html))

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'modis'></userproj>
	<period startyear = "2001" endyear = "2017"  timestep='16D'></period>		

	<process processid = 'movieclockModisSingleTile' version = '1.3'>
		<overwrite>True</overwrite>
		<parameters clocklayout = 'twilr' moviewidth = '800' htile='20' vtile='10'></parameters>		
		<dstpath volume = "/Volumes/karttur3tb/movieclock" hdrfiletype = 'png' datfiletype = 'png'></dstpath>    	
		<dstcomp>			
			<TWIpercent id='TWI' source = "MCD43A4v006" product = "MCD43A4" folder = "TWI-fill-percent" band = "TWIpercent" prefix = "TWIpercent" suffix = "v006-tg01">
			</TWIpercent>   	
		</dstcomp>
	</process>
</runprocess>
```

<figure>
<iframe src="{{ site.commonurl }}/movies/{{ site.data.movies[page.movie1].file }}" width="{{ site.data.movies[page.movie1].width }}" height="{{ site.data.movies[page.movie1].height }}" frameborder="0">
</iframe>
<figcaption> {{ site.data.movies[page.movie1].caption }} </figcaption>
</figure>

<figure>
<iframe src="{{ site.commonurl }}/movies/{{ site.data.movies[page.movie2].file }}" width="{{ site.data.movies[page.movie2].width }}" height="{{ site.data.movies[page.movie2].height }}" frameborder="0">
</iframe>
<figcaption> {{ site.data.movies[page.movie2].caption }} </figcaption>
</figure>

## Temporal resampling

At this stage you should have a filled time series of MODIS data. You can use the filled time series for analyzing trends and changes as it is, or you can resample it to a more coarse spatial resolution. This section illustrates how to resample the MODIS time series, first to monthly data, and then to annual data. TO BE COMPLETED
