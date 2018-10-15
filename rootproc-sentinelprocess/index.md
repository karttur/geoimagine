---
layout: rootprocess
title: SentinelProcess
excerpt: Specific Sentinel processes (download, organise, explode, cloud, masking)
rootprocid: SentinelProcess
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'SentinelProcess' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
