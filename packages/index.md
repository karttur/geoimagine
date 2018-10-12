---
layout: page
title: Processes
excerpt: "An archive of Katturs's GeoImagine Framework"
search_omit: true
---

<h1 class='foot-description'></h1>
<h1 class='foot-description'>Packages</h1>

<ul class="post-list">
{% for post in site.categories.package %}
    {% include publication.html post=post %}
{% endfor %}  
</ul>

<ul class="post-list">
{% for post in site.categories.package %}
  <li><article><a href="{{ site.url }}{{ packageurl.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>

title
excerpt
