---
layout: rootprocess
title: manageprocess
excerpt: Mangaging a processes requires data on all parameters and their type and default values
rootprocid: manageprocess
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'manageprocess' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
