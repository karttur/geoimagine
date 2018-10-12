---
layout: page
title: Packages
excerpt: "An archive of Katturs's GeoImagine Framework"
search_omit: true
---

<ul class="post-list">
{% for post in site.categories.package %}
    title
    {{ post.title }}

{% endfor %}  
</ul>

<ul class="post-list">
{% for post in site.categories.package %}
  <li><article><a href="{{ site.url }}{{ post.packageurl }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>

title
excerpt
and
