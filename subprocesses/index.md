---
layout: page
title: Processes
excerpt: "An archive of processes in Katturs's GeoImagine Framework"
search_omit: true
---

Processes can be regarded as high-level Geographic Information System (GIS) processes. A typical GIS process would be to change the spatial resolution, to trim an image, or to combine two images arithmethically (called "overlay" in the GIS jargon). All this, and much more, can also be done in Karttur's GeoImagine Framework. But it can be done for hundreds or even thousands of images (or maps) in one go. The complete time-series of rainfall data can be changed to some color layout, or fitted to your study area, with a single command.

Below is a list of all available processes in the Framework. If you select the Root Process in the menu above, you can go to processes belonging to different datasets (e.g MODIS, Sentinel etc) or typical functionalities (e.g. scalar, export etc).

<ul class="post-list">
{% for post in site.categories.subprocess %}
  <li><article><a href="{{ site.url }}/subprocess/{{ post.processurl }}">{{ post.title }} ({{ post.rootprocid }})<span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
