---
layout: post
title: Accessing TRMM and FAO reference evapotranspiration
modified: '2018-04-28 20:17'
categories: blog
excerpt: Accessing TRMM and FAO reference evapotranspiration
tags:
  - TRMM
  - FAO reference evapotranspiration
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-04-28 22:03'
comments: true
share: true
---

**Contents**

## Introduction

In this post you will download and prepare image data on tropical rainfall and global reference evapotranspiration.

## FAO reference evapotranspiration

The FAO dataset on reference evapotranspiration (refET) is composed of monthly average layers representing 1961 to 1990. The refET varies dependent of many factors, including temperature, wind and atmospheric water vapor pressure, but for this study we will use monthly average data. The alternative, to calculate dynamic refET is complicated and the data demands exceeds the available. The dataset was created by [Climate Research Centre (Tyndall centre) in the UK as CL version 2.0](https://crudata.uea.ac.uk/~timm/grid/CRU_CL_2_0.html), but is no longer accassible from CRU, instead you have to download it from FAO.

### Access FAO refET

The FAO reference evapotranspiration (refET) dataset is available from the [FAO Geonetwork server](http://www.fao.org/geonetwork) and at the time of writing the refET dataset is [here](http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416).

At the top of the box called Transfer options there is an option to download the dataset (Global map of monthly reference evapotranspiration - 10 arc minutes - ASCII-grid). If you click, you will get all the monthly files. There is also a 3 arc minutes water balance version (the last item in the Transfer option box), but as we are going to work at the 15 arc minutes resolution of the TRMM datasets, use the 10 arc min version of the reference evapotranspiration.

#### Import the refET

The downloaded refET data is in ASCII (pure text) format, you can open one of the monthly files are read the values.

```
ncols  2160
nrows  1080
xllcorner  -180
yllcorner  -90
cellsize  0.166667
NODATA_value  -9
    -9     -9     -9     -9     -9     -9     -9
```

You can import the ASCII file to a more useful format (e.g. GeoTIFF) using GDAL. I use Karttur's GeoImagine framework, and all that is required is the following xml file.

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproject userid = 'thomasg' projectid = 'karttur' tractid= 'system' siteid = '*' plotid = '*' system = 'system'></userproject>
	<period timestep='staticmonthly'></period>
	<path></path>

	<process processid ='organizeancillary' version = '3.0'>
		<parameters epsg = '4326'
		dsinst = 'FAO'
		dsname  = 'refevap'
		dsversion = ""
		year = "2004"
		regionid = 'globe'
		regioncat = 'globe'
		replacestr = 'MM'
		replacetag = 'monthlypet'
		datadir ='FAO/refevap//ref_evap_fao_10min'
		datafile ='etoMM.txt'
		dataurl = "http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416"
		metapath ="GIAR-CSI/PET_he_monthly/CGIAR-CSI Global-PET-AI-Read Me.doc"  
    	metaurl="http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416"
    	title = "Global reference evapotranspiration"
    	label = "Global map of monthy reference evapotranspiration 10 arc minutes"
		> </parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<srcpath mainpath = "/Volumes/WETLANDS/ANCILIMPORT" scenes = 'false' division = 'tiles' hdrfiletype = "asc" datfiletype = "aai"></srcpath>
		<tarpath mainpath = "/Volumes/WETLANDS/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = "tif" datfiletype = "tif"></tarpath>

		<rawin id="fao-refet-dayx10"
		datadir = "FAO/refevap//ref_evap_fao_10min"
    	datafile = "etoMM"
    	datalayer = "etoMM"
    	dsversion = ""
    	accessedate = "20170804"
    	theme = "climate"
    	subtheme = "reference evapotranspiration"
    	copyright = ""
    	title = "reference evapotranspiration"
    	label = "Global map of monthy reference evapotranspiration 10 arc minutess"
    	></rawin>

    	<compout source = "FAO" product = "refet" folder = "refet" band = "fao-refet-dayx10" prefix = "fao-refet-dayx10" suffix = "_monthly" scalefac = "0.1" offsetadd = "0" dataunit = "mm/day" celltype = 'Int16' cellnull = '-9' measure = 'R'></compout>

		<monthlypet type = 'datum'>
			<compinattribute>datafile</compinattribute>
			<compinattribute>dataset</compinattribute>
			<compoutattribute>yyyydoy</compoutattribute>
			<replace key = '01' compinreplace = '01' compoutreplace = '01'></replace>
			<replace key = '02' compinreplace = '02' compoutreplace = '02'></replace>
			<replace key = '03' compinreplace = '03' compoutreplace = '03'></replace>
			<replace key = '04' compinreplace = '04' compoutreplace = '04'></replace>
			<replace key = '05' compinreplace = '05' compoutreplace = '05'></replace>
			<replace key = '06' compinreplace = '06' compoutreplace = '06'></replace>
			<replace key = '07' compinreplace = '07' compoutreplace = '07'></replace>
			<replace key = '08' compinreplace = '08' compoutreplace = '08'></replace>
			<replace key = '09' compinreplace = '09' compoutreplace = '09'></replace>
			<replace key = '10' compinreplace = '10' compoutreplace = '10'></replace>
			<replace key = '11' compinreplace = '11' compoutreplace = '11'></replace>
			<replace key = '12' compinreplace = '12' compoutreplace = '12'></replace>
		</monthlypet>
	</process>
</organize>
```

### Convert to monthly refET

The refET comes as average daily mm x 10. To simplify the calculations, I convert this to mothly refEt in mm (x 1) and then I also convert the rainfall to same unit (mm per month). You can do the conversion manually, but I use the Karttur Geoimagine framework through the following xml file:

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproject userid = 'karttur' projectid = 'globe' tractid= 'globe' siteid = '*' plotid = '*' system = 'ancillary'></userproject>
	<period timestep='staticmonthly'></period>
	<process processid ='convertdaytomonth' version = '3.0'>
		<parameters factor = '0.1' offset = '0' ></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<srcpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = "tif" datfiletype = "tif"></srcpath>
		<tarpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = "tif" datfiletype = "tif"></tarpath>
    	<compin source = "FAO" product = "refet" folder = "refet" band = "fao-refet-dayx10" prefix = "fao-refet-dayx10" suffix = "_monthly" ></compin>
		<compout source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "_10min" scalefac = "1" offsetadd = "0" dataunit = "mm" celltype = 'Int16' cellnull = '-32768' measure = 'R'></compout>
	</process>
</organize>
```

### Resample to fit TRMM dataset

Below you are going to download and process the rainfall data that will be used together with the refET. The rainfall data has a slightly coarser spatial resolution (15 arc minutes) and covers a smaller regions (between 50 degrees latitude). To overlay the rainfall and the refET you need to resample the refET to fit the rainfall data. I again use Karttur's GeoImagine framework, through the following xml file:

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproject userid = 'karttur' projectid = 'globe' tractid= 'globe' siteid = '*' plotid = '*' system = 'ancillary'></userproject>
	<period timestep='staticmonthly'></period>
	<path></path>

	<process processid ='translate' version = '3.0'>
		<parameters dst_region = 'trmm' xsize = '1440' ysize ='400' resampling ='average'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<srcpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = "tif" datfiletype = "tif"></srcpath>
		<tarpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = "tif" datfiletype = "tif"></tarpath>
    	<compin source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "_10min" ></compin>
		<compout source = "FAO" product = "refet" folder = "refet" band = "fao-refet" prefix = "fao-refet" suffix = "_15min" scalefac = "1" offsetadd = "0" dataunit = "mm" celltype = 'Int16' cellnull = '-32768' measure = 'R'></compout>
	</process>
</organize>
```

With the refET organized, let us turn to the rainfall data.

## TRMM

The Tropical Rainfall Measurement Mission (TRMM) ran for 17 years, from 1998 to 2015 (the radar ceased to function already in October 2014). The original data is at 0.25 degrees resolution between 50 degrees latitudes with 3 hours temporal resolution. In this post you will download monthly data that use TRMM in combination with other data. This dataset was continued through January 2018. The product is called 3B43, and the latest (last) version is 7.

### Access TRMM data

At time of writing TRMM can be download in [different formats from different sources](https://pmm.nasa.gov/data-access/downloads/trmm):

+ [PMM](https://pmm.nasa.gov/data-access/data-sources)
+ [STORM](https://storm-pps.gsfc.nasa.gov/)
+ [Giovanni](http://giovanni.gsfc.nasa.gov/giovanni)
+ [Mirador](http://mirador.gsfc.nasa.gov/)
+ [OPeNDAP​](http://www.opendap.org/)
+ [GES DISC](http://disc.sci.gsfc.nasa.gov/)
+ [GrADS Data Server (GDS)](http://www.iges.org/grads/)

Not having the time to try all of them out, I choose [Mirador](http://mirador.gsfc.nasa.gov/) with the data in hdf format. The [link](https://mirador.gsfc.nasa.gov/cgi-bin/mirador/presentNavigation.pl?tree=project&dataset=3B43%3A%20Monthly%200.25%20x%200.25%20degree%20merged%20TRMM%20and%20other%20sources%20estimates&project=TRMM&dataGroup=Gridded&version=007) should automatically choose the monthly dataset (3B43) that is used in this tutorial. Simply select all months for all years, add them to your "shopping basket" and you will get a complete list of the http links.

### Access EarthData server

Trying to retrieve the hdf files in the list, it turns out that the files have been transferred to a secure server, and the "http" is changed to "https". The data now resides on the server http://disc2.gesdisc.eosdis.nasa.gov. To access the data on that server you need to register at [Earthdata](https://urs.earthdata.nasa.gov/).

With 20 years worth of rainfall maps, manual download would take a very long time. Instructions for how to set up wget or curl for downloading data from GES DISC is found [here](https://disc.gsfc.nasa.gov/information/howto?title=How%20to%20Download%20Data%20Files%20from%20HTTP%20Service%20with%20wget), and summarised for mac osx below.

#### Create .netrc server access

For automatic login and to the GES DISC server you need to enter the server, your login and password in a .netrc file. The .netrc can be placed in any folder, but unless you put it in your home directory you have to give the path. I put mine in my home directory. Open a <span class='app'>Terminal<spam> window. To make sure you are in your home directory change directory (cd) in a terminal window:

<span class='terminal'>cd ~</span>

Then use the sudo command and a terminal text editor (for example pico) to create/open your .netrc file:

<span class='terminal'>sudo pico .netrc</span>

Add the line with the machine, login and password to the .netrc file:

```
machine urs.earthdata.nasa.gov login YourEarthDataUser password YourEarthDataPassWord
```

The exit pico (ctrl + X) and save the edited .netrc file. Change the access to .netrc so that it can be opened by the wget command:

<span class='terminal'>chmod 0600 .netrc</span>

Then you also need to create a cookie file (in your home directory) called .urs_cookies. It will be empty at start, and you can create it either using pico or the terminal command touch:

<span class='terminal'>touch .urs_cookies</span>

To transfer you credentials from .netrc to .urs_cookies you have to run wget, and (perhaps) give you login and password. While still in the Terminal window, just do a wget for the file used in the [EarthData manual for setting up] wget(https://disc.gsfc.nasa.gov/information/howto?title=How%20to%20Download%20Data%20Files%20from%20HTTP%20Service%20with%20wget)

<span class='terminal'>$ wget --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies https://goldsmr4.gesdisc.eosdis.nasa.gov/data/MERRA2_MONTHLY/M2TMNXSLV.5.12.4/1981/MERRA2_100.tavgM_2d_slv_Nx.198101.nc4
</span>

If you open .urs_cookies,

<span class='terminal'>pico .urs_cookies</span>

You should see that it has been filled with text.

#### Python script for automatic downloads

On the [EarthData manual page for setting up] wget(https://disc.gsfc.nasa.gov/information/howto?title=How%20to%20Download%20Data%20Files%20from%20HTTP%20Service%20with%20wget) different options for listing and downloading data are given. But I choose to write a small Python script for better control, also avoiding downloading files that I already have on my local system. I already got the list of all the files I want to download from the Mirador server, and I will use that list to step through all files.

```
import os

def WgetErthDataTRMM(srcFPN, dstFP):
    if not os.path.exists(dstFP):
        os.makedirs(dstFP)
    for line in open(srcFPN):
        url = line.strip()
        FN = os.path.split(url)[1]
        dstFPN = os.path.join(dstFP, FN)
        if not os.path.exists(dstFPN):
            if not 'https' in url:
                url = url.replace('http','https')
            cmd = '/usr/local/bin/wget --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies --directory-prefix=%(dst)s %(url)s' %{'dst': dstFP, 'url':url}
            os.system(cmd)  
        else:
            print ('already done', FN)

if __name__ == "__main__":
    srcFPN = '/Path/To/List/With/urls/url_trmm3B43v7_trmm_1998-2017.txt'
    trmmFP = '/Path/To/Destination/Folder'
    WgetErthDataTRMM(srcFPN, trmmFP)
```

The script opens the file (from Mirador) that lists all the urls (server side files) that I want to download. The script then changes "http" to "http" and creates the wget command (cmd) for downloading, including setting the cookies file with your credentials, and then also steers the download to the destination folder. If the file already exists in the destination folder, it is not downloaded again.

On my machine I had to give the full path to wget (/usr/local/bin/wget). I  tried to set the process up using the recommended Python package subprocess, but I failed.

### Extract TRMM hdf data

This part only shows the core command of how to extract the TRMM hdf data. In my system it is done as part of Karttur's Geo Imagine framework. I use [GDAL]() to extract hdf files, and the basic command for extracting the TRMM data is:

```
    oscmd =                               '/Library/Frameworks/GDAL.framework/Versions/1.11/Programs/gdal_translate HDF4_SDS:UNKNOWN:"%(in)s"' %{'in':srcFPN}
    if band == 'trmm-3b43v7-precip':
        oscmd = '%(cmd)s:0:precipitation %(tmp)s' %{'cmd':oscmd, 'tmp':tmpFPN}
    elif band == 'trmm-3b43v7-relerr':
        oscmd = '%(cmd)s:1:relativeError %(tmp)s' %{'cmd':oscmd, 'tmp':tmpFPN}
    elif band == 'trmm-3b43v7-gauge-weight':
        oscmd = '%(cmd)s:2:gaugeRelativeWeighting %(tmp)s' %{'cmd':oscmd, 'tmp':tmpFPN}
    else:
        exitstr =  'TRMMtranslate: unrecognised band',comp.band
        exit(exitstr)
    os.system(oscmd)
```

where band is identifying the three actual layers included in each TRMM hdf file.

You then have to create a projection (EPSG: 4326) and set the geotransformation (-180, 0.25, 0, 50, 0, -0.25) and import the data etc.

#### Extract using Karttur GeoImagine

To extract the data using Karttur´s Geoimagine framework, create the following xml file for importing data for 1998 and 1999:

```
<?xml version='1.0' encoding='utf-8'?>
<organize>
	<userproject userid = 'thomasg' projectid = 'karttur' tractid= 'system' siteid = '*' plotid = '*' system = 'system'></userproject>
	<period startyear = '1998' startmonth = '1' startday = '1' endyear = '1999' endmonth = '12' endday = '01'  timestep='monthlyday'></period>
	<path></path>

	<process processid ='organizeancillary' version = '3.0'>
		<parameters epsg = '4326'
			dsinst = 'NASA'
			dsname  = '3B43'
			dsversion = "7"
			regionid = 'trmm'
			regioncat = 'global'
			replacestr = 'YYYYMMDD'
			replacetag = 'yyyymmdd'
			datadir ='NASA/GES-DISC/3B43v7'
			datafile =''
			dataurl = "https://disc.gsfc.nasa.gov/precipitation/documentation/TRMM_README/TRMM_3B43_readme.shtml"
			metapath ="NASA/GES-DISC/README.TRMM_V7.pdf"  
    		metaurl="https://disc.gsfc.nasa.gov/precipitation/documentation/TRMM_README/TRMM_3B43_readme.shtml"
    		title = "TRMM and Other Data Precipitation Product 3B43"
    		label = "TRMM and Other Data Precipitation Product 3B43"
		> </parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<srcpath mainpath = "/Volumes/WETLAND/ANCILRAW" scenes = 'false' division = 'tiles' hdrfiletype = "HDF" datfiletype = "trmm"></srcpath>
		<tarpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = "tif" datfiletype = "tif"></tarpath>

		<rawin
			datadir = "NASA/GES-DISC/3B43v7"
    		datafile = "3B43.YYYYMMDD.7"
    		datalayer = "precipitation"
    		accessedate = "20170624"
    		theme = "rainfall"
    		subtheme = "rainfall"
    		copyright = ""
    	></rawin>
    	<compout source = "TRMM" product = "3B43" folder = "rainfall-original" band = "TRMM-3B43v7-precip" prefix = "rainfall" suffix = "_v7" scalefac = "1" offsetadd = "0" dataunit = "mm/month" celltype = 'Int16' cellnull = '-32768' measure = 'R'></compout>

		<rawin
			datadir = "NASA/GES-DISC/3B43v7"
    		datafile = "3B43.YYYYMMDD.7"
    		datalayer = "precip-relerr"
    		accessedate = "20170624"
    		theme = "precipitation"
    		subtheme = "precipitation error"
    		copyright = ""
    	></rawin>
    	<compout source = "TRMM" product = "3B43" folder = "rainfall-original" band = "TRMM-3B43v7-relerr" prefix = "rainfall-relerr" suffix = "_v7" scalefac = "1" offsetadd = "0" dataunit = "mm/month" celltype = 'Int16' cellnull = '-32768' measure = 'R'></compout>

		<rawin
			datadir = "NASA/GES-DISC/3B43v7"
    		datafile = "3B43.YYYYMMDD.7"
    		datalayer = "precip-relerr"
    		accessedate = "20170624"
    		theme = "rainfall"
    		subtheme = "gauge weight"
    		copyright = ""
    	></rawin>
    	<compout source = "TRMM" product = "3B43" folder = "rainfall-original" band = "TRMM-3B43v7-gauge-weight" prefix = "rainfall-gauge-weight" suffix = "_v7" scalefac = "1" offsetadd = "0" dataunit = "percent" celltype = 'Byte' cellnull = '255' measure = 'R'></compout>

		<yyyymmdd type = 'copydatum'>
			<compinattribute>datafile</compinattribute>
			<xcompinattribute>dataset</xcompinattribute>
			<xcompoutattribute>yyyydoy</xcompoutattribute>
			<replacex key = '01' compinreplace = 'jan' compoutreplace = '01'></replacex>
		</yyyymmdd>
	</process>

</organize>
```

Because the file naming of the TRMM 3B43 product is different for the period 2000 - 2010 compared to dates before and after, you have to create 3 separate xml files for downloading the data (1998-1999, 2000-2010 and 2011-2017).

I choose to put the extracted TRMM data in a separate folder "rainfall-original" because a few dates include nodata, and I want to get of them as explained in the next section.

### Cleaning the TRMM dataset

To get rid of nodata, I created another script. To run that script create the following xml file:

```
<?xml version='1.0' encoding='utf-8'?>
<manageprocess>
	<userproject userid = 'karttur' projectid = 'karttur' tractid= 'trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproject>
	<path></path>
	<period startyear = "1998" endyear = "2017" timestep='monthlyday'></period>


	<!-- mendtimeseries (TimeSeries) -->
	<process processid ='mendtimeseries'>
		<overwrite>Y</overwrite>
		<delete>N</delete>
		<parameters></parameters>

		<srcpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false'  division = 'region' hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<tarpath mainpath = "/Volumes/WETLAND/ANCILLARY" scenes = 'false'  division = 'region' hdrfiletype = 'tif' datfiletype = 'tif'></tarpath>
		<compin source = "TRMM" product = "3B43" folder = "rainfall-original" band = "TRMM-3B43v7-precip" prefix = "rainfall" suffix = "_v7"></compin>
		<compout source = "TRMM" product = "3B43" folder = "rainfall" band = "TRMM-3B43v7-precip" prefix = "rainfall" suffix = "_v7"></compout>

</manageprocess>
```

The process loads the complete dataset and checks one cell at the time, any nodata is replaced by the interpolated values from adjacent dates.

### Masking land areas

The TRMM data covers both land and water, but for this project I am only interested in the rainfall over land. Instead of using a spatial dataset for land masses, I use the refET data to identify land. This has the advantage of also assuring that the regions with valid data in both datasets overlap exactly.

Also this is implemented in Karttur's GeoImagine framework.

```
<?xml version='1.0' encoding='utf-8'?>
<runprocess>
	<userproject userid = 'karttur' projectid = 'karttur' tractid= 'trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproject>
	<path></path>
	<period startyear = "1998" endyear = "2016" timestep='monthlyday'></period>


	<!-- staticmasking -->
	<process processid = 'setmask' version = '1.3'>
		<parameters staticmask = 'True' mask='landmask-trmm'></parameters>
		<srcpath mainpath = "/Volumes/CZ/ANCILLARY" scenes = 'false'  division = 'region' hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<tarpath mainpath = "/Volumes/CZ/ANCILLARY" scenes = 'false' division = 'region' hdrfiletype = 'tif' datfiletype = 'tif'></tarpath>
    	<compin source = "TRMM" product = "3B43" folder = "rainfall" band = "TRMM-3B43v7-precip" prefix = "rainfall" suffix = "_v7"></compin>
		<compout source = "TRMM" product = "3B43" folder = "rainfall" band = "TRMM-3B43v7-precip-masked" prefix = "rainfall" suffix = "_v7-masked"></compout>
	</process>

</runprocess>
```

The input data is now ready, and the next blog will handle time series analysis of a single dataset.
