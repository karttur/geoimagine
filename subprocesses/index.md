---
layout: page
title: Processes
excerpt: "An archive of processes in Katturs's GeoImagine Framework"
search_omit: true
---

<ul class="post-list">
{% for post in site.categories.subprocess %}
  <li><article><a href="{{ site.url }}/subprocess/{{ post.processurl }}">{{ post.title }} ({{ post.rootprocid }})<span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
