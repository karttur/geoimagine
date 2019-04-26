---
layout: rootprocess
title: ManageSqlDumps
excerpt: Import sql dump to the database
rootprocid: ManageSqlDumps
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'ManageSqlDumps' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
