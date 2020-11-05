---
layout: article
title: Fork your own Framework
categories: putinplace
excerpt: Clone Karttur's GeoImagine Framework from GitHub using GitHub Desktop and the terminal
previousurl: prep/prep-conda-environ
nexturl: null
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-09-06 T08:17:25.000Z'
modified: '2020-03-12 T08:17:25.000Z'
comments: true
share: true
figure1: github-framework_karttur_101_github-repo-top
figure2: github-framework_karttur_102_github-repo-geoimagine
figure3: github-framework_karttur_103_clone-to-desktop
figure4: github-framework_karttur_104_clone-repo-desktop
figure5: github-framework_karttur_105_clone-a-repo-desktop
---

## Introduction

This post describes how to setup your own mirror (or _fork_) of Karttur´s GeoImagine Framework on GitHub.com, clone it to you local system, track your own changes as well as updates at Karttur's upstream repo and suggest improvements. The most efficient setup is using [git terminal tool](../../develop/develop-commandline), but it also works with [GitHub Desktop](https://desktop.github.com); both alternatives are described in the post [Git clone with GitHub Desktop and terminal]((../putinplace-clone-desktop-git)). But in this post you will first _fork_ the complete Framework and then clone it from a GitHub account that you have access to. This means that you can push any changes you make to your online repo, and then send a pull request to Karttur with a suggestion to incorporate your changes in the original code. Further, you can follow, and update your own mirror with, changes made in the Framework at [github.com/karttur](https://github.com/karttur).

This post is a summary of my blog on [git command line](https://karttur.github.io/git-vcs/) contains detailed tutorials on how to use <span class='terminalapp'>git</span>, including a tutorial on [Forking repositories](https://karttur.github.io/git-vcs/git/git-forks/), and then ends with a post on [git for Karttur's GeoImagine Framework](https://karttur.github.io/git-vcs/git/git-karttur-geoimagine-clone/). This post is a summary of the blog [git command line]( )

## Prerequisits

To _fork_ a mirror of Karttur's GeoImagine Framework that you can control, you must have your own GitHub account. [GitHub.com](https://github.com). You then either use [<span class='app'>GitHub Desktop</span>](https://desktop.github.com) or the [<span class='terminalapp'>git</span> commandline tool](../../develop/develop-commandline/).

## Karttur's GitHub repository

Go to [GitHub.com](https://github.com), if you do not have an account it is free to [create an account](https://github.com/join), and sign in. Go to Karttur's repository containing the [complete GeoImagine Framework (kt-gi-test01)](https://github.com/karttur/kt-gi-test01/). This repository in more or less an empty shell with all the GeoImagine Framework packages linked as submodules. The top level of the repository only contains a few files.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

If you drill down (by clicking), first to _Karttur2019GitHub_ (the PyDev project) and then to _geoimagine_, you will see the list of all python packages beloning to the GeoImagine Framework.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2].file }}">
<figcaption> {{ site.data.images[page.figure2].caption }} </figcaption>
</figure>

### Clone the GeoImagine Framework project

This tutorial covers three routes for cloning Karttur's complete GeoImagine Framework to your local machine:

1. Clone from online repository
3. Clone directly from <span class='app'>GitHub Desktop</span>
3. Clone using the <span class='terminalapp'>git</span> command line tool

#### Clone from online repository

In your web-browser, return to the top of Karttur's assembled Framework project [https://github.com/karttur/kt-gi-test01](https://github.com/karttur/kt-gi-test01). Click the <span class='button'>Clone or Download</span> button and then click the <span class='button'>Open in Desktop</span> button. If you click "Download ZIP", you will get a download but with **empty** submodules and this will **not** work.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure3].file }}">
<figcaption> {{ site.data.images[page.figure3].caption }} </figcaption>
</figure>

Your local copy of <span class='app'>GitHub Desktop</span> will start, and then guide you through the cloning process.

#### Clone directly from <span class='app'>GitHub Desktop</span>

Instead of linking to <span class='app'>GitHub Desktop</span> from the online GitHub repository, you can start your copy of <span class='app'>GitHub Desktop</span> and go via the menu:

<span class='menu'>File --> Clone Repository...</span>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure4].file }}">
<figcaption> {{ site.data.images[page.figure4].caption }} </figcaption>
</figure>

In the window <span class='tab'>Clone a Repository</span> that opens, fill in the <span class='textbox'>Repository URL</span> and the <span class='textbox'>Local Path</span>. When complete, press <span class='button'>Clone</span>.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure5].file }}">
<figcaption> {{ site.data.images[page.figure5].caption }} </figcaption>
</figure>

#### Clone using Git command line tools

Start a <span class='app'>Terminal</span> session. Change directory <span class='terminal'>cd</span> to the parent directory where you want to save the GitHub project (repository):

<span class='terminal'>$ cd /Users/thomasgumbricht/eclipse/repos</span>

If you accept that the repo you are going to clone will have the same local name as online (recommended), execute the command:

<span class='terminal'>$ git clone https://github.com/karttur/kt-gi-test01</span>

If you want the local clone to have another name, instead use:

<span class='terminal'>$ git clone https://github.com/karttur/kt-gi-test01 karttur-geoimagine-01</span>

To speed up the cloning of multiple submodules (up to 8 parallel downloads) and get all the linked submodule repositories cloned (version 2.13 and later) you should be able to execute:

<span class='terminal'>$ git --recurse-submodules -j8 clone https://github.com/karttur/kt-gi-test01 [karttur-geoimagine-01]</span>


But with Git version 2.16 it did not work out for me.

Check that the cloned repo actually contain all the GeoImagine Framework python packages. if not, <span class='terminal'>cd</span> to the top directory (kt-gi-test01 or karttur-geoimagine-01). Then execute the following commands for initiating and then updating all the the submodule linked repositories.

<span class='terminal'>$ git submodule init</span>

<span class='terminal'>$ git submodule update</span>

#### Update submodules

To update all submodules to latest individual _commit_ of each, run the command:

<span class='terminal'>$ git submodule foreach git pull origin master</span>


### import or copy project to <span class='app'>Eclipse</span>

Regardless of which route you chose for cloning the GitHub repo containing the PyDev project and packages, you should now have a complete, working, clone in your local machine. The next step is to either [import](../putinplace-import-project-eclipse) or [copy](../putinplace-copy-project-eclipse) the Framework project to <span class='app'>Eclipse</span>.
