---
layout: post
title: Setup processes
modified: '2018-10-15 T18:17:25.000Z'
categories: blog
excerpt: "Setup the processes for Karttur's GeoImagine Framework"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-15 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post will demonstrate how to add the parameters of processes included in Karttur's GeoImagine Framework Spatial Data Integrated Development Environment (SPIDE). The processes as such are not added, only the parameters required for running the processes are added to the databases, that you should have installed as shown in the [previous](../blog-setup_db/) post.

# Prerequisites

You must have the complete SPIDE installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must also have setup Karttur's GeoImagine Framework, either by [importing](../blog-importy-project-eclipse/) or by [copying (drag and drop)](../blog-copy-project-eclipse/). You must also have setup the complete Framework database as described in the [previous](../blog-setup-db/) post.

How to run processes, including the setup described in this post, is described in an [earlier](../blog-run/) post. The xml files required for running the processes described in the post are included in the [<span class='package'>setup_processes</span>](https://github.com/karttur/geoimagine-setup_processes/) package. To understand the structure of the xml file you can read [this](../blog-xml/) post.

# Framework processes

All functionalities of Karttur's GeoImagine Framework are called processes and operate based on parameters defined in the Framework database. Thus a process must be defined in the database before it can be used. Processes are grouped in roots, where a root is usually associated either with a typical class of functions (e.g. overlay, scalar, export) or data sources (e.g Landsat, Sentinel, MODIS etc).

The database setup in the [previous](../blog-setup-db/) post added one root group (manageprocess) and one process (addsubproc) belonging to this group. The process <span class='package'>addsubproc</span> is the function that allows defining all other processes.

A complete list of root processes is available [here](../../rootprocesses/) and all the processes are listed [here](../../subprocesses/).

# Python package setup_processes

The setup of processes is done from the special package [<span class='package'>setup_processes</span>](https://github.com/karttur/geoimagine-setup_processes/). This package contains five <span class='file'>.py</span> files, the standard modules <span class='package'>\_\_init\_\_.py</span> and <span class='package'>version.py</span>, plus one main module, one class module and one module for adding regions:

- setup_process_main.py
- setup_process_class.py
- setup_process_regions.py

The package contains several subfolders. The subfolder <span class='file'>dbdoc</span> contains all the processes, whereas the other subfolders contain thematic processes and default or template data related to different data source systems.

## setup_processes_main.py

The main module, <span class='module'>setup\_process\_main.py</span>, only contains one linked text file <span class='file'>process\_karttur\_setup\_YYYYMMDD.txt</span>. The textfile, however links to all the xml files (under the subfolder dbdoc/xml). Running setup\_processes\_main.py installs all the interfaces for standard processing capabilities of the Framework.

### Add default users

The next lines under the \_\_main\_\_" section link to the text file <span class='file'>db_karttur_dbusers_YYYYMMDD.txt</span>, that, in turn, links to a single xml file <span class='file'>general_grant_v80_sql.xml</span>. This xml file contains all the database roles and rights, including passwords. As stressed in the [previous post](../blog-setup-dblink/) you need to edit the passwords to match the <span class='file'>.netrc</span> file that is used for accessing the database at runtime.

## setup_process_regions.py

The module <span class='package'>setup_process_regions</span> can be used to setup regional datasets, including the predefined tiling systems. It is the main topic of the [next](../blog-setup-regions/) post.
