---
layout: post
title: FAO reference evapotranspiration
modified: '2018-11-01 20:17'
categories: blog
excerpt: Accessing, downloadign and organizing FAO reference evapotranspiration
tags:
  - FAO reference evapotranspiration
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-01 22:03'
comments: true
share: true

ancillary-import-FAO-refevap: ancillary-import-FAO-refevap
convert-FAO-refevap_daytomonth: convert-FAO-refevap_daytomonth
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post takes you through the steps to download and prepare data on global monthly statistical reference evapotranspiration from the Food and Agriculture Organization of the United Nations (FAO).

# FAO reference evapotranspiration

The FAO dataset on reference evapotranspiration (refET) is composed of monthly average layers representing 1961 to 1990. The refET varies dependent of many factors, including temperature, wind and atmospheric water vapor pressure, but for this study we will use monthly average data. The alternative, to calculate dynamic refET is complicated and the data demands exceeds the available. The dataset was created by [Climate Research Centre (Tyndall centre) in the UK as CL version 2.0](https://crudata.uea.ac.uk/~timm/grid/CRU_CL_2_0.html), but is no longer accessible from CRU, instead you have to download it from FAO.

## Project module

The project module file (<span class='file'>projFaoRefET.py</span>) is available in the <span class='package'>Project</span> package [projects](https://github.com/karttur/geoimagine-projects/).

<button id= "toggleprojfile" onclick="hiddencode('projfile')">Hide/Show projFaoRefET.py</button>

<div id="projfile" style="display:none">

{% capture text-capture %}
{% raw %}

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    #projFN ='/full/path/to/FAOrefet_YYYYMMDD.txt'
    projFN ='doc/FAOrefet/FAOrefet_YYYYMMDD.txt'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Process chain

The project file links to an ASCII text file that contains a single xml files to executes.

```
projFN ='doc/FAOrefet/faorefet_YYYYMMDD.txt'
```

As the path to the project file does **not** start with a slash "/", the path is relative to the project module itself. The [project package available on Karttur's GitHub page](../../../geoimagine-projects) contains the path and the files required for running the process chain. Both the text file and the xml files are available under the subfolder [<span class='file'>doc/FAOrefet</span>](../../../geoimagine-projects/doc/FAOrefet).

### Access FAO refET

The FAO reference evapotranspiration (refET) dataset is available from the [FAO Geonetwork server](http://www.fao.org/geonetwork) and at the time of writing the refET dataset is [here](http://www.fao.org/geonetwork/srv/en/metadata.show?id=7416).

At the top of the box called Transfer options there is an option to download the dataset (Global map of monthly reference evapotranspiration - 10 arc minutes - ASCII-grid). If you click, you will get all the monthly files. There is also a 3 arc minutes water balance version (the last item in the Transfer option box), but as we are going to use the refET together with the 15 arc minutes resolution of the tropical [TRMM rainfall datasets](../blog-TRMM/), use the 10 arc min version of the reference evapotranspiration.

#### Import the refET

The downloaded refET data is in ASCII (pure text) format, you can open one of the monthly files and read the centent.

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

{% capture foo %}{{page.ancillary-import-FAO-refevap}}{% endcapture %}
{% include xml/ancillary-import-FAO-refevap.html foo=foo %}

### Convert to monthly refET

The FAO refET data comes as average daily mm x 10. To simplify the calculations, I convert this to monthly refEt in mm (x 1) which also means that the unit changes to mm/month. You can do the conversion manually, but I use the Karttur GeoImagine Framework through the following xml file:

{% capture foo %}{{page.convert-FAO-refevap_daytomonth}}{% endcapture %}
{% include xml/convert-FAO-refevap_daytomonth.html foo=foo %}
