---
layout: rootprocess
title: Periodicity
excerpt: Process for period setting
rootprocid: Periodicity
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Periodicity' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
