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

This post will demonstrate how to install and setup Karttur's GeoImagine Framework in <class span = 'app'>Eclipse</span>.

# Prerequisites

To follow this post you must have the complete Spatial Data IDE (SPIDE)) installed, including <class span = 'app'>Eclipse</span> set up for PyDev, <class span = 'app'>Anaconda</span> and PostgreSQL. How to do that is described in a separate blog: [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You need to install and setup all the parts in that blog, preferably using Python3 and Anaconda3. The rest of this post assumes that you have accomplished the installation of the SPIDE.

# Cloning Kartur's GeoImagine Framework

The core of Kartur's GeoImagine Framework is freely available at Github.com. To see which parts are available at any time, check the [GeoImagine Framework Packages](#) page.

You should download all of the packages you need. What packages you need depends on the kind of data you are going to process in the framework. Data specific packages include:

- Landsat (geoimagine-landsat)
- MODIS (geoimagine-modis)
- Sentinel (geoimagine-sentinel)
- SMAP (geoimagine-smap)
- GRACE (geoimagine-smap)
- TRMM  (geoimagine-trmm)

The data specific packages are not required by any other packages, and can be skipped. Most other packages are dependent on each other, and you should clone all of them to local drive.

# Eclipse project

The first thing you need to do is to craete a PyDev project in <span class='app'>Eclipse</span> as described in the blogpost [Setup Eclipse for PyDev](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/). Just create an empty PyDev project.

Then either use import:


Or drag and drop the packaged you cloned from Karttur´s GitHub repository. Some of the packages will report errors as you will need to install additional packages. Just leave that for now.

## Connect Python and PostgreSQL

The Framework relies on a postgres database that holds all the processes as well as all the data. The installation of the postgres database should already have been done as described in the blogpost [Install postgreSQL and postGIS](hhttps://karttur.github.io/setup-ide/setup-ide/install-postgres/). And then you must also have installed and setup <span class='package'>psycopg</span> for connecting Python to postgres, plus created a security solution for the connection. This is described in detail in the blogpost [Connect Python and PostgreSQL using psycopg2](https://karttur.github.io/setup-ide/setup-ide/connect-with-psycopg2/).

## Setup the Framework database and processes

Two packages are needed for building the framework database and the the procesess that are included:

- setup-db ([geoimagine-setup_db](#https://github.com/karttur/geoimagine-setup_db/))
- setup-processes ([geoimagine-setup_processes](#https://github.com/karttur/geoimagine-setup_processes/))

### Setup database

The blogpost [Connect Python and PostgreSQL using psycopg2](https://karttur.github.io/setup-ide/setup-ide/connect-with-psycopg2/) contains a python script for creating databases in postgres using Python. And the blogpost [Postgres setup with Python & xml](https://karttur.github.io/setup-ide/setup-ide/setup-db-karttur/) describes how to combine xml and python to create tables.

The framework package geoimagine-setup_db](#https://github.com/karttur/geoimagine-setup_db/) contains the same python modules, plus all the xml and txt documents (files) needed for setting up the complete database structure of Karttur's GeoImagine Framework.

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

### Other label

In addition to setting up the complete database, the package also adds two processes to the schema <span class='pacckage'>process</span>:

- addrootprocess
- addsubprocesses

These two processes are used for adding all other processes to the database, and are required for the next step in setting up Karttur's GeoImagine Framework...

# ... Setup Processes
