---
layout: post
title: Karttur's GeoImagine Framework
excerpt: "Introduction to Karttur's GeoImagine Framework"
image: rainfall-delta_3B43_trmm_2001-2016_mk-z-ts-model
search_omit: true
---

Karttur's GeoImagine Framework offers a semi-automated processing environment for spatial data, mainly intended for Big Data satellite image processing.

The core of the Framework are object oriented processes. Processes are assembled in groups (called roots), where each group is associated with either a particular data source (e.g. MODIS, Sentinel, Landsat, ancillary etc), or particular kinds of processes (e.g. time series processing, scalar, overlay, export etc). many root processes are also associated with a specific, purpose-built, python package. When installing and setting up the Framework the process used for setting up processes is installed. The user can then install any of the predefined processes or define custom processes.

To search for a particular package or process, use these links to browse the content of Karttur's GeoImagine Framework:

- [Python packages](packages/index.html)
- [Root processes](rootprocesses/index.html)
- [Sub processes](subprocesses/index.html)

The [blog](../blog/) contains step-by-step examples for installing, setting up and using various data sources and processing capacities.

The Framework is built in Python using the Eclipse Integrated Development Environment (IDE) and postreSQL as database. The setup of the IDE with all its components is covered in the [Setup IDE Blog](https://karttur.github.io/setup-ide/). If you want to setup Karttur's GeoImagine Framework you have to start with building the Eclipse Spatial Data IDE (SPIDE).

<h1>Blog<h1>
<ul class="post-list">
{% for post in site.categories.blog limit:10 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
