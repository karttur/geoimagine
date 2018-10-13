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
  HIPPO
    {% include process.html post=post %}
{% endfor %}  
</ul>

<ul class="post-list">
{% for post in site.categories.process %}
    {% if post.rootprocid == "smapproc" %}
      {% include process.html post=post %}
    {% endif %}
{% endfor %}  
</ul>

<h1 class='foot-description'></h1>
<h1 class='foot-description'>SMAP processes</h1>

<ul class="post-list">
{% for post in site.categories.process %}
    {% if post.rootprocid == "setup_db" %}
      {% include process.html post=post %}
    {% endif %}
{% endfor %}  
</ul>
