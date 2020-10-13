---
layout: page
title: GRASS GIS
excerpt: "An archive of articles on GRASS GIS."
search_omit: true
---

GRASS was the first Open Source Geographic Information System (GIS), and is till developing. GRASS has many powerful tools, especially for raster data processing. Some of the routines are still unsurpassed by other GIS.

<ul class="post-list">
{% for post in site.categories.grass reversed %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
