---
layout: page
title: Root Processes
excerpt: "An archive of root processes in Katturs's GeoImagine Framework"
search_omit: true
---

Karttur´s GeoImagine Framework is built around object oriented processes. Everything that the Framework can do, including defining new capacities, datasets or users, is done using processes. Processes that can actually be called are called sub-processes, and all of these belong to one, and only one, root process. Below is a list of the Root Processes at present available in Karttur's GeoImagine Framework. Click on a Root Processes to see which sub-processes it contains. 

<ul class="post-list">
{% for post in site.categories.rootprocess %}
  <li><article><a href="{{ site.url }}/{{ post.processurl }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
