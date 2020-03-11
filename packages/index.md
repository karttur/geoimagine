---
layout: page
title: Python packages
excerpt: "An archive of python packages in Katturs's GeoImagine Framework"
search_omit: true
---

Karttur´s GeoImagine Framework is built around a set of Python Packages. Most packages depend on other packages. Below is an alphabetic list of the packages that builds the Framework. Instructions for how to prepare you machine and then install and setup a functional copy of the Framework are available as described in the [Fount of this blog](../../)

<ul class="post-list">
{% for post in site.categories.package reversed %}
  <li><article><a href="{{ site.url }}/package/{{ post.packageurl }}">{{ post.title }} {% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
