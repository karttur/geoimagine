---
layout: rootprocess
title: ExtractLayerData
excerpt: Extracts data from layers and saves to database
rootprocid: ExtractLayerData
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'ExtractLayerData' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
