---
layout: post
title: Git clone with Eclipse
categories: putinplace
excerpt: Clone Karttur's GeoImagine Framework from GitHub using Eclipse
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-09-04 T08:17:25.000Z'
modified: '2018-09-04 T08:17:25.000Z'
comments: true
share: true
figure1: github-framework_karttur_01_openperspective
figure2: github-framework_karttur_02_select-git-perspective
figure3: github-framework_karttur_03_Git-repo-alternatives
figure301: github-framework_karttur_0301_Git-repo-alternatives
figure4: github-framework_karttur_04_Source-Git-repo
figure5: github-framework_karttur_05_Git-branch-select
figure6a: github-framework_karttur_06a_Git-local-dst
figure7: github-framework_karttur_07_Git-repo-proj
figure0X: github-framework_karttur_0X_eclipse-perspectives
figure0Xa: github-framework_karttur_0X_menu-eclipse-perspectives
figure0Xb: github-framework_karttur_0X_menu-eclipse-perspectives2
figure25: github-framework_karttur_25_update-submodules
---

## Introduction

This post explains how to clone Karttur's GeoImagine Python project from GitHub.com with <span class='app'>Eclipse</span>. The advantages include that the project is directly linked (imported) to <span class='app'>Eclipse</span> and that you can easily access Framework upgrades from within <span class='app'>Eclipse</span>, but you can not push any changes back.

The alternatives are to clone or download a complete copy of the Framework using [<span class='app'>GitHub Desktop</span>](../putinplace-clone-desktop-git) or the [Git commandline tool](../putinplace-git-dcommandline) and then either [import the complete Framework](../putinplace-import-project-eclipse) or [build a backbone project and copy selected packages](../putinplace-copy-project-eclipse). The advantage with the latter solutions is that you then separate the cloning and working with the code, and <span class='app'>GitHub Desktop</span> is better than <span class='app'>Eclipse</span> for handling GitHub repositories, and if you prefer the command line, <span class='terminalapp'>git</span> is the natural choice.

The remaining part of this post is similar to the post [Clone PyDev project from GitHub](https://karttur.github.io/setup-ide/setup-ide/install-with-conda-env/) in the blog on [Install and setup SPIDE](https://karttur.github.io/setup-ide/).

## Prerequisits

You can clone Karttur´s GeoImagine Python project as described in here as long as you have <span class='app'>Eclipse</span> installed. To create a fully functional GeoImagine Framework you must also have installed the Spatial Data Integrated Development Environment (SPIDE) as outlined in the blog [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/).

## Add GitHub repo to <span class='app'>Eclipse</span>

There are many online tutorials for cloning GitHub projects into <span class='app'>Eclipse</span>, but I have not found any that deals with cloning a PyDev project. And that is what is outlined in the rest of this post.

### Clone GitHub repository with Eclipse

Start <span class='app'>Eclipse</span>. Once in, click the <span class='icon'>Open Perspective</span> icon and select Git, or start writing "Git" in <span class='textbox'>Quick access</span> textbox.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

If you get different options for which perspective to select, click the alternative for Git and then <span class='button'>Open</span> it.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2].file }}">
<figcaption> {{ site.data.images[page.figure2].caption }} </figcaption>
</figure>

The view <span class='tab'>Git repositories</span> should open (if not use the <span class='textbox'>Quick access</span> textbox and type Git, then select <span class='menu'>View --> Git repositories</span>). In the <span class='tab'>Git repositories</span> view you should click the alternative _Clone a Git repository_ (if no text appears slide the cursor over the icons to get the alternative _Clone a Git repository and add the clone to this view_).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure3].file }}">
<figcaption> {{ site.data.images[page.figure3].caption }} </figcaption>
</figure>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure301].file }}">
<figcaption> {{ site.data.images[page.figure301].caption }} </figcaption>
</figure>

In the dialogue window for <span class='tab'>Source Git Repository</span>, fill in the url to the repository (you can copy the path from your GitHub.com account). Leave all other options with their defaults values (including empty).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure4].file }}">
<figcaption> {{ site.data.images[page.figure4].caption }} </figcaption>
</figure>

Click the <span class='button'>Next ></span> button. This will take you to the <span class='tab'>Branch Selection view</span>. Make sure _master_ is selected and again click <span class='button'>Next ></span>.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure5].file }}">
<figcaption> {{ site.data.images[page.figure5].caption }} </figcaption>
</figure>

The next view is for <span class='tab'>Local Destination</span>. Either accept the default or navigate and select your preferred destination path. The destination folder does not necessaily need to have the same name as the online repository (_kt-gi-test01_ in the example), but it is recommended. Click <span class='button'>Next ></span> to continue.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure6a].file }}">
<figcaption> {{ site.data.images[page.figure6a].caption }} </figcaption>
</figure>

When ready, click <span class='button'>Finish</span> and the GitHub remote repository should be cloned to your local machine. If it worked properly you should see the cloned repository in the <span class='tab'>Git Repositories</span> view.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure7].file }}">
<figcaption> {{ site.data.images[page.figure7].caption }} </figcaption>
</figure>

### Import GitHub project to <span class='app'>Eclipse</span>

![My Map]({{ site.commonurl }}/images/github-framework_karttur_0X_eclipse-perspectives.jpg)
{: .pull-right}
Once imported, switch to the PyDev perspective. The perspectives available are in the upper right corner of the Eclipse window.


If the Python icon is not included among the predefined perspective icons, go via the menu system:

<span class='menu'>Window --> Perspective --> Open Perspective --> Other</span>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure0Xa].file }}">
<figcaption> {{ site.data.images[page.figure0Xa].caption }} </figcaption>
</figure>

In the options window that opens, select PyDev and then clock <span class='button'>Open</span>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure0Xb].file }}">
<figcaption> {{ site.data.images[page.figure0Xb].caption }} </figcaption>
</figure>

### Managing GitHub submodules

You should now have Karttur´s GeoImagine Framework installed on your local machine, added with a cloned copy from Karttur's GitHub repository. If your project sub-packages are missing or have no content, you have to run an update on the submodules.

#### Update submodules

The GitHub repo that holds the complete GeoImagine Framework is just an empty container with links to other repos that hold the actual codes (one repo per submodule or PyDev package). This is a special case, and requires that you update the submodules from inside <span class='app'>Eclipse</span> to clone the actual content of each submodule (and fill the packages with the actual code).

![My Map]({{ site.commonurl }}/images/github-framework_karttur_0X_eclipse-perspectives.jpg)
{: .pull-right}
Switch perspective in <span class='app'>Eclipse</span> main window by clicking the Git icon in the upper right corner. If the icon for Git perspective is missing follow the same menu path as outlined above for switching to the PyDev perspective.

In the <span class='tab'>Git Repositories</span> view, expand the project (i.e. click the filled arrow to the left of the project) to see the content (see figure below). You should then see the folder for _Submodules_. If you look inside a submodule, it is most probably empty. That is, as mentioned above, because the Framework repo is just an empty container that links to the repos with the actual code. To clone the complete content of the submodlues (i.e. the Python packages that build up the complete Framework), right click the _Submodules_ and select Update Submodule from the pop-out menu.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure25].file }}">
<figcaption> {{ site.data.images[page.figure25].caption }} </figcaption>
</figure>

It will take a while for the data to download, but then
should have a complete copy, or clone, of the PyDev project repo from GitHub.com.

### Karttur´s GeoImagine Framework

If you want to continue with Karttur's GeoImagine Framework there are some additional steps required. As these steps are very specific they are covered in a separate blog on [Karttur's GeoImagine Framework](https://karttur.github.io/geoimagine/). To continue directly from here in that blog, go to the post on [prepare the database connection](https://karttur.github.io/geoimagine/prepare/prep-dblink/).

### A note on editing the code

You can work with the cloned code and develop/improve it. But you can not push the changes back to the GitHub online repository (unless you have the login and password for Karttur´s GitHub pages). If you could, it would mean that the code of the _master_ branches of the individual packages would change. All changes (updates) on the GeoImagine Framework is done using branches in each package repository, for which I have yet to write the instructions.
