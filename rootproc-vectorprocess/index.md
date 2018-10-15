---
layout: rootprocess
title: VectorProcess
excerpt: Manage vector processing
rootprocid: VectorProcess
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'VectorProcess' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
