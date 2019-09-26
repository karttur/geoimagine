---
layout: page
title: Python packages
excerpt: "An archive of python packages in Katturs's GeoImagine Framework"
search_omit: true
---

Karttur´s GeoImagine Framework is built around a set of Python Packages. Most packages depend on other packages. Instructions for how to setup Karttur´s GeoImagine Framework are under development and available [here](../../../blog/blog-import-project-eclipse/).

<ul class="post-list">
{% for post in site.categories.package reversed %}
  <li><article><a href="{{ site.url }}/package/{{ post.packageurl }}">{{ post.title }} {% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
