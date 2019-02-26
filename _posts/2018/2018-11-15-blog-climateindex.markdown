---
layout: post
title: Climate indexes
modified: '2018-11-15 T18:17:25.000Z'
categories: blog
excerpt: "Download and import climate indexes"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-15 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

Internal dynamics of the climate system is an important forcing of both seasonal and inter-annual climate variations. Climate indexes capturing the key system variability have been widely used for understanding and forecasting e.g. the El Nino Southern Oscillation (ENSO), the North Atlantic Oscillation (NAO) and Pacific Decadal Oscillation (PDO). This post shows how to import various climate system indices into Karttur's GeoImagine Framework. Some of the most popular indices are summarized by [Universität Hamburg](https://icdc.cen.uni-hamburg.de/1/daten/climate-indices/popular-climate-indices.html) that also links to some of the original data sources. In here, however, you will get all the indexes from [NOAA ESRL](https://www.esrl.noaa.gov/psd/data/climateindices/list/) as that is easier. Also because all the the data are then in the same format.

# Access data

The standard climate indexes are available from different internet sites. Karttur´s GeoImagine Framework is set up for importing climate index data from [NOAA ESRL](https://www.esrl.noaa.gov/psd/data/climateindices/list/). At time of writing this site lists approximately 40 different indexes. The indexes are broadly divided into 7 categories:

- Teleconnections
- Atmosphere
- Precipitation
- El Nino Southern Oscillation (ENSO)
- Sea Surface Temperature (SST):Pacific
- Sea Surface Temperature (SST):Atlantic
- Other

You can choose any indexes you like. In this tutorial post, and all the following posts, I will use the following indexes:

- PNA (Pacific North American Index) (Teleconnetions)
- NAO (North Atlantic Oscillation) (Teleconnetions)
- PDO (Pacific Decadal Oscillation) (Teleconnetions)
- Nino3 (East Central Tropical Pacific SST) (ENSO, SST:Pacific)
- BEST (Bivariate ENSO Timeseries ) (ENSO)
- SOI (Southern Oscillation Index) (Atmosphere)
- Solar flux (Other)

## Data format

Karttur's import function for climate index data expects an ASCII (normal text) file where the data for each year is given in 13 columns. The first columns should represent the year (YYYY) and the following 12 columns each month. This format corresponds exactly to the format of the index data available from [NOAA ESRL](https://www.esrl.noaa.gov/psd/data/climateindices/list/). The example below shows part of the [PDO data](https://www.esrl.noaa.gov/psd/data/correlation/pdo.data) in the expected format.

```
1948 2018
1948    -0.11  -0.74  -0.03  -1.33  -0.23   0.08  -0.92  -1.56  -1.74  -1.32  -0.89  -1.70
1949    -2.01  -3.60  -1.00  -0.53  -1.07  -0.70  -0.56  -1.30  -0.93  -1.41  -0.83  -0.80
...
2018     0.70   0.37  -.05    0.11   0.11  -0.04   0.11   0.18   0.09  -9.90  -9.90  -9.90
-9.90
PDO: pacific decadal oscillation
info at http://www.esrl.noaa.gov/psd/data/climateindices/list/
from http://jisao.washington.edu/pdo/PDO.latest
updated 8/7/2018
```

Apart from the actual data, the import process also reads the first and last year in the first row, and the nodata identifier in the row following the tabulated values.

## Download data

Start from the [climate index list](https://www.esrl.noaa.gov/psd/data/climateindices/list/) page and click on the index you want include in the Framework. When you get the page with the index values (as shown for PDO above), save the url as a plain text file. In Mac OSX you should be able to accept the default values in the <span class='window'>Save Page As...</span> to save the index data as a simple text file, but with the extension <span class='file'>.data</span> (e.g. <span class='file'>pdo.data</span> for the PDO index data). The import function expects the file to be named with the extension <span class='file'>.data</span> and checks that the basename (before the extension dot) corresponds with the index name at import.

You can save the climate index text files to any location on your machine. You only need to remember where you put them when you define the import path in the next section.

## Import as ancillary Data

The climate index data are imported into Karttur´s GeoImagine Framework as ancillary data. But the climate indexes are registered to its own database schema (_climateindex_). The (hidden) xml file below imports the seven indexes listed above. Note that the nodata differs for the different indexes. This is checked by the import process, but must be correct for the import to finish.

<button id= "toggleimportclimateindex" onclick="hiddencode('importclimateindex')">Hide/Show importclimateindex.xml</button>

<div id="importclimateindex" style="display:none">

{% capture text-capture %}
{% raw %}

```
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>

	<process processid ='organizeancillary' dsversion = '3.0'>
		<overwrite>True</overwrite>
		<parameters importdef='climateindex'
			epsg = '4326'
			instid = 'NOAA'
			dsname  = 'climateindex'
			dsversion = "1.0"
			accessdate = "20181211"
			copyright = ""
			regionid = 'global'
			regioncat = 'global'
			dataurl = "https://www.esrl.noaa.gov/psd/data/climateindices/list/"
			metaurl="https://www.esrl.noaa.gov/psd/data/climateindices/list/"
			title = "NOAA climate indexes"
			label = "NOAA climate indexes"
		> </parameters>

		<srcpath volume = "Karttur3tb" hdrfiletype = "data" ></srcpath>
		<dstpath volume = "Karttur3tb" hdrfiletype = "data"></dstpath>

		<srcraw
			id="best"
			datadir ='climateindex'
			datafile = "best"
			theme = "climateindex"
			subtheme = "ENSO"
			cellnull = '-9.99'
			title = "Bivariate ENSO Timeseries"
			label = "Bivariate El Nino Southern Oscillaltion Timeseries (Climate index)"
		></srcraw>
		<dstcomp>
			<best source = "NOAA" product = "climateindex" folder = "climateindex" band = "best" prefix = "best" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</best>
		</dstcomp>

		<srcraw
			id="pna"
			datadir ='climateindex'
			datafile = "pna"
			theme = "climateindex"
			subtheme = "Teleconnections"
			cellnull = '-99.9'
			title = "Pacific North American Index"
			label = "Pacific North American Index (Teleconnetion climate index)"
		></srcraw>
		<dstcomp>
			<pna source = "NOAA" product = "climateindex" folder = "climateindex" band = "pna" prefix = "pna" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</pna>
		</dstcomp>

		<srcraw
			id="nao"
			datadir ='climateindex'
			datafile = "nao"
			theme = "climateindex"
			subtheme = "Teleconnection"
			cellnull = '-99.9'
			title = "North Atlantic Oscillation"
			label = "North Atlantic Oscillation (Teleconnetion climate index) from CPC"
		></srcraw>
		<dstcomp>
			<nao source = "NOAA" product = "climateindex" folder = "climateindex" band = "nao" prefix = "nao" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</nao>
		</dstcomp>

		<srcraw
			id="pdo"
			datadir ='climateindex'
			datafile = "pdo"
			theme = "climateindex"
			subtheme = "Teleconnection"
			cellnull = '-9.9'
			title = "Pacific Decadal Oscillation"
			label = "Pacific Decadal Oscillation (Teleconnetion climate index)"
		></srcraw>
		<dstcomp>
			<pdo source = "NOAA" product = "climateindex" folder = "climateindex" band = "pdo" prefix = "pdo" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</pdo>
		</dstcomp>

		<srcraw
			id="nina3"
			datadir ='climateindex'
			datafile = "nina3"
			theme = "climateindex"
			subtheme = "ENSO"
			cellnull = '-99.9'
			title = "East Central Tropical Pacific SST"
			label = "East Central Tropical Pacific SST (ENSO + Pacific Sea Surfrance Temperature climate index) using ersstv5 from CPC"
		></srcraw>
		<dstcomp>
			<nina3 source = "NOAA" product = "climateindex" folder = "climateindex" band = "nina3" prefix = "nina3" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</nina3>
		</dstcomp>

		<srcraw
			id="soi"
			datadir ='climateindex'
			datafile = "soi"
			theme = "climateindex"
			subtheme = "Atmosphere"
			cellnull = '-99.99'
			title = "Southern Oscillation Index"
			label = "Southern Oscillation Index (Atmosphere Climate Index)"
		></srcraw>
		<dstcomp>
			<soi source = "NOAA" product = "climateindex" folder = "climateindex" band = "soi" prefix = "soi" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</soi>
		</dstcomp>

		<srcraw
			id="solar"
			datadir ='climateindex'
			datafile = "solar"
			theme = "climateindex"
			subtheme = "Solar"
			cellnull = '-999'
			title = "Solar Flux Index"
			label = "Southern Oscillation Index (Atmosphere Climate Index)"
		></srcraw>
		<dstcomp>
			<solar source = "NOAA" product = "climateindex" folder = "climateindex" band = "solar" prefix = "solar" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "index" celltype = 'text' cellnull = '-999' measure ='N' masked='N'>
			</solar>
		</dstcomp>

	</process>

</organize>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>
