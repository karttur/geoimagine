---
layout: rootprocess
title: Orthogonalize
excerpt: Orthogonalize endmembers into a unitary matrix
rootprocid: Orthogonalize
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'Orthogonalize' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
