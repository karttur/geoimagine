---
layout: rootprocess
title: DEM
excerpt: Digital Elevation Model processing
rootprocid: DEM
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'DEM' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
