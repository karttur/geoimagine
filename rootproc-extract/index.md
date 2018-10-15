---
layout: rootprocess
title: Extract
excerpt: Process for extracting raster under vector
rootprocid: Extract
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Extract' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
