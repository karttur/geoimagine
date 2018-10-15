---
layout: rootprocess
title: SMAPProc
excerpt: Specific SMAP processes (order, download, organize)
rootprocid: SMAPProc
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'SMAPProc' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
