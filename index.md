---
layout: post
title: Karttur's GeoImagine Framework
excerpt: "Introduction to Karttur's GeoImagine Framework"
image: rainfall-delta_3B43_trmm_2001-2016_mk-z-ts-model
search_omit: true
---

Karttur's GeoImagine Framework offers a semi-automated processing environment for spatial data, mainly intended for Big Data satellite image processing.

The core of the Framework are object oriented processes. Processes are assembled in groups (called roots), where each group is associated with either a particular data source (e.g. MODIS, Sentinel, Landsat, ancillary etc), or particular kinds of processes (e.g. time series processing, scalar, overlay, export etc). many root processes are also associated with a specific, purpose-built, python package. When installing and setting up the Framework, a single root with a single process is installed - allowing the user to define and install all other processes associated with the Framework.

To search for a particular package or process, use these links to browse the content of Karttur's GeoImagine Framework:

- [Python packages](packages/index.html)
- [Root processes](rootprocesses/index.html)
- [Sub processes](subprocesses/index.html)

The [setup](../setup/) section contains a set of step-by-step posts on how to setup the complete Framework. Your machine must be set up with a Spatial Data Integrated Development Environment (SPIDE) as described in my blog on [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/).

The [blog](../blog/) contains various examples processing different kinds of data in the Framework.

<h1>Setup<h1>
<ul class="post-list">
{% for post in site.categories.setup limit:20 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>

<h1>Blog<h1>
<ul class="post-list">
{% for post in site.categories.blog limit:5 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
