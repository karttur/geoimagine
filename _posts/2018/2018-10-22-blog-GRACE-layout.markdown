---
layout: post
title: GRACE map layout and media export
modified: '2018-10-22 T18:17:25.000Z'
categories: blog
excerpt: "Map layout and media export of GRACE data using Karttur's GeoImagine Framework"
tags:
  - GRACE
  - process chain
  - createscaling
  - addrasterpalette
  - exportlegend
  - exporttobyteancillary
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-22 T18:17:25.000Z'
comments: true
share: true

figure2A: ols-sl-grace-ave_cmwater_global_2003-2016_RL05-f-A
figure2B: ts-mdsl-grace-ave_cmwater_global_2003-2016_RL05-f-A
figure2C: ts-losl-grace-ave_cmwater_global_2003-2016_RL05-f-A
figure2D: ts-hisl-grace-ave_cmwater_global_2003-2016_RL05-f-A

GRACE-0001_createscaling: GRACE-0001_createscaling
GRACE-0002_createpalettes: GRACE-0002_createpalettes
GRACE-0003_createlegends: GRACE-0003_createlegends
GRACE-0005_exportlegend: GRACE-0005_exportlegend
GRACE-0910_ExporttoByte_timespanA_2003-2016: GRACE-0910_ExporttoByte_timespanA_2003-2016
GRACE-0925_graticule_ExporttoSVG: GRACE-0925_graticule_ExporttoSVG
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post presents a processing chain for creating map layouts and export media for data from the [Gravity Recovery and Climate Experiment (GRACE)](https://grace.jpl.nasa.gov) mission in Kartur's GeoImagine Framework.

## Prerequisites

You must have completed the data processing of GRACE data in the [previous](../blog-GRACE/) post.

# GRACE

## Project module

The project module file (<span class='file'>projGRACE.py</span>) is available in the <span class='package'>Project</span> package [projects](https://github.com/karttur/geoimagine-projects/).

<button id= "toggleprojfile" onclick="hiddencode('projfile')">Hide/Show projGRACE.py</button>

<div id="projfile" style="display:none">

{% capture text-capture %}
{% raw %}

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    projFN ='doc/GRACE/grace_20190216.txt'
    projFN ='doc/Layout/grace-layout_20190216.txt'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```

{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Process chain

The project file links to an ASCII text file that contains a list of the xml files to execute. The layout and export processes are under the folder <span class='file'>Layout</span>.

```
projFN ='doc/Layout/grace-layout_20190216.txt'
```

As the path to the project file does **not** start with a slash "\\", the path must be relative to the project module itself. The [project package available on Karttur's GitHub page](../../../geoimagine-projects) contains the path and the files required for running the process chain.

<button id= "toggleProcessChain" onclick="hiddencode('ProcessChain')">Hide/Show grace-layout_YYYYMMDD.txt</button>

<div id="ProcessChain" style="display:none">
{% capture text-capture %}
{% raw %}

```
###################################
###################################
###            GRACE            ###
###################################
###################################

###################################
###            Layout           ###
###################################

## Create scaling for GRACE compids ##
GRACE-0001_createscaling.xml

## Create palettes for GRACE ##
GRACE-0002_createpalettes.xml

## Create legend for GRACE ##
GRACE-0003_createlegends.xml

## Export legends for GRACE ##
GRACE-0005_exportlegend.xml

## Create movie clock ##
#smap_createmovieclock.xml

###################################
###        Export media         ###
###################################

## Export graticule as svg ##
#GRACE-0925_graticule_ExporttoSVG.xml

## Export annual statistics, trends and changes ##
#GRACE-0910_ExporttoByte_timespanA_2003-2016.xml
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>


#### Layout

To produce a color map, you need to scale your original map to range between 0 and 250 (or lower), and then assign the palette. To create and export a layout map or image, you must pre-define the scaling for the _composition_ to export. All exported images (maps) are scaled to Byte range (0 to 255), and the scaling should achieve that while preserving a relevant distribution of numerical cell values. By default, the Framework assumes that null (nodata) will equal 255 in the scaled export, and that the values 251 to 254 represent colors for overlays, frames and text etc. Values in the range 0 to 250 (or lower) should represent the thematic feature of the layer.

##### Scaling

The GRACE data is strongly skewed because of the glacier melt in Greenland and West Antarctica. The melting of the glaciers causes a loss in water and thus gravitational pull. Using a linear scale for representing the global change in water equivalent thickness that include the melting glacier thus becomes tricky. I choose to use a solution with a power function to capture both large and small changes. This, however, can be deceptive but you need to choose some legend scaling in order to show your map. The process [<span class='package'>createscaling</span>](../../subprocess/subproc-createscaling/) adds the scaling to the database.

{% capture foo %}{{page.GRACE-0001_createscaling}}{% endcapture %}
{% include xml/GRACE-0001_createscaling.html foo=foo %}

##### Palette

![Grace palette]({{ site.commonurl }}/images/cmwater-annual-stats-a_avg-grace-ave_grace.jpg){: .pull-left}


If you want to produce color maps showing the GRACE data and the results of your trend analysis, you also need to create the palette(s) to use. All palettes must be saved to the database before use, with the process [<span class='package'>addrasterpalette</span>](../../subprocess/subproc-addrasterpalette/). Glancing at the color ramp of the online GRACE data at the [official homepage](https://grace.jpl.nasa.gov/data/get-data/monthly-mass-grids-land/), I set the following palette:

{% capture foo %}{{page.GRACE-0002_createpalettes}}{% endcapture %}
{% include xml/GRACE-0002_createpalettes.html foo=foo %}

##### Create Legend

The process [<span class='package'>createlegend</span>](../../subprocess/subproc-createlegend/) defines the legend layout for _compositions_. When producing the legends the colors and denominations of the actual legend items are taken from the definition of palettes and scalings respectively.

{% capture foo %}{{page.GRACE-0003_createlegends}}{% endcapture %}
{% include xml/GRACE-0003_createlegends.html foo=foo %}

##### Export legend

![Grace palette]({{ site.commonurl }}/images/cmwater-a-stats_avg-grace-ave-grace.jpg){: .pull-right}

With the process [<span class='package'>exportlegend</span>](../../subprocess/subproc-exportlegend/) you can create stand alone legends. To work you mtust have defined the scaling, the palette and the legend in the previous steps. The process produces two legends, as a Scalable Vector Graphics (<span class='file'>.svg</span> file) and a <span class='file'>.png</span> file. The svg is saved as a www compliant xml, and you can use it either for editing in a graphics program or inclusion in a web-page (or both).

{% capture foo %}{{page.GRACE-0005_exportlegend}}{% endcapture %}
{% include xml/GRACE-0005_exportlegend.html foo=foo %}

##### Export overlay

When you export the actual data as maps in the next step, you can add a vector overlay. In the Framework you can convert any vector to an <span class='file'>svg</span> and then include it as an overlay. Only a single <span class='file'>svg</span> file can be used as overlay when exporting raster data to image maps. But you can manually compose an <span class='file'>svg</span> from multiple <span class='file'>svg</span> exported vectors, e.g. using a graphics editor.

For the GRACE data a graticule is exported from a vector file including longitude and latitude lines for each 45 degrees.

{% capture foo %}{{page.GRACE-0925_graticule_ExporttoSVG}}{% endcapture %}
{% include xml/GRACE-0925_graticule_ExporttoSVG.html foo=foo %}

##### Export color map

Having defined the scaling and a palette for the different layers, you can export the layers as color maps (colored GeoTiff images). The process for doing that is [<span class='package'>exporttobyteancillary</span>](../../subprocess/subproc-exporttobyteancillary/).

{% capture foo %}{{page.GRACE-0910_ExporttoByte_timespanA_2003-2016}}{% endcapture %}
{% include xml/GRACE-0910_ExporttoByte_timespanA_2003-2016.html foo=foo %}

<figure class="half">
	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2A].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2B].file }}">

  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2C].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2D].file }}">

	<figcaption>Maps of the change in water equivalent thickness 2003 to 2016. The top row shows the Ordinary Least Square (OLS) slope and the Theil-Sen (TS) median slope. The bottom row shows the lower and higher 95 % confidence limit for TS slope. </figcaption>
</figure>
