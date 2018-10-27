---
layout: post
title: Karttur's GeoImageine Framework
excerpt: "Introduction to Karttur's GeoImageine Framework"
image: rainfall-delta_3B43_trmm_2001-2016_mk-z-ts-model
search_omit: true
---

Karttur's GeoImageine Framework is built in Python using the Eclipse Integrated Development Environment (IDE) and postreSQL as database. The setup of the IDE with all its components is covered in the [Setup IDE Blog](https://karttur.github.io/setup-ide/).

The Framework offers a semi-automated processing of spatial data, mainly intended for Big Data satellite image processing. Everything in the framework is done using object oriented processes. Even the definition of the processes themselves use the same processing routines as all other processes. The processes are assembled in root groups, where each root process group is associated with either a particular data source, or particular kind of process (e.g. timeseries processing or export to layouts, backup etc). Most root processes are represented by specific python packages.

To search for a particular package or a process, use these links to browse the content of Karttur's GeoImagine Framework:

- [Python packages](packages/index.html)
- [Root processes](rootprocesses/index.html)
- [Sub processes](subprocesses/index.html)


<h1>Blog<h1>
<ul class="post-list">
{% for post in site.categories.blog limit:5 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>

<h1>Artcles<h1>
<ul class="post-list">
{% for post in site.categories.overview limit:5 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
