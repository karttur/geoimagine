---
layout: page
title: Python packages
excerpt: "An archive of python packages in Katturs's GeoImagine Framework"
search_omit: true
---

Karttur´s GeoImagine Framework is built around a set of Python Packages. Most packages depend on other packages. The core packages for installing and setting up the geospatial processing framework are available for download. Instructions for how to setup Karttur´s GeoImagine Framework are under development and available [here](../../../blog/blog-import-project-eclipse/). 

<ul class="post-list">
{% for post in site.categories.package %}
  <li><article><a href="{{ site.url }}/package/{{ post.packageurl }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
