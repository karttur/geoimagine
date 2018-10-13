---
layout: resume
title: Processes
excerpt: "An archive of processes"
search_omit: true
share: true
---

<h1 class='foot-description'></h1>
<h1 class='foot-description'>SMAP processes</h1>

<ul class="post-list">
{% for post in site.categories.process %}
    {% if post.rootprocid == "smapproc" %}
      {{ post.subprocid }}
    {% endif %}
{% endfor %}  
</ul>
