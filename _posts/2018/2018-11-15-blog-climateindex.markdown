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
climateIndex-0100_import-NOAA: climateIndex-0100_import-NOAA
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

Internal dynamics of the climate system is an important forcing of both seasonal and inter-annual climate variations. Climate indexes capturing the key system variability have been widely used for understanding and forecasting e.g. the El Nino Southern Oscillation (ENSO), the North Atlantic Oscillation (NAO) and Pacific Decadal Oscillation (PDO). This post shows how to import various climate system indices into Karttur's GeoImagine Framework. Some of the most popular indices are summarized by [Universität Hamburg](https://icdc.cen.uni-hamburg.de/1/daten/climate-indices/popular-climate-indices.html) that also links to some of the original data sources. In here, however, you will get all the indexes from [NOAA ESRL](https://www.esrl.noaa.gov/psd/data/climateindices/list/) as that is easier. Also because all the the data are then in the same format.

## Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../blog-copy-project-eclipse/). The Framework [postgres database must be setup](../blog-setup-db/) and the [processes defined](../blog-setup-processes/).

# Climate indexes

## Access data

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

### Data format

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

### Download data

Start from the [climate index list](https://www.esrl.noaa.gov/psd/data/climateindices/list/) page and click on the index you want include in the Framework. When you get the page with the index values (as shown for PDO above), save the url as a plain text file. In Mac OSX you should be able to accept the default values in the <span class='window'>Save Page As...</span> to save the index data as a simple text file, but with the extension <span class='file'>.data</span> (e.g. <span class='file'>pdo.data</span> for the PDO index data). The import function expects the file to be named with the extension <span class='file'>.data</span> and checks that the basename (before the extension dot) corresponds with the index name at import.

You can save the climate index text files to any location on your machine. You only need to remember where you put them when you define the import path in the next section.

## Project

The GeoImagine Framework contains a prepared project on climate index processing. It is availaible under the project folder on GithHub as <span class ='file'>projClimateIndexes.py</span>, The following excerpt of the module imports the downloaded and organized files with climate index data:

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    projFN = 'doc/ClimateIndexes/xml/climateIndex-0100_import-NOAA.xml'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```

### Import as ancillary Data

The climate index data are imported into Karttur´s GeoImagine Framework as ancillary data. But the climate indexes are registered to its own database schema (_climateindex_). The (hidden) xml file below (<span class='file'>climateIndex-0100_import-NOAA.xml</span> linked in the project module above) imports the seven indexes listed above. Note that the nodata differs for the different indexes. This is checked by the import process, but must be correct for the import to finish.

{% capture foo %}{{page.climateIndex-0100_import-NOAA}}{% endcapture %}
{% include xml/climateIndex-0100_import-NOAA.html foo=foo %}
