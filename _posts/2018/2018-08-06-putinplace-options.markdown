---
layout: post
title: Options for getting project to Eclipse
categories: putinplace
excerpt: "Options for importing Karttur's GeoImagine Framework as a PyDev project to Eclipse"
tags:
  - Clone Karttur's GeoImagine Framework
  - Setup Karttur's GeoImagine Framework
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-08-06  T18:17:25.000Z'
modified: '2018-08-06 T18:17:25.000Z'
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

In the two latter cases, you can use different tools for the cloning. And if you have the rights you can also push changes back to the GitHub repo.

This post outlines the differences between the methods you can chose from for accessing Karttur´s GeoImagine Framework. If you already know which route to take, just proceed to the post with your preferred alternative.

Note that using a web browser and then cloning or downloading a repo from the browser does not work with repos that contain submodules. If you try to download or clone Karttur's GeoImagine Framework with your web browser you will ned up with an empty project - the actual Python packages, residing in submodules, will not be included.

## Direct cloning from within <span class='app'>Eclipse</span>

The direct cloning of Karttur's GeoImagine Framework from within <span class='app'>Eclipse</span> is covered in the post [Git clone with Eclipse](../putinplace-clone-eclipse/). The advantages with direct cloning from inside <span class='app'>Eclipse</span> include that the project is directly linked (imported) and that you can easily access Framework upgrades from within <span class='app'>Eclipse</span>, but you can not push any changes back. And that means that your own edits will be lost when upgrading. The post on cloning in this blog is similar to the post [Clone PyDev project from GitHub](https://karttur.github.io/setup-ide/setup-ide/install-with-conda-env/) in the blog on [Install and setup SPIDE](https://karttur.github.io/setup-ide/).

The alternative is to clone or download a complete copy of the Framework and then either import the complete Framework or build a backbone project and copy selected packages. These alternatives are outlines below with links to detailed manuals in other posts of this blog.

## Create your own GitHub repo

If you want to create your own GitHub repo and use it for developing your own code, for instance a customized version of Karttur's GeoImagine Framework, this is covered in two development posts:

-  [Setup Eclipse teamed with GitHub repository](../../develop/develop-github-eclipse).
- [GitHub Submodules](../../develop/develop-submodules/).

The posts are built around the same system solution use for Karttur's GeoImaginge Framework: an empty container to which other repos are linked.

## Separate Download or clone

### Browser


### Git commandline tool

If you prefer to use commandline tools, then <span class='terminalapp'>git</span> is the options to you. Installation and setup (and updating) is covered in the development post on [Git commandline](../../develop/develop-commandline/).


### GitHub Desktop
