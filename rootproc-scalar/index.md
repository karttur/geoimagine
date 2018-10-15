---
layout: rootprocess
title: Scalar
excerpt: Scalar processing
rootprocid: Scalar
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Scalar' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
