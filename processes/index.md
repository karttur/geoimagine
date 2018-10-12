---
layout: page
title: Processes
excerpt: "An archive of processes"
search_omit: true
---

<h1 class='foot-description'></h1>
<h1 class='foot-description'>SMAP processes</h1>

{% for post in site.categories.journal %}
  {% if post.projectid == "process" %}
    {% if post.rootprocid == "smapproc" %}
      {% include publication.html post=post %}
    {% endif %}
  {% endif %}
{% endfor %}  
</ul>
