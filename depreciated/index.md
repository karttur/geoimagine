---
layout: page
title: Depreciated and obsolete tutorials
excerpt: "An archive of depreciated and obsolete articles related to Karttur's GeoImagine Framework."
search_omit: true
---

Depreciated and obsolete articles related to Karttur's GeoImagine Framework.

<ul class="post-list">
{% for post in site.categories.depreciated %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
