---
layout: post
title: Climate index autocorrelation
modified: '2018-11-19 20:17'
categories: blog
excerpt: Plot climate index autocorrelation
tags:
  - climate index
  - plot
  - pyplot
  - graphics
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-11-19 22:03'
comments: true
share: true
fig1a: acf_climate_nao-soi-pdo
fig1b: pacf_climate_nao-soi-pdo
---

# Introduction

Autocorrelation, or serial correlation, is the correlation of a signal and delayed copies of itself (i.e. with 1,2 or 3 days/weeks/months delay). The Autocorrelation with no delay is always 1.0 (perfect), and for time series with annual seasonality (like climate) the correlation with a delay representing the number of annual seasons (i.e. 12 if monthly data) is usually strong. The autocorrelation is useful for e.g. filling missing data, forecasting or for creating unbiased datasets.

In this post you will plot the autocorrelation for climate index data. Karttur's GeoImagine Framework uses the python package <span class = 'package'>statsmodel</span> for estimation of both the normal (or full) autocorrelation function (acf) and the partial acf (pacf). The <span class = 'package'>statsmodel</span> acf and pacf functions can be used for estimating the autocorrelation for any time series data, both for plotting and for producing layers with per pixel estimation of the autocorrelation.

# Prerequisites

You must have setup the Karttur's GeoImagine Framework as described in [earlier](../blog-import-project-eclipse/) posts. You must also have added the [climate indexes](../blog-climateindex) to the database.

The plotting functions of Karttur's GeoImagine Framework make use of [matplotlib](https://matplotlib.org/users/pyplot_tutorial.html).

# Framework process

The process for plotting the autocorrelation of climate indexes (and other database recorded) time series in Karttur's GeoImagine Framework is [<span class='package'>autocorrdbtsclimate</span>](../../subprocess/subproc-autocorrdbtsclimate/).

## Process commands

By default the  [<span class='package'>autocorrdbtsclimate</span>](../../subprocess/subproc-autocorrdbtsclimate/) process performs a full autocorrelation (acf). To do a partial acf (pacf) the parameter _partial_ must be set to _True_.

```
<?xml version='1.0' encoding='utf-8'?>
<plotdbtsclimate>
<process processid = 'autocorrdbtsclimate' version = '1.3'>
  <parameters
  ylabel='autocorrelation'
  xlabel='month'
  partial='False'
  title='Climate index autocorrelation'
  nlags='12'
  legend='0'
  width='0.9'
  grid='True'
  ></parameters>
  <index id ='pdo' color = 'g' ></index>
  <index id ='nao' color = 'r' ></index>
  <index id ='soi' color = 'b' ></index>
</process>
</plotdbtsclimate>
```

The xml commands above generate a plot with the three climate indexes, as shown in the left plot below (soi = Southern Oscillation Index, nao = North Atlantic Oscillation, pdo = Pacific Decadal Oscillation). The right plot shows the same indexes and time span but with a partial acf (pacf) (parameter _partial_ set to _True_).

<figure class="half">
	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1a].file }}">

	<img src="{{ site.commonurl }}/images/{{ site.data.images[page.fig1b].file }}">

	<figcaption>Autocorrelation of climate indexes; the left plot shows a full autocorrelation and the right a partial autocorrelation.</figcaption>
</figure>

# Resources

[Pyplot turtorial](https://matplotlib.org/users/pyplot_tutorial.html)

[Matplotlib Bar chart](https://pythonspot.com/matplotlib-bar-chart/)
