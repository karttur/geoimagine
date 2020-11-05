---
layout: post
title: "Accessing archived Landsat data"
categories: blog
excerpt: Order and download Landsat surface reflectance corrected products
tags:
  - Landsat
  - Remote Sensing
  - Access
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2020-11-04 20:17'
modified: '2020-11-04 20:17'
comments: true
share: true
fig1: earthexplorer_01
fig2: earthexplorer_02
fig3: earthexplorer_03
fig4: earthexplorer_04
fig4a: earthexplorer_04a
fig5: earthexplorer_05
fig6: earthexplorer_06
fig6a: earthexplorer_06a
fig7: earthexplorer_07
fig8: earthexplorer_08
fig9: earthexplorer_09
fig10: earthexplorer_10
fig11: earthexplorer_11
fig12: earthexplorer_12
fig13: earthexplorer_13
fig14: earthexplorer_14
fig15: earthexplorer_15
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

Archived Landsat satellite imagery can be accessed in a variety of different ways. This post specifically deals with manual ordering of special products. The accessing as such is not part of Karttur's GeoImagine Framework. The post, however, covers how to import ordered data into the Framework.

## Landsat Collection 1 Surface Reflectance

[Landsat Collection 1 Surface Reflectance](https://www.usgs.gov/core-science-systems/nli/landsat/landsat-collection-1-surface-reflectance).

Data access (November 2020):

- [Earthexplorer](https://earthexplorer.usgs.gov)

### Register with USGS EROS

Before you can use the services of the United States Geological Services (USGS) Earth Resources Observation and Science (EROS), you need to register and create an account at the [USGS EROS registration system](https://ers.cr.usgs.gov/register).

### Eartexplorer

For a few scenes and dates [USGS Earthexplorer](https://earthexplorer.usgs.gov/) is an excellent alternative for ordering land surface reflectance corrected scenes.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1].file }}">
<figcaption> {{ site.data.images[page.fig1].caption }} </figcaption>
</figure>


In the [Earthexplorer](https://earthexplorer.usgs.gov/) front page you have a panel for Search Criteria to the left and a map to the right. To order scenes you need to enter information on:

- search area,
- date and seasons,
- product.

Additionally you can also set search criteria for quality and for example cloudiness.

#### Search area

![geocode method]({{ site.commonurl }}/images/{{ site.data.images[page.fig2].file }})
{: .pull-right}
The first step is to define a search area. You have several options; to search for a location name (the default), to define a path and row in the Landsat WRS system (click in the text box for <span class='textbox'>Select a Geocoding Methods</span> and choose the option _Path/Row_). You can also choose to upload a georeferenced vector file under the tab <span class='tab'>KML/Shapefile Upload</span>.

In the example below I have entered Path and Row for the Okavango Delta in Botswana.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig3].file }}">
<figcaption> {{ site.data.images[page.fig3].caption }} </figcaption>
</figure>

![date method]({{ site.commonurl }}/images/{{ site.data.images[page.fig4].file }}){: .pull-right}
#### Select date range

Towards the bottom of the Search Criteria you select the date range. If you select a multi-year range you can restrict the search to particular months.

![date method]({{ site.commonurl }}/images/{{ site.data.images[page.fig4a].file }}){: .pull-right}
#### Select maximum cloud cover

You can also set the search criteria for maximum cloud cover by clicking the <span class='button'>Cloud Cover</span> tab next to the <span class='button'>Date Range</span>. Cloud cover can also be sett from the <span class='button'>Additional Criteria</span> tab (see below).

#### Select Data Sets

![data sets]({{ site.commonurl }}/images/{{ site.data.images[page.fig5].file }}){: .pull-right}
With the search area and date range set, the next step is to Select which Data Sets to search for. Either click the <span class='button'>Data Sets</span> button at the buttom of the Search panel, or the <span class='button'>Data Sets</span> tab at the top. The atmospherically corrected Landsat data are found under
<span class='menu'>Landsat -> Landsat Collection 1 Level-2 (On-demand)</span>.

When you click the check-box a message pops up informing you that the panchromatic and thermal bands are not going to be corrected. Just click <span class='button'>OK</span>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig6].file }}">
<figcaption> {{ site.data.images[page.fig6].caption }} </figcaption>
</figure>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig6a].file }}">
<figcaption> {{ site.data.images[page.fig6a].caption }} </figcaption>
</figure>
#### Additional Criteria

![data sets]({{ site.commonurl }}/images/{{ site.data.images[page.fig7].file }}){: .pull-right}
Again either click the <span class='button'>Additional Criteria</span> button or tab. The criteria differs between different data sets. For Landsat data sets it is mainly the cloud cover that is of interest.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig8].file }}">
<figcaption> {{ site.data.images[page.fig8].caption }} </figcaption>
</figure>

#### Results

![data sets]({{ site.commonurl }}/images/{{ site.data.images[page.fig9].file }}){: .pull-right}
With all the search criteria set, click the <span class='button'>Results</span> button or tab. Results are organised per Data Set, and then in a list with small quicklooks and buttons for checking and ordering each Data Set (image or scene).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig10].file }}">
<figcaption> {{ site.data.images[page.fig10].caption }} </figcaption>
</figure>

![data sets]({{ site.commonurl }}/images/{{ site.data.images[page.fig11].file }}){: .pull-left}
Data sets that does not meet the standard you are looking for can be excluded from the results.

&nbsp;

&nbsp;

##### Order scene

To order a scene you must be logged in to USGS EROS. If you are not logged in, the shopping cart in the row of buttons for each Data Set is dimmed (like above). And you can not order the scene or image. ![data sets]({{ site.commonurl }}/images/{{ site.data.images[page.fig12].file }}){: .pull-right} If you are logged in, the shopping cart symbol will be fully black, and you can click it.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig13].file }}">
<figcaption> {{ site.data.images[page.fig13].caption }} </figcaption>
</figure>

#### Shopping basket
![data sets]({{ site.commonurl }}/images/{{ site.data.images[page.fig14].file }}){: .pull-left}
When you have ordered the scenes you want to retrieve, click the <span class='button'>View Item Basket</span> button below the left panel with quiklooks.

#### On demand processing

When doing this in November 2020 I then got a very large type faced message about the On-demand processing. Just click <span class='button'>Start Order</span>.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig15].file }}">
<figcaption> {{ site.data.images[page.fig15].caption }} </figcaption>
</figure>

In the next step you can remove items from your shopping basket and set a few options. I removed all but two of the initially ordered scenes, so my list shrank from 13 to 2 items. <span class='button'>Submit Product Selection</span> to queue up your order in the online processing chain.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig16].file }}">
<figcaption> {{ site.data.images[page.fig16].caption }} </figcaption>
</figure>

the processing from Top Of the Atmosphere (TOA) reflection to Land Surface Reflection (LSR) takes a while. Your processing order will get an id, and you have to wait for it to be done, you can check the status out through the url you to the Order Tracking page, also sent to the email address you gave when you registered.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig17].file }}">
<figcaption> {{ site.data.images[page.fig17].caption }} </figcaption>
</figure>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig18].file }}">
<figcaption> {{ site.data.images[page.fig18].caption }} </figcaption>
</figure>
