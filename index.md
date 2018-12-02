---
layout: post
title: Karttur's GeoImagine Framework
excerpt: "Introduction to Karttur's GeoImagine Framework"
image: rainfall-delta_3B43_trmm_2001-2016_mk-z-ts-model
search_omit: true
---

Karttur's GeoImagine Framework offers a semi-automated processing environment for spatial data, mainly intended for Big Data satellite image processing.

Everything in the framework is done using object oriented processes. Even the definition of the processes themselves use the same processing routines as all other processes. The processes are assembled in root groups, where each group is associated with either a particular data source (e.g. MODIS, Sentinel, Landsat, ancillary data etc), or particular kinds of processes (e.g. time series processing, scalar, overlay, export etc). Most root processes are also associated with a specific, purpose-built, python package.

To search for a particular package or process, use these links to browse the content of Karttur's GeoImagine Framework:

- [Python packages](packages/index.html)
- [Root processes](rootprocesses/index.html)
- [Sub processes](subprocesses/index.html)

The [blog](../blog/) contains step-by-step examples covering data acquisitions and processing.

The Framework is built in Python using the Eclipse Integrated Development Environment (IDE) and postreSQL as database. The setup of the IDE with all its components is covered in the [Setup IDE Blog](https://karttur.github.io/setup-ide/).

<h1>Blog<h1>
<ul class="post-list">
{% for post in site.categories.blog limit:5 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>

<h1>Articles<h1>
<ul class="post-list">
{% for post in site.categories.overview limit:5 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
