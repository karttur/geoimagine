---
layout: post
title: TRMM map layout and media export
modified: '2018-11-06 20:17'
categories: blog
excerpt: Accessing, downloading and organizing TRMM precipitation data
tags:
  - TRMM
  - Tropical Rainfall Measurement Mission
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-06 22:03'
comments: true
share: true
movie1: rainfall_3b43_trmm_199801-201807_v7-f

TRMM-0001_createscaling: TRMM-0001_createscaling
TRMM-0002_createpalettes: TRMM-0002_createpalettes
TRMM-0003_createlegends: TRMM-0003_createlegends
TRMM-0004_addmovieclock: TRMM-0004_addmovieclock
TRMM-0005_exportlegend: TRMM-0005_exportlegend
TRMM-0900_ExporttoByte_M: TRMM-0900_ExporttoByte_M
TRMM-0910_ExporttoByte_timespanA_1998-2017: TRMM-0910_ExporttoByte_timespanA_1998-2017
TRMM-0920_ExporttoByte_timespanM: TRMM-0920_ExporttoByte_timespanM
TRMM-0925_ExporttoSVG: TRMM-0925_ExporttoSVG
TRMM-0950_movieframes_M: TRMM-0950_movieframes_M
TRMM-0960_movieclock_M: TRMM-0960_movieclock_M
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>
# Introduction

This post covers how to define layouts and export media files for precipitation data from the [Tropical Rainfall Measurement Mission (TRMM)](https://pmm.nasa.gov/trmm) into Karttur´s GeoImagine Framework.

## Prerequisites

You must have completed the data processing of TRMM data in the [previous](../blog-TRMM/) post.

# TRMM

## Project module

Other processing of TRMM data is done from within Karttur's GeoImagine Framework. The project module file (<span class='file'>projTRMM.py</span>) is available in the project  package [<span class='package'>projects</span>](https://github.com/karttur/geoimagine-projects/).

<button id= "toggleprojfile" onclick="hiddencode('projfile')">Hide/Show projTRMM.py</button>
<div id="projfile" style="display:none">
{% capture text-capture %}
{% raw %}

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    projFN ='doc/TRMM/TRMM_YYYYMMDD.txt'
    projFN ='doc/Layout/TRMM-layout_YYYYMMDD.txt'

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
projFN ='doc/Layout/TRMM-layout_YYYYMMDD.txt'
```

As the path to the project file does **not** start with a slash "\\", the path must be relative to the project module itself. The [project package available on Karttur's GitHub page](../../../geoimagine-projects) contains the path and the files required for running the process chain. Both the text file and the xml files are available under the subfolder [<span class='file'>doc/TRMM</span>](../../../geoimagine-projects/doc/TRMM).

<button id= "toggleProcessChain" onclick="hiddencode('ProcessChain')">Hide/Show TRMM_YYYYMMDD.txt</button>

<div id="ProcessChain" style="display:none">
{% capture text-capture %}
{% raw %}

```
###################################
###################################
###             TRMM            ###
###################################
###################################

###################################
###            Layout           ###
###################################

## Create scaling for TRMM data ##
#TRMM-0001_createscaling.xml

## Create the TRMM palettes ##
#TRMM-0002_createpalettes.xml

## Create legends for TRMM ##
#TRMM-0003_createlegends.xml

## Create TRMM movieclock ##
#TRMM-0004_addmovieclock.xml

## Export legend ##
#TRMM-0005_exportlegend.xml

###################################
###        Export media         ###
###################################

## Export shoreline vector to fit the TRMM data
#TRMM-0925_ExporttoSVG.xml

## Export png images ##
#TRMM-0900_ExporttoByte_M.xml
#TRMM-0910_ExporttoByte_timespanA_1998-2017.xml
#TRMM-0920_ExporttoByte_timespanM.xml

## Create TRMM movieframes (1998 to 2017) ##
#TRMM-0950_movieframes_M.xml

## Create movieclock, the process creates two shell scripts that must by run ##
#TRMM-0960_movieclock_M.xml
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

#### Layout

If you want to create graphical outputs you need to define layouts for the TRMM data, including for scaling the data to Byte (0-255) range and define color palettes. if you want to produce an animated movie you can also define a movie clock and timeline for each composition you want animate (you can also use the default movie clock and timeline).

##### Scaling

Annual precipitation across the globe varies from 0 to over 8000 mm. Linearly scaling this range into the byte range of 0-255 is not useful. Some non-linear function is required. Either you can transform the data as a pre-process, or apply a power function on the fly when exporting the data. The scaling must be preset and defined in the database prior to export. The  [<span class='package'>createscaling</span>](../../subprocess/subproc-createscaling) defined in the (hidden) xml file below defines a power function for rescaling the TRMM precipitation data on the fly when exporting layout maps.

{% capture foo %}{{page.TRMM-0001_createscaling}}{% endcapture %}
{% include xml/TRMM-0001_createscaling.html foo=foo %}

##### Palettes

The default Karttur palette for precipitation comes in two versions, one for linear data, and one for logarithmic data. The former can, however, also be used after applying a power function as part of the layout export process as done in previous section.

Because of the relative complexity of the precipitation palettes, the default palettes for precipitation variation and error are defined separately, as is the palette for precipitation change. All the standard precipitation palettes are created from the xml below calling[<span class='package'>addrasterpalette</span>](../../subprocess/subproc-addrasterpalette) process:

{% capture foo %}{{page.TRMM-0002_createpalettes}}{% endcapture %}
{% include xml/TRMM-0002_createpalettes.html foo=foo %}

##### Create Legend

The process [<span class='package'>createlegend</span>](../../subprocess/subproc-createlegend/) defines the legend layout for _compositions_. When producing the legends the colors and denominations of the actual legend items are taken from the definition of palettes and scalings respectively.

{% capture foo %}{{page.TRMM-0003_createlegends}}{% endcapture %}
{% include xml/TRMM-0003_createlegends.html foo=foo %}

##### Export legend

With the process [<span class='package'>exportlegend</span>](../../subprocess/subproc-exportlegend/) you can create stand alone legends. To work you mtust have defined the scaling, the palette and the legend in the previous steps. The process produces two or three legends: a Scalable Vector Graphics (<span class='file'>.svg</span> file) a <span class='file'>.png</span> file, and if requested also a compressed <span class='file'>.jpg</span> file. The svg is saved as a www compliant xml, and you can use it either for editing in a graphics program or inclusion in a web-page (or both).

{% capture foo %}{{page.TRMM-0005_exportlegend}}{% endcapture %}
{% include xml/TRMM-0005_exportlegend.html foo=foo %}

##### Export overlay

When you export the actual data as maps in the next step, you can add a vector overlay. In the Framework you can convert any vector to an <span class='file'>svg</span> and then include it as an overlay. Only a single <span class='file'>svg</span> file can be used as overlay when exporting raster data to image maps. But you can manually compose an <span class='file'>svg</span> from multiple <span class='file'>svg</span> exported vectors, e.g. using a graphics editor.

For the TRMM data I have added the global shoreline to distinguish the outline of the continents.

{% capture foo %}{{page.TRMM-0925_ExporttoSVG}}{% endcapture %}
{% include xml/TRMM-0925_ExporttoSVG.html foo=foo %}

#### Export color maps

Having defined a palette and the scaling for the different layers, you can export the layers as color maps (colored GeoTiff images). The process for doing that is [<span class='package'>exporttobyte</span>](../../subprocess/subproc-exporttobyte).

##### Export monthly precipitaiton

{% capture foo %}{{page.TRMM-0920_ExporttoByte_timespanM}}{% endcapture %}
{% include xml/TRMM-0920_ExporttoByte_timespanM.html foo=foo %}

##### Export precipitation statistics and trends

{% capture foo %}{{page.TRMM-0910_ExporttoByte_timespanA_1998-2017}}{% endcapture %}
{% include xml/TRMM-0910_ExporttoByte_timespanA_1998-2017.html foo=foo %}

#### Create Movie

##### Defining a movieclock

Details on defining and creating a movieclock within Karttur´s GeoImagine Framework is covered in the post on [SMAP processing](../blog-SMAP/).

An animation requires a pre-defined movieclock (but usually the "default" movieclock is OK), and that the time series data is exported and then converted to movie frames.

A movieclock object defines the colors, types and sizes of the elements building the clock and timeline in the animation.  Basically you do not need to define any of the elements, they are all defaulted. But if you want other widhts, margins, colors etc, all can be set using the process [<span class='package'>addmovieclock</span>](../../subprocess/subproc-addmovieclock).

{% capture foo %}{{page.TRMM-0004_addmovieclock}}{% endcapture %}
{% include xml/TRMM-0004_addmovieclock.html foo=foo %}

##### Movie frames

To create movie frames, you must first have exported the images, and then you can run the process [<span class='package'>movieframesancillary</span>](../../subprocess/subproc-movieframesancillary).

{% capture foo %}{{page.TRMM-0950_movieframes_M}}{% endcapture %}
{% include xml/TRMM-0950_movieframes_M.html foo=foo %}

As default the script produces a shell script file that you must execute manually to produce the movie frames. The advantage with the script file is that you can edit the area of the map to appear in the movie as well as the embossed watermark text. The link to the script file is reported by the process. If you want to make the processing fully automated, you must set the parameter _asscript_ to _False_.

##### Movie clock

The final step before producing the time series animation is to create the movie-clock that fits with your movie frames. You need to set the dimensions of the movie clock manually as parameters in the process [<span class='package'>movieclockancillary</span>](../../subprocess/subproc-movieclockancillary).

{% capture foo %}{{page.TRMM-0960_movieclock_M}}{% endcapture %}
{% include xml/TRMM-0960_movieclock_M.html foo=foo %}

The process uses a combination of python image processing and <span class='terminalapp'>ImageMagick</span> commands.

The process also produces two shell script files. The first (in the subfolder <span class='file'>frames</span>) overlays the movieclock and the image frames, and the second (in the subfolder <span class='file'>movie</span>) produces the movie using <span class='terminalapp'>ffmpeg</span>. If you set the parameter _asscript_ to _True_ the module will execute the scripts internally.

<figure>
<iframe src="{{ site.commonurl }}/movies/{{ site.data.movies[page.movie1].file }}" width="{{ site.data.movies[page.movie1].width }}" height="{{ site.data.movies[page.movie1].height }}" frameborder="0">
</iframe>
<figcaption> {{ site.data.movies[page.movie1].caption }} </figcaption>
</figure>
