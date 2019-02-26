---
layout: rootprocess
title: Transform
excerpt: Transform data sources
rootprocid: Transform
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Transform' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
