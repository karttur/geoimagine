---
layout: article
title: Setup Eclipse teamed with GitHub repository
categories: develop
excerpt: How to use a GitHub repository as a shared project enviroment in Eclipse
previousurl: null
nexturl: develop/develop-submodules
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-09-01 T18:17:25.000Z'
modified: '2020-02-11 T18:17:25.000Z'
comments: true
share: true
figure1: github-framework_karttur_01_openperspective
figure2: github-framework_karttur_02_select-git-perspective
figure3: github-framework_karttur_03_Git-repo-alternatives
figure4: github-framework_karttur_04_Source-Git-repo
figure5: github-framework_karttur_05_Git-branch-select
figure6: github-framework_karttur_06_Git-local-dst
figure7: github-framework_karttur_07_Git-repo-proj
figure8: github-framework_karttur_08_eclipse-new-proj
figure9: github-framework_karttur_09_eclipse-pydev-proj
figure10: github-framework_karttur_10_eclipse-pydev-proj2
figure11: github-framework_karttur_11_eclipse-proj-menu
figure12: github-framework_karttur_12_config-proj-repo
figure121: github-framework_karttur_121_package-explorer
figure13: github-framework_karttur_13_eclipse-proj-menu
figure14: github-framework_karttur_14_git-staging
---

**These instructions are for creating a GithHub repository with a frame project linking together all python packages that constitute Karttur's GeoImagine Framework. If you are looking for how to clone the ready version of the complete framework, continue to the post [Git clone with Eclipse](../../prep/prepare-clone-eclipse/) post.**

# Introduction

Joint or shared (coding) projects benefit largely from a repository service that keeps track of versions and changes. Git, initially developed by Linus Torvalds for creating Linux OS, is today the most widely used distributed version control system. This post covers setting up an <span class='app'>Eclipse</span> PyDev project using a GitHub repository (or _repo_ for short). The PyDev project is just an empty container and will be used in the [next](../develop-submodules) post for linking PyDev packages, stored as individual repositories, as GitHub submodules.

If you are completely new to Git there are a plethora of introductions available. A  pedagogic youtube introduction is [Github Tutorial For Beginners](https://www.youtube.com/watch?v=0fKg7e37bQE), and if you prefer reading then [Learn Git with Bitbucket Cloud](https://www.atlassian.com/git/tutorials/what-is-git) is an alternative.

This post covers the following steps:

1. Open a GitHub account and sign in
2. Create empty repository in GitHub
3. Add a clone of a GitHub repo to <span class='app'>Eclipse</span>
4. Create a PyDev Project in <span class='app'>Eclipse</span> and team it up with the added GitHub repo

The youtube video [How To Add Eclipse Project To GitHub](https://www.youtube.com/watch?v=LPT7v69guVY&t=4s) covers much the same as this post regarding setting up GitHub and teaming up a GitHub repository with an <span class='app'>Eclipse</span>  project. Except that in this post you are going to setup a PyDev project whereas the video is for a Java project.

## Prerequisites

To follow the instructions in this post you need a [GitHub](https://github.com) account. If you need a hands-on introduction to GitHub, including setting up an account and creating a repository, the [official GitHub Guide Hello World](https://guides.github.com/activities/hello-world/) is a good place to start.

If you want to work towards a functional setup of the GeoImagine Framework you should aim for using Karttur´s [python packages uplodaded as separate repositories](https://karttur.github.io/geoimagine/packages/) as submodules. This is easily done by simply using the public python GeoImagine packages available on [Karttur's GitHub pages](https://github.com/karttur), but that is not due until the [next](../github-submodules) post. To create a fully functional GeoImagine Framework you must also have installed the Spatial Data Integrated Development Environment (SPIDE) as outlined in my blog [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/).

## Open GitHub account and sign in

If you do not have a GitHub account, you have to sign up at [github.com](https://github.com) and create an account. Note the user name and password as you need them later in order to setup both <span class='app'>GitHub Desktop</span> and the command line tool for GitHub on your local machine. Once you have an account on GitHub, sign in.

At this stage you can download and setup [<span class='app'>GitHub Desktop</span>](https://desktop.github.com/). Even if I usually prefer to use <span class='app'>Terminal</span> commands, I find <span class='app'>GitHub Desktop</span> very useful for handling GitHub repositories. The rest of these instructions will assume that you have it installed.

## Create and empty repository in GitHub

To store your project in <span class='app'>Eclipse</span> you need an empty repository to start with. Later you are going to use this repository as a container for linking together all the PyDev packages that, combined, constitute your project (for instance Karttur's GeoImagine Framework). For now it will just be an empty repository. In this tutorial I named the example repository _kt-gi-test01_.

Create a GitHub repository as described in the GitHub page [Create a repo](https://help.github.com/en/articles/create-a-repo). You can add a ReadMe file if you want to, or leave the repository completely empty. Aleterantively you can also create your repository from <span class='app'>GitHub Desktop</span>, and then commit and push it to your online GitHub account.

## Add GitHub repo to <span class='app'>Eclipse</span>

To add the GitHub repo as a project in GitHub requires many steps. I found the youtube video [How To Add Eclipse Project To GitHub](https://www.youtube.com/watch?v=LPT7v69guVY) instructive.

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

The view <span class='tab'>Git repositories</span> should open (if not use the <span class='textbox'>Quick access</span> textbox and type Git, then select <span class='menu'>View --> Git repositories</span>). In the <span class='tab'>Git repositories</span> view you should click the alternative _Clone a Git repository_ (if no text appears slide the cursor over the icons to get the correct alternative).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure3].file }}">
<figcaption> {{ site.data.images[page.figure3].caption }} </figcaption>
</figure>

In the dialogue window for <span class='tab'>Source Git Repository</span>, fill in the URI to the repository (you can copy the path from your GitHub.com account). At this stage you do not need to fill in any other information. If you want to store your GitHub user and password you can fill them in, but only if you also accept to <span class='checkbox'>Store in Secure Store</span>.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure4].file }}">
<figcaption> {{ site.data.images[page.figure4].caption }} </figcaption>
</figure>

Click the <span class='button'>Next ></span> button. This will take you to the <span class='tab'>Branch Selection</span> view, that should only contain a single branch, _master_. Make sure _master_ is selected and again click <span class='button'>Next ></span>.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure5].file }}">
<figcaption> {{ site.data.images[page.figure5].caption }} </figcaption>
</figure>

The next view is for <span class='tab'>Local Destination</span>. Either accept the default or navigate to and select your preferred destination path. To give the destination folder the same name as the online repository (_kt-gi-test01_ in the example) is recommended. Click <span class='button'>Next ></span> to continue.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure6].file }}">
<figcaption> {{ site.data.images[page.figure6].caption }} </figcaption>
</figure>

When ready, click <span class='button'>Finish</span> and the GitHub remote repository should be cloned to your local machine. If it worked properly you should see the cloned repository in the <span class='tab'>Git Repositories</span> view.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure7].file }}">
<figcaption> {{ site.data.images[page.figure7].caption }} </figcaption>
</figure>

### Create a new Eclipse project

You should now have a local clone of the remote GitHub repository with the local clone also added to <span class='app'>Eclipse</span>. The next step is to create a PyDev project in <span class='app'>Eclipse</span> and team it to the cloned GitHub repository.

To create a new project in <span class='app'>Eclipse</span>, either use the main menu:

<span class='menu'>File --> New --> Project --> PyDev --> PyDev project</span>,

or right click in <span class='tab'>Package Explorer</span> (navigation) window, and select the same sequence but starting with _New_. In either case you will end up with the <span class='window'>Select a wizard</span> window where _PyDev project_ should be an alternative. If you do not get the _PyDev project_ alternative it is most likely because you did not install <span class='app'>Eclipse</span> with PyDev support as outlined in the post on [Setup Eclipse for PyDev](https://karttur.github.io/setup-ide/setup-ide/install-eclipse/).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure8].file }}">
<figcaption> {{ site.data.images[page.figure8].caption }} </figcaption>
</figure>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure9].file }}">
<figcaption> {{ site.data.images[page.figure9].caption }} </figcaption>
</figure>

In the <span class='tab'>PyDev Project</span> window you only have to fill in the <span class='textbox'>Project name</span>. The example for this turorial is named _Karttur2019GitHub_. You can leave all other entries with the default values, setting a <span class='textbox'>Working set</span> is optional. Click <span class='button'>Finish</span> to create the PyDev project.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure10].file }}">
<figcaption> {{ site.data.images[page.figure10].caption }} </figcaption>
</figure>

### Link GitHub repository and Eclipse project

You should now have an added (cloned) GitHub repository as well as an empty PyDev project in <span class='app'>Eclipse</span>. It is time to link the the empty PyDev project to the cloned GitHub project (repository).

Select (click on) the newly created PyDev project in the <span class='tab'>Package Explorer</span> (navigation) window in <span class='app'>Eclipse</span>, then right click and in the pop-out menus that sequentially appears select:

<span class='menu'>Team --> Share Project...</span>

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure11].file }}">
<figcaption> {{ site.data.images[page.figure11].caption }} </figcaption>
</figure>

In the window <span class='tab'>Configure Git Repository</span> that opens, you should see a <span class='textbox'>Repository</span>. If not, make sure the checkbox <span class='checkbox'>Use or create repository in parent folder of project</span> is **un-checked**.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure12].file }}">
<figcaption> {{ site.data.images[page.figure12].caption }} </figcaption>
</figure>

In the textbox <span class='textbox'>Repository</span> select the repository that you just cloned. Also make sure that the target project is selected. click <span class='button'>Finish</span>.

In the <span class='app'>Eclipse</span> <span class='tab'>Package Explorer</span> (navigation) window, your PyDev project should now be indicated as linked (or piped ">") to the [repository branch] (e.g. [kt-gi-test01 master]).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure121].file }}">
<figcaption> {{ site.data.images[page.figure121].caption }} </figcaption>
</figure>

### Create the hierarchical package structure

The PyDev project that you created above (e.g. _Karttur2019GitHub_) is stored under the local destination that you gave when cloning the GitHub repository. Either use the recommended text editor [<span class='app'>Atom</span>](https://karttur.github.io/setup-blog/2017/12/21/setup-blog-tools.html#install-atom) (or another text editor that shows hidden files), or the <span class='app'>Terminal</span> to check the content. If using the <span class='app'>Terminal</span> first change directory (<span class='terminal'>cd</span>) to the project folder (i.e. the local clone) and then list all <span class='terminal'>ls -a</span> the content of the project directory:

<span class='terminal'>$ cd path/to/GitHubClone/PyDevProj</span>

For the example on my machine that becomes:

<span class='terminal'>$ cd /Users/thomasgumbricht/GitHub/kt-gi-test01/Karttur2019GitHub</span>,

where <span class='terminal'>kt-gi-test01</span> is the local clone of the GitHub repository and <span class='terminal'>Karttur2019GitHub</span> the <span class='app'>Eclipse</span> PyDev project.

To list all (<span class='terminal'>-a</span>) files (even hidden), type:

<span class='terminal'>$ ls -a</span>

The returned list should contain two hidden files <span class='file'>.project</span> and <span class='file'>.pydevproject</span>. These two files define your <span class='app'>Eclipse</span> project.

### Push the local changes to the online GitHub repository

The video by Raghav Pal on [How To Add Eclipse Project To GitHub](https://www.youtube.com/watch?v=LPT7v69guVY) shows the steps below in more detail.

When you teamed up the PyDev project with the local clone of the GitHub repository, you also disentangled the content between the online (github.com) repository and the local clone. As your local clone is managed by <span class='app'>Eclipse</span> you can transfer the local changes to the online repository by first committing to the staged changes and then push them (in the Git jargon).

Again, right-click your PyDev project in the <span class='tab'>Package Explorer</span> (navigation) window. The pop-out menu under Team has now changed, and reflects that this is piped (">") project under a cloned GitHub repository.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure13].file }}">
<figcaption> {{ site.data.images[page.figure13].caption }} </figcaption>
</figure>

The top alternative in the pop-out sub-menu Team now says Commit. Click it and the bottom view of your project window should change to the <span class='tab'>Git staging</span> view.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure14].file }}">
<figcaption> {{ site.data.images[page.figure14].caption }} </figcaption>
</figure>

In the box with <span class='textbox'>Unstaged Changes</span> you should see the flies an folders you added. Drag them to the box below labelled <span class='textbox'>Staged Changes</span> and add a comment in the textbox <span class='textbox'>Commit Message</span>. The standard message at this point is "Initial commit", but you can write a more informative message if you want. Then either click the button <span class='button'>Commit and Push...</span> or <span class='button'>Commit</span> followed by <span class='button'>Push...</span>. In both cases you have to give your GitHub user and password, unless you set them above.

If you now return to your web-browser and your online repository, you should see that at the top level it contains a new folder <span class='file'>Karttur2019GitHub</span> and inside that folder should be the the two system files defining your PyDev project. If you do not see any changes in your online GitHub repository, refresh the view of the repository by reloading the page in your web-browser.

In the [next](../github-submodules/) post you will add python packages (to the PyDev project) as submodules (in the Git repository).
