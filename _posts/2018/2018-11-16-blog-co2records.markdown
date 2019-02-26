---
layout: post
title: CO<sub>2</sub> observation records
modified: '2018-11-16 T18:17:25.000Z'
categories: blog
excerpt: "Download and import CO2 records"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-16 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

The escalating global climate change is driven by increased atmospheric content of greenhouse gases, in particular carbon dioxide (CO<sub>2</sub>). The atmospheric CO<sub>2</sub> content (usually given as parts per million, ppm) has been continually measured at Mauna Loa, Hawaii since 1958. Today the atmospheric CO<sub>2</sub> content is also measured at several other places. Global average estimates go back to 1980. In this post you will import historical records of atmospheric CO<sub>2</sub> levels.

# Access data

The records of observed CO<sub>2</sub> are available from different sites. Karttur´s GeoImagine Framework is set up for importing climate index data from [datahub.io](https://datahub.io/core/co2-ppm).

You can choose any records you like. In this tutorial post, and all the following posts, I will use the iconic Mauna Loa record and the global average, both at a monthly resolution.

## Data format

Karttur's import function for CO<sub>2</sub> records expects an ASCII (normal text) file with comma separation (.csv). The first row should be the row headers, with the columns as shown in the example below:

```
Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1958-03-01,1958.208,315.71,315.71,314.62,-1
1958-04-01,1958.292,317.45,317.45,315.29,-1
```

## Download data

Download the CO2 record(s) that you want to include in your database from [datahub.io](https://datahub.io/core/co2-ppm). At present the Framework only uses monthly data.
Make sure that the filename does not contain any underscore ("\_") and that the file extension is ".csv". You can save the files to any location on your machine. You only need to remember where you put them when you define the import path in the next section.

## Import as ancillary Data

The observed CO2 records data are imported into Karttur´s GeoImagine Framework as ancillary data. But the CO<sub>2</sub> observatioans are saved in the database schema (_climateindex_). The xml file below imports the Mauna Loa and global monthly records.

<button id= "toggleimportclimateindex" onclick="hiddencode('importclimateindex')">Hide/Show importclimateindex.xml</button>

<div id="importclimateindex" style="display:none">

{% capture text-capture %}
{% raw %}

```
<organize>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'ancillary'></userproj>

	<process processid ='organizeancillary' dsversion = '3.0'>
		<overwrite>True</overwrite>
		<parameters importdef='co2record'
			epsg = '4326'
			instid = 'NOAA'
			dsname  = 'climateindex'
			dsversion = "1.0"
			accessdate = "20181211"
			copyright = ""
			regionid = 'global'
			regioncat = 'global'
			dataurl = "https://datahub.io/core/co2-ppm"
			metaurl="https://datahub.io/core/co2-ppm"
			title = "NOAA climate indexes"
			label = "NOAA climate indexes"
		> </parameters>

		<srcpath volume = "Karttur3tb" hdrfiletype = "csv" ></srcpath>
		<dstpath volume = "Karttur3tb" hdrfiletype = "csv"></dstpath>

		<srcraw
			id="co2-mm-gl"
			datadir ='climateindex'
			datafile = "co2-mm-gl"
			theme = "climateindex"
			subtheme = "co2"
			cellnull = '-9.99'
			title = "Global monthly CO2"
			label = "Global monthly CO2"
		></srcraw>
		<dstcomp>
			<co2-mm-gl source = "NOAA" product = "climateindex" folder = "climateindex" band = "co2-mm-gl" prefix = "co2-mm-gl" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "ppm" celltype = 'text' cellnull = '-999' measure ='R' masked='N'>
			</co2-mm-gl>
		</dstcomp>

		<srcraw
			id="co2-mm-mlo"
			datadir ='climateindex'
			datafile = "co2-mm-mlo"
			theme = "climateindex"
			subtheme = "co2"
			cellnull = '-9.99'
			title = "Mauna Loa monthly CO2"
			label = "Mauna Loa monthly CO2"
		></srcraw>
		<dstcomp>
			<co2-mm-mlo source = "NOAA" product = "climateindex" folder = "climateindex" band = "co2-mm-mlo" prefix = "co2-mm-mlo" suffix = ""
			scalefac = "1" offsetadd = "0" dataunit = "ppm" celltype = 'text' cellnull = '-999' measure ='R' masked='N'>
			</co2-mm-mlo>
		</dstcomp>
	</process>
</organize>
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

## Plot and analyse trend in atmospheric CO<sub>2</sub>

Plotting, decomposing and analysing the variations in atmospheric CO<sub>2</sub> is covered in [this](../blog-climate-decmoposition/) post.
