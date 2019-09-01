---
layout: post
title: VWB map layout and media export
modified: '2018-11-11 20:17'
categories: blog
excerpt: "Map layout and media export of Vertical Water Balance (VWB) calculations"
tags:
  - Vertical Water Balance
  - rainfall
  - evapotranspiration
  - TRMM
  - Tropical Rainfall Measurement Mission
  - FAO refET
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-11 22:03'
comments: true
share: true
movie1: trmm-fao-vwb_3b43_trmm_199801-201807_v7-f-m

VWB-0001_createscaling: VWB-0001_createscaling
VWB-0002_createpalettes: VWB-0002_createpalettes
VWB-0003_createlegends: VWB-0003_createlegends
VWB-0004_addmovieclock: VWB-0004_addmovieclock
VWB-0005_exportlegends: VWB-0005_exportlegends
VWB-0900_ExporttoByte_M: VWB-0900_ExporttoByte_M
VWB-0910_ExporttoByte_timespanA_1998-2017: VWB-0910_ExporttoByte_timespanA_1998-2017
VWB-0950_movieframes_M: VWB-0950_movieframes_M
VWB-0960_movieclock_M: VWB-0960_movieclock_M.xml
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post presents a processing chain for creating map layouts and export media from the calculations of [Vertical Water Balance (VWB)](../blog-VWB/) in the previous post.

## Prerequisites

You must have completed the VWB processing in the [previous](../blog-VWB/) post.

# Vertical Water Balance

## Project module

The project module file (<span class='file'>projVWB.py</span>) is available in the <span class='package'>Project</span> package [projects](https://github.com/karttur/geoimagine-projects/).

<button id= "toggleprojfile" onclick="hiddencode('projfile')">Hide/Show projVWB.py</button>
<div id="projfile" style="display:none">
{% capture text-capture %}
{% raw %}

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    projFN = '/Volume/and/path/to/VWB_TRMM-vs-FAOrefevap_YYYYMMDD.txt'
    projFN ='doc/VWB/VWB_TRMM-vs-FAOrefevap_YYYYMMDD.txt'
    projFN ='doc/Layout/VWB_TRMM-vs-FAOrefevap-layout_YYYYMMDD.txt'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

### Process Chain

The project file links to an ASCII text file that contains a list of the xml files to execute. The layout and export processes are under the folder <span class='file'>Layout</span>.

```
projFN ='doc/Layout/VWB_TRMM-vs-FAOrefevap-layout_YYYYMMDD.txt'
```

As the path to the project file does **not** start with a slash "\\", the path must be relative to the project module itself. The [project package available on Karttur's GitHub page](../../../geoimagine-projects) contains the path and the files required for running the process chain.

<button id= "toggleProcessChain" onclick="hiddencode('ProcessChain')">Hide/Show VWB-layout_YYYYMMDD.txt</button>

<div id="ProcessChain" style="display:none">
{% capture text-capture %}
{% raw %}

The project file links to an ASCII text file that contains a list of the xml files to execute. The layout and export processes are under the folder <span class='file'>Layout</span>.

<button id= "toggleprocesschain" onclick="hiddencode('processchain')">Hide/Show VWB processchain</button>

<div id="processchain" style="display:none">

{% capture text-capture %}
{% raw %}

```
###################################
###################################
###             VWB             ###
###################################
###################################

#Uncomment the processes you want to run by removing the "#"

###################################
###            Layout           ###
###################################

## Create scaling for VWB data ##
#VWB-0001_createscaling.xml

## Create the VWB palettes ##
#VWB-0002_createpalettes.xml

# Create legends for VWB ##
#VWB-0003_createlegends.xml

## Create VWB movieclock ##
#VWB-0004_addmovieclock.xml

## Export legends for VWB ##
VWB-0005_exportlegend.xml

###################################
###        Export media         ###
###################################

## Export png images ##
#VWB-0900_ExporttoByte_M.xml
#VWB-0910_ExporttoByte_timespanA_1998-2017.xml

## Create TRMM movieframes (1998 to 2017)
## For fully automated processing you need to set parameter "asscript" to False
## If you set the parameter "asscript" to True (= default), you have to execute the shell script file reported by the process ##
#VWB-0950_movieframes_M.xml

## Create movieclock, the process creates two shell scripts that must by run ##
#VWB-0960_movieclock_M.xml
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html  toggle-text=text-capture  %}
</div>

#### Layout

If you want to create color maps/images and animations for presenting the VWB data you must create the required layout (see post on [TRMM layout](../blog-TRMM-layout/) for more details).

##### Set scaling

Layout exports require scaling the original data to byte (0 - 255) range. Details on the scaling are given in the posts on layout of [SMAP](../blog-SMAP-layout/) and [TRMM](../blog-TRMM-layout/). The xml on _createscaling_ below calls the scaling definition process [<span class='package'>createscaling</span>](../../subprocess/subproc-createscaling/) and sets the scaling of both the monthly and annual VWB layers, and all the layers produced as part of the trend analysis.

{% capture foo %}{{page.VWB-0001_createscaling}}{% endcapture %}
{% include xml/VWB-0001_createscaling.html foo=foo %}

##### Add palette

The VWB palettes below, created with the process [<span class='package'>addrasterpalette</span>](../../subprocess/subproc-addrasterpalette/), are Karttur's default palettes for VWB.

<{% capture foo %}{{page.VWB-0002_createpalettes}}{% endcapture %}
{% include xml/VWB-0002_createpalettes.html foo=foo %}

##### Create legends

To create legends for use together with maps, use the process [<span class='package'>createlegend</span>](../../subprocess/subproc-createlegend/).

{% capture foo %}{{page.VWB-0003_createlegends}}{% endcapture %}
{% include xml/VWB-0003_createlegends.html foo=foo %}

##### Add movieclock

You do not need to add a special movieclock for VWB, the default movieclock works fine. But if you want to create a customised movieclock, the process is [<span class='package'>addmovieclock</span>](../../subprocess/subproc-addmovieclock/). The only parameter that is required is the name of the movieclock, all other parameters are set to default unless explicitly given as parameters (thus the movieclock added below will be identical to the default movieclock).

{% capture foo %}{{page.VWB-0004_addmovieclock}}{% endcapture %}
{% include xml/VWB-0004_addmovieclock.html foo=foo %}

##### Export legend

Use the process [<span class='package'>exportlegend</span>](../../subprocess/subproc-exportlegend/) to export stand alone legends. The process produces three legends, as a Scalable Vector Graphics (<span class='file'>.svg</span> file),  a <span class='file'>.png</span> file and a compressed <span class='file'>.jpg</span> file.

{% capture foo %}{{page.VWB-0005_exportlegends}}{% endcapture %}
{% include xml/VWB-0005_exportlegends.html foo=foo %}

##### Export images and create animation

With the scaling and palettes defined, you can export any of the VWB layers created above with the process [<span class='package'>exporttobyteancillary</span>](../../subprocess/subproc-exporttobyteancillary/).

###### Export monthly images

{% capture foo %}{{page.VWB-0900_ExporttoByte_M}}{% endcapture %}
{% include xml/VWB-0900_ExporttoByte_M.html foo=foo %}

##### Export statistical and trend results

All exports use the same process [<span class='package'>exporttobyteancillary</span>](../../subprocess/subproc-exporttobyteancillary/), you just have to set the timestep and compostions to export all the statistical data, including the results of the trend analysis.

{% capture foo %}{{page.VWB-0910_ExporttoByte_timespanA_1998-2017}}{% endcapture %}
{% include xml/VWB-0910_ExporttoByte_timespanA_1998-2017.html foo=foo %}

##### Create movie frames

The process [<span class='package'>movieframeancillary</span>](../../subprocess/subproc-movieframeancillary/) converts the exported images (from previous step) to movie frames. The process is basically a dimension conversion that can also create an embossed text on the fly. For the process [<span class='package'>movieframeancillary</span>](../../subprocess/subproc-movieframeancillary/) to work you must have installed <span class='terminalapp'>imagemagick</span> as explained in [another blogpost](https://karttur.github.io/setup-theme-blog/blog/install-imagemagick/).

To run the process fully automated you must set the parameter _asscript_ to _False_, otherwise you must manually execute the shell script file reported when the process comes to an end.

Note that because the three versions of VWB (the total VWB, suplus VWB and deficit VWB) were organized to be stored in the same directory (or folder) path, you can only create one animation at the time. If you want to create animations of all three versions you must delete the "movieframe" folder between each creation.

{% capture foo %}{{page.VWB-0950_movieframes_M}}{% endcapture %}
{% include xml/VWB-0950_movieframes_M.html foo=foo %}

##### Create movie clock and animation

The process [<span class='package'>movieclockancillary</span>](../../subprocess/subproc-movieclockancillary/) first creates the movieclocks to combine with the movie frames from the previous step, and then creates the movie/animation itself. To run the process fully automated you must set the parameter _asscript_ to _False_, otherwise you must manually execute the shell script files reported when the process comes to an end. By default the process will create script files so you must explicitly enter asscript=\"False\" if you want the process to generate the complete animation on the fly.

For the process [<span class='package'movieclockancillary</span>](../../subprocess/subproc-movieclockancillary/) to work you must have installed <span class='terminalapp'>FFmpeg</span> as explained in [another blogpost](https://karttur.github.io/setup-theme-blog/blog/ffmpeg-movie/).

{% capture foo %}{{page.VWB-0960_movieclock_M}}{% endcapture %}
{% include xml/VWB-0960_movieclock_M.html foo=foo %}

<figure>
<iframe src="{{ site.commonurl }}/movies/{{ site.data.movies[page.movie1].file }}" width="{{ site.data.movies[page.movie1].width }}" height="{{ site.data.movies[page.movie1].height }}" frameborder="0">
</iframe>
<figcaption> {{ site.data.movies[page.movie1].caption }} </figcaption>
</figure>
