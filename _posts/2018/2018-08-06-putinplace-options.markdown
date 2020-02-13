---
layout: article
title: Options for getting project to Eclipse
categories: putinplace
excerpt: "Options for importing Karttur's GeoImagine Framework as a PyDev project to Eclipse"
tags:
  - Clone Karttur's GeoImagine Framework
  - Setup Karttur's GeoImagine Framework
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-08-06  T18:17:25.000Z'
modified: '2020-02-12 T18:17:25.000Z'
comments: true
share: true
figure1: eclipse_select_import
figure2: eclipse_import_project_from_file_system_or_archive
---

## Introduction

A PyDev project residing as a repository (repo) at GitHub.com can be imported to <span class='app'>Eclipse</span> using different routes:

- Direct cloning from within <span class='app'>Eclipse</span> (with or without rights to push back changes).
- Separate downloading or cloning followed by project import.
- Separate download or cloning followed by copy and paste of selected parts.

In the two latter cases, you can use different tools for the download/cloning. And if you have the rights you can also push changes back to the GitHub repo. But you can choose to separate the clone and the working copy.

Note that using a web browser and then cloning or downloading a repo from the browser does not work with repos that contain submodules. If you try to download or clone Karttur's GeoImagine Framework with your web browser you will end up with an empty project - the actual Python packages, residing in submodules, will not be included. You can solve that by downloading, and renaming, all the repos containing the individual packages. How to do that is summarised below.

This post outlines the differences between the methods you can chose from for accessing Karttur´s GeoImagine Framework. If you already know which route to take, just proceed to the post with your preferred alternative.

## Direct cloning from within <span class='app'>Eclipse</span>

The direct cloning of Karttur's GeoImagine Framework from within <span class='app'>Eclipse</span> is covered in the post [Git clone with Eclipse](../putinplace-clone-eclipse/). The advantages with direct cloning from inside <span class='app'>Eclipse</span> include that the project is directly linked (imported) and that you can easily access Framework upgrades from within <span class='app'>Eclipse</span>, but you can not push any changes back. And that means that your own edits will be lost when upgrading. The post on cloning in this blog is similar to the post [Clone PyDev project from GitHub](https://karttur.github.io/setup-ide/setup-ide/install-with-conda-env/) in the blog on [Install and setup SPIDE](https://karttur.github.io/setup-ide/).

## Create your own GitHub repo

If you want to create your own GitHub repo and use it for developing your own code, for instance a customized version of Karttur's GeoImagine Framework, this is covered in two development posts:

-  [Setup Eclipse teamed with GitHub repository](../../develop/develop-github-eclipse).
- [GitHub Submodules](../../develop/develop-submodules/).

The posts are built around the same system solution use for Karttur's GeoImaginge Framework: an empty container to which other repos are linked.

## Separate Download or clone

### Browser

As mentioned above, if you download or clone the Framework from its [GitHub repo](https://github.com/karttur/kt-gi-test01/), you will receive the Framework, but without any content. You can use this route, but then you have download each individual package, or repo, and put its content into the right place in the Framework. All packages are listed above, with the name of the repo and the name of the package:

repo -> package

```
geoimagine-kartturmain -> kartturmain
geoimagine-ancillary -> ancillary
geoimagine-dem -> dem
geoimagine-endmembers -> endmembers
geoimagine-export -> export
geoimagine-extract -> extract
geoimagine-gdalutilities -> gdalutilities
geoimagine-gis -> gis
geoimagine-grace -> grace
geoimagine-image -> image
geoimagine-jekyllise -> jekyllise
geoimagine-ktgraphics -> ktgraphics
geoimagine-ktnumba -> ktnumba
geoimagine-ktpandas -> ktpandas
geoimagine-landsat -> landsat
geoimagine-layout -> layout
geoimagine-mask -> mask
geoimagine-modis -> modis
geoimagine-overlay -> overlay
geoimagine-postgresdb -> postgresdb
geoimagine-projects -> projects
geoimagine-region -> region
geoimagine-scalar -> scalar
geoimagine-sentinel -> sentinel
geoimagine-setup_db -> setup_db
geoimagine-setup_process -> setup_process
geoimagine-smap -> smap
geoimagine-soilmoisture -> soilmoisture
geoimagine-specials -> specials
geoimagine-sqldumps -> sqldumps
geoimagine-support -> support
geoimagine-timeseries -> timeseries
geoimagine-transform -> transform
geoimagine-updatedb -> updatedb
geoimagine-userproj -> userproj
geoimagine-zipper -> zipper
```

### Git commandline tool

If you prefer to use commandline tools, then <span class='terminalapp'>git</span> is the options to you. Installation and setup (and updating) is covered in the development post on [Git commandline](../../develop/develop-commandline/). How to proceed to clone the complete Framework is then described in the post on [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git).

### GitHub Desktop

Perhaps the easiest way if you are not familiar with <span class='terminalapp'>git</span> and commandline tools is to download and install <span class='app'>GitHub Desktop</span> and then use this Graphical User Interface to GitHub.com from cloning the complete Framework. How to do that is also  described in the post on [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git).
