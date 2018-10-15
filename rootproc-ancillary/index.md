---
layout: rootprocess
title: Ancillary
excerpt: Process for handling ancillary data
rootprocid: Ancillary
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Ancillary' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
