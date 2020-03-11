---
layout: page
title: Setup and run Karttur's GeoImagine Framework
excerpt: "An archive of articles on how to setup and run Karttur's GeoImagine Framework."
search_omit: true
---

Karttur's GeoImagine Framework is built in Python using the <span class='app'>Eclipse</span> Integrated Development Environment (IDE) with postreSQL as database and links to different high level Geospatial data processing engines. The setup of the Spatial Data IDE (SPIDE) with all its components is covered in the blog [Install and setup SPIDE](https://karttur.github.io/setup-ide/). This section covers the setup of the complete Framework.

The first step in the setup series [Set up the database (setup_db)](./setup-db/) defines the complete databas _and_ installs a single root process with a single sub process - allowing the user to define and install all other processes associated with the Framework. That subprocesses (_addsubproc_) allows the superuser (usually the owner of the machine where the Framework is installed) to define all other processes - the topic of the post [Setup processes (setup_processes)](./setup-processes/). The post on [Regions](./setup-regions/) defines and adds geographical regions. If you want to load pre-formatted datasets, e.g. available on Karttur´s GitHub pages, to the Framework, how to do that is explained in the post on [Transfer data to Karttur's GeoImagine Framework](./setup-transfer). You can only transfer datasets that were either imported or created by the internal Framework data engine. All other datasets need to be imported. To understand the different you need to understand the [Framework concept](../concept/).

<ul class="post-list">
{% for post in site.categories.setup reversed %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
