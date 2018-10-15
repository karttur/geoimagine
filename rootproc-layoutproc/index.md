---
layout: rootprocess
title: LayoutProc
excerpt: Manage Layout processes
rootprocid: LayoutProc
search_omit: True
share: True
---
<h1 class='foot-description'>Sub processes</h1>
<ul class='post-list'>
{% for post in site.categories.subprocess %}
 {% if post.rootprocid == 'LayoutProc' %}
   {% include subprocess.html post=post %}
 {% endif %}
{% endfor %}
</ul>
