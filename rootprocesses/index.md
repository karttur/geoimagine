---
layout: page
title: Rootprocesses
excerpt: "An archive of root processes in Katturs's GeoImagine Framework"
search_omit: true
---

<ul class="post-list">
{% for post in site.categories.rootprocess %}
  <li><article><a href="{{ site.url }}/{{ post.processurl }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
