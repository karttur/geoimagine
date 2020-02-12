---
layout: page
title: Get Karttur's GeoImagine Framework into Eclipse
excerpt: "An archive of articles on how to link the GeoImagine Framework from GitHub to Eclipse."
search_omit: true
---

Karttur´s GeoImagine Framework is built in Python using the Eclipse Integrated Development Environment (IDE). The complete code is available on [Karttur´s GitHub pages](https://karttur.github.io/geoimagine/). There are several options for putting the complete code in place in <span class='app'>Eclipse</span>. The alternatives are outlined in some detail in the first post on [Options for importing project to Eclipse](putinplace-options).

In the [develop section](../develop/) you find posts on how to construct the GitHub repo.

<ul class="post-list">
{% for post in site.categories.putinplace reversed %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
