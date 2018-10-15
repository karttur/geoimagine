---
layout: rootprocess
title: ManageProject
excerpt: Add, update, construct or delete projects
rootprocid: ManageProject
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'ManageProject' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
