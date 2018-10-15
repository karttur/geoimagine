---
layout: rootprocess
title: specimen
excerpt: Process for handling specimen data
rootprocid: specimen
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'specimen' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
