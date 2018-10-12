---
layout: page
title: Processes
excerpt: "An archive of Katturs's GeoImagine Framework"
search_omit: true
---

<h1 class='foot-description'></h1>
<h1 class='foot-description'>Packages</h1>

<ul class="post-list">
{% for post in site.categories.package %}
    {% include publication.html post=post %}
{% endfor %}  
</ul>
