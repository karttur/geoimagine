---
layout: post
title: Import Project to Eclipse
modified: '2018-10-10 T18:17:25.000Z'
categories: putinplace
excerpt: "Import Karttur's entire GeoImagine Framework as a PyDev project to Eclipse"
tags:
  - Clone Karttur's GeoImagine Framework
  - Setup Karttur's GeoImagine Framework
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-10
 T18:17:25.000Z'
comments: true
share: true
figure1: eclipse_select_import
figure2: eclipse_import_project_from_file_system_or_archive
---

# Introduction

A local clone or copy of a PyDev project can be imported to <span class='app'>Eclipse</span> either as a complete project, or by building a backbone PyDev project and copying and pasting selected parts. This post describes how to import a local clone of Karttur's GeoImagine Framework as a complete project to <span class='app'>Eclipse</span>. If you instead want to build a customized Framework with only selected packages you should follow the instructions in the post [Copy and paste Karttur's GeoImagine Framework](../putinplace-copy-project-eclipse/).

The alternative is to clone the Framework directly from the repo on Karttur's GitHub pages as described in the post on [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git/).

# Prerequisites

To follow this post you must have cloned Karttur's GeoImagine Framework to your local machine. Described in the post on [Git clone with GitHub Desktop and terminal](../putinplace-clone-desktop-git).

## Project configuration

An Eclipse PyDev project is defined by two files:

- <span class='file'>.project</span>
- <span class='file'>.pydevproject</span>

These are hidden files that must exist directly under the root folder of the PyDev project. To actually see and access the files, you can either use [<span class='app'>Atom</span>](https://karttur.github.io/setup-blog/2017/12/21/setup-blog-tools.html#install-atom) or the <span class='app'>Terminal</span> and <span class='terminalapp'>pico</span>. Here I only cover how to use the <span class='app'>Terminal</span>.

In an open <span class='app'>Terminal</span> window, change directory (<span class='terminal'>cd</span>) to the location of the cloned project:

<span class='terminal'>$ cd /path/to/cloned/project/rootfolder</span>

Then list all <span class='terminal'>ls -a</span> files in the that root folder:

<span class='terminal'>$ ls -a</span>

The <span class='terminal'>ls -a</span> command also lists hidden files, and you should see both <span class='terminal'>.project</span> and <span class='terminal'>.pydevproject</span> in the returned list.

You can open the hidden files and read them with <span class ='terminalapp'>pico</span>:

<span class='terminal'>$ pico .project</span>

```
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
        <name>KartturGeoImagine</name>
        <comment></comment>
        <projects>
        </projects>
        <buildSpec>
                <buildCommand>
                        <name>org.python.pydev.PyDevBuilder</name>
                        <arguments>
                        </arguments>
                </buildCommand>
        </buildSpec>
        <natures>
                <nature>org.python.pydev.pythonNature</nature>
        </natures>
</projectDescription>
```

<span class='terminal'>$ pico .pydevproject</span>

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?eclipse-pydev version="1.0"?><pydev_project>
<pydev_pathproperty name="org.python.pydev.PROJECT_SOURCE_PATH">
<path>/${PROJECT_DIR_NAME}</path>
</pydev_pathproperty>
<pydev_property name="org.python.pydev.PYTHON_PROJECT_VERSION">python interpret$
<pydev_property name="org.python.pydev.PYTHON_PROJECT_INTERPRETER">Default</pyd$
</pydev_project>
```

Once you have confirmed that the two project files exists, and that the \<name\> tag in <span class='file'>.project</span> corresponds to the name of the root folder of the project, you can import Karttur's GeoImagine Framework to Eclipse.

## Import project

Start <span class='app'>Eclipse</span>. To import an existing project you need to bring up the import dialog. As usual with <span class='app'>Eclipse</span> there are several ways to bring up this dialog:

- <span class='menu'>File : Import</span>, or
- right click in the <span class='tab'>Pydev Package Explorer Window</span>

The <span class='tab'>Import</span> dialog window opens. Select _General_ --> _Existing Projects into Workspace_ and then click <span class='button'>Next</span>.

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure1].file }}">
<figcaption> {{ site.data.images[page.figure1].caption }} </figcaption>
</figure>

A new dialog window <span class='tab'>Import Projects From File System or Archive</span> opens. Navigate to the root directory for the project that you want to import (the one with the two hidden project files).

<figure>
<img src="{{ site.commonurl }}/images/{{ site.data.images[page.figure2].file }}">
<figcaption> {{ site.data.images[page.figure2].caption }} </figcaption>
</figure>

If this is a project root folder, a check box will appear with the project folder ticked. If not you have either located the wrong folder, or the root folder lacks the two hidden project files. Unless you already cloned the project into your Eclipse workspace (or want to keep it at some other locations) click the checkbox <span class='textbox'>Copy project into workspace</span>.

Click <span class='button'>Finish</span> to import a complete version of Karttur´s GeoImagine Framework.

# Resources

[Eclipse / Pydev features: Import existing project](https://sites.google.com/site/bcgeopython/examples/eclipse-pydev/eclipse-pydev-features-import-existing-project)
