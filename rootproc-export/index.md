---
layout: rootprocess
title: Export
excerpt: Export data
rootprocid: Export
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Export' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
