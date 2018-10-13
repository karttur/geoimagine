---
layout: resume
title: Processes
excerpt: "An archive of processes"
search_omit: true
share: true
---

<h1 class='foot-description'></h1>
<h1 class='foot-description'>SMAP processes</h1>


CLIPPO
<ul class="post-list">
{% for post in site.categories.process %}
  HIPPO
  {% include process.html post=post %}
{% endfor %}  
</ul>

BLIPPO
<ul class="post-list">
{% for post in site.categories.process %}
    {% if post.rootprocid == "smapproc" %}
      {% include process.html post=post %}
    {% endif %}
{% endfor %}  
</ul>
TRIPPO
<h1 class='foot-description'></h1>
<h1 class='foot-description'>SMAP processes</h1>

<ul class="post-list">
{% for post in site.categories.process %}
    {% if post.rootprocid == "setup_db" %}
      {% include process.html post=post %}
    {% endif %}
{% endfor %}  
</ul>
