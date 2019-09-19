---
layout: post
title: SMAP map layout and media export
modified: '2018-10-24 T18:17:25.000Z'
categories: blog
excerpt: "Map layout and media export of Soil Moisture Active Passive (SMAP) mission data using Karttur's GeoImagine Framework"
tags:
  - SMAP
  - process chain
  - createscaling
  - addrasterpalette
  - addmovieclock
  - exporttobytesmap
  - movieclocksmap
  - movieframesmap
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-24 T18:17:25.000Z'
comments: true
share: true

movie1: soil-moisture-avg_SPL3SMP_global_2015121-2018345_005
movie2: soil-moisture-avg_SPL3SMP_global_2015-2018@16D_005

SMAP-0001_createscaling: SMAP-0001_createscaling
SMAP-0002_createpalettes: SMAP-0002_createpalettes
SMAP-0003_createlegends: SMAP-0003_createlegends
SMAP-0004_createmovieclock: SMAP-0004_createmovieclock
SMAP-0005_add-movieclock: SMAP-0005_add-movieclock
SMAP-0005_exportlegend: SMAP-0005_exportlegend
SMAP-0900_ExporttoByte_16D: SMAP-0900_ExporttoByte_16D
SMAP-0905_ExporttoByte_16D-seasons: SMAP-0905_ExporttoByte_16D-seasons
SMAP-0950_movieframes_16D-seasons: SMAP-0950_movieframes_16D-seasons
SMAP-0950_movieframes_16D: SMAP-0950_movieframes_16D
SMAP-0960_movieclock_16D-seasons: SMAP-0960_movieclock_16D-seasons
SMAP-0960_movieclock_16D: SMAP-0960_movieclock_16D
SMAP-0330_interpolseasn_16D_2015-2019: SMAP-0330_interpolseasn_16D_2015-2019
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post covers how to define layouts and export media files for data and results from the [Soil Moisture Active Passive (SMAP)](https://smap.jpl.nasa.gov) mission in Karttur's GeoImagine Framework.

## Prerequisites

You must have completed the data processing of SMAP data in the [previous](../blog-SMAP/) post.

# SMAP

## Project module

The project module file (<span class='file'>projSMAP.py</span>) is available in the <span class='package'>Project</span> package [projects](https://github.com/karttur/geoimagine-projects/).

<button id= "toggleprojfile" onclick="hiddencode('projfile')">Hide/Show projSMAP.py</button>

<div id="projfile" style="display:none">

{% capture text-capture %}
{% raw %}

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    #projFN ='/full/path/to/smap_YYYYMMDD.txt'
    projFN ='doc/SMAP/smap_YYYYMMDD.txt'
    projFN ='doc/Layout/smap-layout_YYYYMMDD.txt'

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
projFN ='doc/Layout/smap-layout_YYYYMMDD.txt'
```

As the path to the project file does **not** start with a slash "/", the path is relative to the project module itself. The [project package available on Karttur's GitHub page](../../../geoimagine-projects) contains the path and the files required for running the process chain.

<button id= "toggleprojfile" onclick="hiddencode('processchain')">Hide/Show SMAP process chain</button>

<div id="processchain" style="display:none">
{% capture text-capture %}
{% raw %}

```
###################################
###################################
###             SMAP            ###
###################################
###################################

###################################
###             Layout          ###
###################################

## Create scaling for smap compids ##
#SMAP-0001_createscaling.xml

## Create palettes for smap ##
#SMAP-0002_createpalettes.xml

## Create legend for smap ##
#SMAP-0003_createlegends.xml

## Create movie clock for smap##
#SMAP-0004_createmovieclock.xml

###################################
###        Export media         ###
###################################

## Export 16D SMAP ##
#SMAP-0900_ExporttoByte_16D.xml

## Export seasonal signals 16D ##
#SMAP-0905_ExporttoByte_16D-seasons.xml

###        Movie         ###

## Create image frames ##
#SMAP-0950_movieframes_16D-seasons.xml
#SMAP-0950_movieframes_16D

## Create clock frames and movie ##
#SMAP-0960_movieclock_16D-seasons.xml
#SMAP-0960_movieclock_16D
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

#### Layout

Processing to pleasing looking maps requires that different layout aspects are pre-defined, including:

- scaling
- legends
- palettes
- movieclock

You must define scaling and palettes. You need legends if you want to add that to your map layouts. You can also define a customized layout of the clock and time line for animations, but you can also use the Framework default.

##### Scaling

To export a layer to a color map the scaling must be set using the process [<span class='package'>createscaling</span>](../../subprocess/subproc-createscaling/). All exported maps are in byte format (valid numerical range between 0 and 255). Thus all compositions that are not defined as byte must be rescaled to fit between 0 and 255. The Framework default is to use 255 to denote nodata and values between 251 and 255 for layout.

{% capture foo %}{{page.SMAP-0001_createscaling}}{% endcapture %}
{% include xml/SMAP-0001_createscaling.html foo=foo %}

##### Palettes

To set up a palette, use the process [<span class='package'>addrasterpalette</span>](../../subprocess/subproc-addrasterpalette/). In the example below three different SMAP related palettes are defined: for soil moisture (vol/vol), for change in soil moisture and for variations in soil moisture.

{% capture foo %}{{page.SMAP-0002_createpalettes}}{% endcapture %}
{% include xml/SMAP-0002_createpalettes.html foo=foo %}

##### Create legend

To create legends for use together with maps, use the process [<span class='package'>createlegend</span>](../../subprocess/subproc-createlegend/).

{% capture foo %}{{page.SMAP-0003_createlegends}}{% endcapture %}
{% include xml/SMAP-0003_createlegends.html foo=foo %}

##### Export legend

![SMAP palette]({{ site.commonurl }}/images/soil-moisture_smap_legend.jpg){: .pull-right}

With the process [<span class='package'>exportlegend</span>](../../subprocess/subproc-exportlegend/) you can create stand alone legends. To work you must have defined the scaling, the palette and the legend in the previous steps. The process produces three legends, as a Scalable Vector Graphics (<span class='file'>.svg</span> file),  a <span class='file'>.png</span> file and a compressed <span class='file'>.jpg</span> file. The svg is saved as a www compliant xml, and you can use it either for editing in a graphics program or inclusion in a web-page (or both).

{% capture foo %}{{page.SMAP-0005_exportlegend}}{% endcapture %}
{% include xml/SMAP-0005_exportlegend.html foo=foo %}

#### movieclock

As part of Karttur´s GeoImagine Framework, time series images can be converted to animations with a timeline and a clock showing the year and the season. To create animations you must have installed the terminal apps <span class='terminalapp'>ImageMagick</span> (for command line image processing) and <span class='terminalapp'>ffmpeg</span> (for command line movie making). Here are the links to my blog posts on how to install and use <span class='terminalapp'>ImageMagick</span> and <span class='terminalapp'>ffmpeg</span>:

- [ImageMagick](https://karttur.github.io/setup-theme-blog/blog/install-imagemagick/)
- [FFmpeg](https://karttur.github.io/setup-theme-blog/blog/ffmpeg-movie/)

The post on <span class='terminalapp'>ffmpeg</span> also illustrates the use of the GeoImagine Framework movieclock.

#### Defining a movieclock

An animation requires a pre-defined movieclock (but usually the "default" movieclock is OK), and that the time series data is first exported and then converted to movie frames.

A movieclock object defines the colors, types and sizes of the elements building the clock and timeline in the animation.  Basically you do not need to define any of the elements, they are all defaulted. But if you want other postions, widths, margins, colors etc, all can be set using the process [<span class='package'>addmovieclock</span>](../../subprocess/subproc-addmovieclock/).

{% capture foo %}{{page.SMAP-0005_add-movieclock}}{% endcapture %}
{% include xml/SMAP-0005_add-movieclock.html foo=foo %}

### Export

Exporting layers requires that you have defined the scaling for the composition and a suitable palette. SMAP layers are exported suing the process [<span class='package'>exporttobytesmap</span>](../../subprocess/subproc-exporttobytesmap/).

### Export time series images

If you want to do a movie (animation) of the SMAP time-series data you have to export all the individual SMAP dates. To make the movie look pleasing it is best to export the force filled 16D period time series. Below, both the force filled time series and the seasonal signals are exported, and then used for creating movie animations.

{% capture foo %}{{page.SMAP-0900_ExporttoByte_16D}}{% endcapture %}
{% include xml/SMAP-0900_ExporttoByte_16D.html foo=foo %}

### Export seasonal signal

{% capture foo %}{{page.SMAP-0905_ExporttoByte_16D-seasons}}{% endcapture %}
{% include xml/SMAP-0905_ExporttoByte_16D-seasons.html foo=foo %}

### Create movie

To create movie frames, you must first have exported the time-series images. You then convert the individual images to movie frames with the process [<span class='package'>movieframesmap</span>](../../subprocess/subproc-movieframesmap/) and then create the clock and timeline with the process [<span class='package'>movieclocksmap</span>](../../subprocess/subproc->movieclocksmap/). The latter process also generates the shell scripts for joining the map frames and the clock frames, and for assembling the joined frames to a movie. If you set the parameter _asscript_ to _False_ the scripts are called and executed from within the process.

### Create movie frames

{% capture foo %}{{page.SMAP-0950_movieframes_16D}}{% endcapture %}
{% include xml/SMAP-0950_movieframes_16D.html foo=foo %}

By default the process [<span class='package'>movieframesmap</span>](../../subprocess/subproc-movieframesmap/) produces a shell script file that you must execute manually to produce the movie frames. The advantage with the script file is that you can edit the area of the map to appear in the movie as well as the embossed watermark text. The link to the script file is reported by the process.

### Create movie clock and timeline

The final step before producing the movie (time series animation) is to create the movie clock/timeline that fits with your movie frames. You need to set the dimensions of the movie clock manually as parameters in the process [<span class='package'>>movieclocksmap</span>](../../subprocess/subproc->movieclocksmap/). The process uses a combination of python image processing and <span class='terminalapp'>ImageMagick</span> commands.

The process also produces two shell script files. The first joins (overlays) the movieclock and the image frames (with <span class='terminalapp'>ImageMagick</span>), and the second produces the movie using <span class='terminalapp'>ffmpeg</span>. If you do not set the parameter _asscript_ to _False_ you need to execute both scripts manually as reported by the script.

{% capture foo %}{{page.SMAP-0960_movieclock_16D}}{% endcapture %}
{% include xml/SMAP-0960_movieclock_16D.html foo=foo %}

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

# Resources

[ImageMagick for batch processing maps](https://karttur.github.io/setup-theme-blog/blog/install-imagemagick/)

[FFmpeg for map animations](https://karttur.github.io/setup-theme-blog/blog/ffmpeg-movie/)
