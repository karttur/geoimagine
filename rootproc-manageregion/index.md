---
layout: rootprocess
title: ManageRegion
excerpt: Create, change or delete regions
rootprocid: ManageRegion
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'ManageRegion' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
