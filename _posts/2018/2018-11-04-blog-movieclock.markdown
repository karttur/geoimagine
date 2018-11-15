---
layout: post
title: Defining SMAP layers to process
modified: '2018-10-24 T18:17:25.000Z'
categories: blog
excerpt: "Set the SMAP template database table for products and layers."
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-24 T18:17:25.000Z'
comments: true
share: true
figure1: avg-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2A: ols-sl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2B: ts-mdsl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2C: ts-losl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2D: ts-hisl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
---

## Introduction

The <span class= 'package'>movieclock.py</span> module is part of Karttur´s GeoImagine Framework, but can also be used stand alone. The module generates a timeline+clock overlay on time-series
images. The images can then be used for generating an animation, as described in this [post about FFmpeg](https://karttur.github.io/setup-theme-blog/blog/ffmpeg-movie/).  

The package expects an exported time-series as composition input, and produces <span class='file'>.png</span> files
with basenames identical to the input compositions, but under the default thematic folder
<span class='file'>'folder'-pngmovie</span>, where 'folder' is input component folder. The produced
<span class='file'>.png</span> files have the clock overlaid. If all clock components are set to transparent,
the .png files will become replicas of the input components. To allow using the ,png files in a GIS, all .png
files have an associated world files that most modern GIS packages can read.

## Dependencies

### Python package

* numpy
* array
* os
* sys
* img_png

### Other

* ImageMagic

Imagemagic is a cross platform...

## Package constructor

### XML request:

Init expects a dictionary with the following keys:

| parameter |type |alternative |default ]
| -- |-- |-- |-- ]
| position | text | ul/ur/ll/lr | ll ]
| width | integer | movie width | -- |
| bgcolor | integer | 0-255 | 255 |
| boettcolor | integer | 0-255 | 252 |
| tlcolor | integer | 0-255 | 253 |
| clhandcolor | integer | 0-255 | 253 |
| clframecolor | integer | 0-255 | 255 |
| tlbordercolor | integer | 0(-255 | 254|
| clbordercolor | integer | 0(-255 | 254|
| fontcolor | integer | 0-255 | 254 |.py
| tlborder | integer | 0(no border), 1- | 2|
| clborder | integer | 0(no border), 1- | 6|

| tlmargin | tuple | (l,r,t,b) | (5,5,5,5)|
| clmargin | tuple | (l,r,t,b) | (5,5,5,5)|
| tlheight | integer | 0-20 | 10|
| clradius | integer | 10-200 | 30 |
| clradius | integer | 10-200 | 30 |
| tlticks | integer | 0-10 | 1 |
| tltickwidth | integer | 0-10 | 2 |
| fontsize | integer | 0-54 | 14 |

where cl = clock,tl = timeline.

Note that the color coding relates to the palette that was used to export your image data,
 By default all exports use the value 255 for denoting no data, and by default
the color for no data is fully transparent (otherwise white). imageclock.py, will however, ignore if 255 is set to a non-transparent color. All pixels in the clock image will be transparently overlaid over the background image. The maximum value relating to the underlaying layer (image) content is 250.
Values between 251 and 254 can be set to arbitrary colors and does not affect the layer content. Unless you want
the clock and the timeline to have colors also represented in your exported image, you should use color values between
251 and 254 to define your clock colors (and 255 if you want e.g. the clock background to be transparent). All default
palettes in Karttur's Geo Imagine framework are defined for use in the clock (and the legend, that works in a similar fashion
- see [this post](#)).

The timeline and the clock can be put anywhere over underlying map image. The default puts the timeline at the
bottom, with clock above the timeline in lower right corner. To shift the clock to the horisontal center, set the clock margin (r)
to half the image width minus the clockradius.

## Alternative

Instead of using <span class='package>img_png</span>, the  Python Image Library <span class='package>PIL</span>
can be used. There are also other possible alternatives to Imagemagic, including for instance the python package  
<span class='package>cv2</span>.

## Resources

[ImageMagic](#)
