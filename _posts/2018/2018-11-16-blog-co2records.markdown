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
climateIndex-0100_import-co2records: climateIndex-0100_import-co2records
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

The escalating global climate change is driven by increased atmospheric content of greenhouse gases, in particular carbon dioxide (CO<sub>2</sub>). The atmospheric CO<sub>2</sub> content (usually given as parts per million, ppm) has been continually measured at Mauna Loa, Hawaii since 1958. Today the atmospheric CO<sub>2</sub> content is also measured at several other places. Global average estimates go back to 1980. In this post you will import historical records of atmospheric CO<sub>2</sub> levels.

## Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../setup-copy-project-eclipse/). The Framework [postgres database must be setup](../setup-db/) and the [processes defined](../setup-processes/).

# CO<sub>2</sub> records

## Access data

The records of observed CO<sub>2</sub> are available from different sites. Karttur´s GeoImagine Framework is set up for importing climate index data from [datahub.io](https://datahub.io/core/co2-ppm).

You can choose any records you like. In this tutorial post, and all the following posts, I will use the iconic Mauna Loa record and the global average, both at a monthly resolution.

### Data format

Karttur's import function for CO<sub>2</sub> records expects an ASCII (normal text) file with comma separation (.csv). The first row should be the column headers, with the columns as shown in the example below:

```
Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1958-03-01,1958.208,315.71,315.71,314.62,-1
1958-04-01,1958.292,317.45,317.45,315.29,-1
```

### Download data

Download the CO2 record(s) that you want to include in your database from [datahub.io](https://datahub.io/core/co2-ppm). At present the Framework only uses monthly data.
Make sure that the destination filename does not contain any underscore ("\_") and that the file extension is ".csv". You can save the files to any location on your machine. You only need to remember where you put them when you define the import path in the next section.

### Import as ancillary Data

The observed CO<sub>2</sub> records data are imported into Karttur´s GeoImagine Framework as ancillary data. But the CO<sub>2</sub> observatioans are saved in the database schema _climateindex_. The xml file below imports the Mauna Loa and global monthly records.

{% capture foo %}{{page.climateIndex-0100_import-co2records}}{% endcapture %}
{% include xml/climateIndex-0100_import-co2records.html foo=foo %}

### Project file

The project file is the same as used for [importing climate indexes](../blog-climateindex) in the previous post, but with one (1) additional link to the xml file defining the plots shown above (projFN = '/doc/ClimateIndexes/xml/climateIndex-0100_import-co2records.xml'):

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    #projFN = '/doc/ClimateIndexes/xml/climateIndex-0100_import-NOAA.xml'
    projFN = '/doc/ClimateIndexes/xml/climateIndex-0100_import-co2records.xml'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```

### Plot and analyse trend in atmospheric CO<sub>2</sub>

Plotting, decomposing and analysing the variations in atmospheric CO<sub>2</sub> is covered in the [next](../blog-climate-graph/) post.
