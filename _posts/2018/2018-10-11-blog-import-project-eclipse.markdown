---
layout: post
title: Set up Karttur's GeoImagine Framework
modified: '2018-10-11 T18:17:25.000Z'
categories: blog
excerpt: "Setting up Karttur's GeoImagine Framework in Eclipse"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-11 T18:17:25.000Z'
comments: true
share: true
---

# Introduction

This post will demonstrate how to install and setup Karttur's GeoImagine Framework in <span class='app'>Eclipse</span>.

# Prerequisites

To follow this post you must have the complete Spatial Data IDE (SPIDE) installed, including <span class='app'>Eclipse</span> set up for PyDev, <span class='app'>Anaconda</span> and <span class='app'>PostgreSQL</span>. How to do that is described in a separate blog: [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You need to install and setup all the parts in that blog, preferably using [Python3 and Anaconda3](https://karttur.github.io/setup-ide/blog/python3-upgrade/). The rest of this post assumes that you have accomplished the installation of the SPIDE.

# Cloning Kartur's GeoImagine Framework

The core of Kartur's GeoImagine Framework is freely available at Github.com. To see which parts are available at any time, check the [GeoImagine Python Packages](https://karttur.github.io/geoimagine/packages/) page.

What packages you need depends on the kind of data you are going to process in the framework. In general you need all packages, except packages for data specific processing for source data you are not interested in:

- [Landsat (geoimagine-landsat)](https://github.com/karttur/geoimagine-landsat)
- [MODIS (geoimagine-modis)](https://github.com/karttur/geoimagine-modis)
- [Sentinel (geoimagine-sentinel)](https://github.com/karttur/geoimagine-sentinel)
- [SMAP (geoimagine-smap)](https://github.com/karttur/geoimagine-smap)

Other spatial data sources are imported to the Framework using [ancillary package](https://github.com/karttur/geoimagine-ancillary).

# Eclipse project

The first thing you need to do is to create a PyDev project in <span class='app'>Eclipse</span> as described in the blogpost [Setup Eclipse for PyDev](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/). Just create an empty PyDev project.

To load the python packages into your project you can either import the packages one at the time (e.g. using simple drag and drop), or import the entire structure after downloading or cloning from GitHub.


## Connect Python and PostgreSQL

The Framework relies on a postgres database that holds all the processes as well as all the data. The installation of the postgres database should already have been done as described in the blogpost [Install postgreSQL and postGIS](hhttps://karttur.github.io/setup-ide/setup-ide/install-postgres/). Then you must also have installed and setup <span class='package'>psycopg</span> for connecting Python to postgres, plus created a security solution for the connection as desribed in the post [Connect Python and PostgreSQL using psycopg2](https://karttur.github.io/setup-ide/setup-ide/connect-with-psycopg2/).

### Login and password (.netrc)

At this point you need to set the login and password of the users that will access different parts of the postgres database. By default each schema of the database is managed by a different role (user). I am not a specialist in databases, and the solution is a bit complicated. What you need to do is to create the <span class='file'>.netrc</span> file and enter all the combinations of login and password needed.

<span class='terminal'>$ pico .netrc</span>

```
machine localhost0   login superuser password abc
machine localhost1   login produser  password abc
machine usermanager login usermanager password abc
machine managelayout login managelayout password abc
machine managemodis login managemodis password abc
machine manageregion login manageregion password abc
machine formatread login formatread password abc
machine regionread login regionread password abc
machine manageancillary login manageancillary abc
machine managesentinel login managesentinel password abc
machine managesoilmoisture login managesoilmoisture password abc
machine managelandsat login managelandsat password abc
machine managesmap login managesmap password abc
```

Then you have to edit the shell script file that sets the roles (users) and their passwords to the postgred db. They must of course correspond to how you set them in the <span class='file'>.netrc</span> file.

Also the file <span class='file'>general_grant_v80_sql.xml</span> must be updated (only keep one of them.)

## Setup the Framework database and processes

Two special packages are needed for building the framework database and the the processes that are included:

- setup-db ([geoimagine-setup_db](https://github.com/karttur/geoimagine-setup_db/))
- setup-processes ([geoimagine-setup_processes](https://github.com/karttur/geoimagine-setup_processes/))

### Setup database

The blogpost [Connect Python and PostgreSQL using psycopg2](https://karttur.github.io/setup-ide/setup-ide/connect-with-psycopg2/) contains a python script for creating databases in postgres using Python. And the blogpost [Postgres setup with Python & xml](https://karttur.github.io/setup-ide/setup-ide/setup-db-karttur/) describes how to combine xml and python to create tables.

The framework package geoimagine-setup_db](https://github.com/karttur/geoimagine-setup_db/) contains the same python modules, plus all the xml and txt documents (files) needed for setting up the complete database structure of Karttur's GeoImagine Framework. Installing and running the <span class='package'>setup_db</span> package will setup the complete structure of schemas and tables used by karttur's GeoImagine Framework. The package also installs the system superuser and two processes: _addrootproc_ and _addsubproc_. Having access to the superuser and the two processes, all other processes can be installed using the <span class='package'>setup_processes</span>.


### Setup processes

The package <span class='package'>setup_processes</span> contains three python modules; _setup_process_main.py_, _setup_process_class.py_ and _setup_process_regions.py_. The main module links to xml documents, stored within the package under the <span class='path'>doc</span> folder, defining the setup of all available processes. Additionally, the module _setup_process_regions.py_ can be used for creating and importing some default regional data.
