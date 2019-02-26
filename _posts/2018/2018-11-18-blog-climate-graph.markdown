---
layout: post
title: Plot climate index
modified: '2018-11-18 20:17'
categories: blog
excerpt: Plot climate index time series
tags:
  - climate index
  - plot
  - pyplot
  - graphics
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-18 22:03'
comments: true
share: true
fig1: plot_climate-soi-pdo_1998-2017
fig2: plot_climate-nao-soi-pdo_1998-2017
fig3a: plot_climate-tendency1yr-nao-soi-pdo_1998-2017
fig3b: plot_climate-tendency2yr-nao-soi-pdo_1998-2017
fig3c: plot_climate-naive1yr-nao-soi-pdo_1998-2017
fig3d: plot_climate-naive2yr-nao-soi-pdo_1998-2017
fig4: plot_climate-spline-nao-soi-pdo_1998-2017
---

# Introduction

This post illustrates how to use Karttur's GeoImagine Framework for plotting time series data. The commands and alternatives available for plotting the climate indexes time series data are the same also for plotting other time series data.

# Prerequisites

You must have setup the Karttur's GeoImagine Framework as described in [earlier](../blog-import-project-eclipse/) posts. You must also have added the [climate indexes](../blog-climateindex) to the database.

The plotting functions of Karttur's GeoImagine Framework make use of [matplotlib](https://matplotlib.org/users/pyplot_tutorial.html), that can be called either as part of a <span class='package'>Pandas</span> DataFrame, or used directly. Plotting using <span class='package'>Pandas</span> DataFrame does not require any special parameters (the Framework relies completely on the default).

# Framework process

The process for plotting climate indexes (and other database recorded) time series in Karttur's GeoImagine Framework is [<span class='package'>plotdbtsancillary</span>](../../subprocess/subproc-plotdbtsancillary/).

## XML commands

As stated above, all time series plotting can be done by using the <span class='package'>Pandas</span> package built in plot command. You simply do that by setting the parameter _pdplot_ to _True_.

```
<?xml version='1.0' encoding='utf-8'?>
<plotdbtsclimate>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>
	<process processid = 'plotdbtsclimate' version = '1.3'>
		<parameters pdplot='True'></parameters>
		<index id ='soi'></index>
		<index id ='pdo'></index>
	</process>
</plotdbtsclimate>
```

The xml commands above generate a plot with the two climate indexes, as shown below (soi = Southern Oscillation Index, pdo = Pacific Decadal Oscillation).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1].file }}">
<figcaption> {{ site.data.images[page.fig1].caption }} </figcaption>
</figure>

If you instead set _pdplot_ to _False_, you can add title and axis, and decide the colors and styles of the included time series. Additionally you can also decide the size and resolution of the plot (see the reference page for [<span class='package'>plotdbtsclimate</span>](../../subprocess/subproc-plotdbtsancillary/)).

```
<?xml version='1.0' encoding='utf-8'?>
<plotdbtsclimate>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>
	<process processid = 'plotdbtsclimate' version = '1.3'>
		<parameters pdplot='True' title='Climate index'></parameters>
    <parameters pdplot='False' title='Climate index' legend='0' obslinestyle='solid' ylabel='index'></parameters>
		<index id ='pdo' obsformat = 'g-' ></index>
		<index id ='nao' obsformat = 'r-' ></index>
		<index id ='soi' obsformat = 'b-' ></index>
	</process>
</plotdbtsclimate>
```

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig2].file }}">
<figcaption> {{ site.data.images[page.fig2].caption }} </figcaption>
</figure>

You can also do a time series decomposition on the fly, and display the smoothed time series (tendency) of several indexes in a single plot.

```
<?xml version='1.0' encoding='utf-8'?>
<plotdbtsclimate>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>
	<process processid = 'plotdbtsclimate' version = '1.3'>
  <parameters
  ylabel='index'
  title='Climate index'
  decompose='True'
  legend='0'
  grid='True'
  ></parameters>
  <index id ='pdo' obsformat = 'g-' tendencyformat = 'g-' trendformat = 'k-'></index>
  <index id ='nao' obsformat = 'r-' tendencyformat = 'r-' trendformat = 'k-'></index>
  <index id ='soi' obsformat = 'b-' tendencyformat = 'b-' trendformat = 'k-'></index>
	</process>
</plotdbtsclimate>
```

By default time series decomposition uses a spline functions for smoothing and removing the seasonal signal, as described in [another](../glob-seasonal/) post. The default size of the smoothing filter (kernel) equals then number of annual observations (i.e. 12 for monthly data), but can be set to any multiple of that number (with the parameter _yearfac_). Alternatively the smoothing can be done with a filter kernel (by setting the boolean parameter _naive_ to _True_), commonly referred to as naive decomposition.

The figure below shows 4 single plots, all showing the smoothed time series (tendency). The top row shows the spline smoothed tendencies and the bottom row the naive tendencies. The left plots have been smoothed with a kernel representing a single (1) annual cycle, whereas the right plots have been smoothed using a kernel spanning 2 years. Note that the y-axis range differs between the plots.


<figure class="half">
	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig3a].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig3b].file }}">

  <img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig3c].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig3d].file }}">

	<figcaption>Plots showing time series of climate indexes, The different plots illustrate different smoorthing functions (see text). </figcaption>
</figure>

The last example shows how to plot the observations, the smoothed time series, and the estimated trends as separate subplots in a single plot.

```
<?xml version='1.0' encoding='utf-8'?>
<plotdbtsclimate>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>
	<process processid = 'plotdbtsclimate' version = '1.3'>
  <parameters
  title='Climate index'
  decompose='True'
  plotoriginal='True'
  plottrend='True'
  legend='0'
  separate='True'
  ></parameters>
  <index id ='pdo' obsformat = 'g-' tendencyformat = 'g-' trendformat = 'k-'></index>
  <index id ='nao' obsformat = 'r-' tendencyformat = 'r-' trendformat = 'k-'></index>
  <index id ='soi' obsformat = 'b-' tendencyformat = 'b-' trendformat = 'k-'></index>
	</process>
</plotdbtsclimate>
```

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig4].file }}">
<figcaption> {{ site.data.images[page.fig4].caption }} </figcaption>
</figure>

# resources

[Pyplot turtorial](https://matplotlib.org/users/pyplot_tutorial.html)

[Linestyles](https://matplotlib.org/gallery/lines_bars_and_markers/linestyles.html) (the linestyles implemented in the Framework)
