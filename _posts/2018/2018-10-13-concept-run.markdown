---
layout: post
title: Running processes
categories: concept
excerpt: "How to run processes in Karttur´s GeoImagine Framework"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-13 T18:17:25.000Z'
modified: '2018-10-13 T18:17:25.000Z'
comments: true
share: true
---

# Introduction

This post explains how to run processes in Karttur's GeoImagine Framework.

# Prerequisites

To follow this post you must have the complete Spatial Data Integrated Development Environment (SPIDE) installed, including <span class='app'>Eclipse</span> set up for PyDev, <span class='app'>Anaconda</span> and <span class='app'>PostgreSQL</span>. How to do that is described in a separate blog: [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You need to install and setup all the parts in that blog, preferably using [Python3 and Anaconda3](https://karttur.github.io/setup-ide/blog/python3-upgrade/). The rest of this post assumes that you have accomplished the installation of the SPIDE.

# Processes

Everything that the Framework can do is embedded in processes, including processing spatial and non-spatial data and even defining new processes.

Processes can be run from any module (<span class='file'>.py</span> file) and how to do that is explained further down in this post. The original GeoImagine PyDev project, however, contains four different python packages that run the system:

- kartturmain
- projects
- setup_db
- setup_processes

The package <span class='package'>kartturmain</span> contains the modules that translate xml code to process objects that are then used for executing the requested processes. The packages <span class='package'>setup_db</span> and <span class='package'>setup_processes</span> include hardcoded links to predefined xml files that respectively installs the Framework database and the Framework processes. And under the package  <span class='package'>projects</span> there are several modules for running processes related to different datasets and regions.

## Running processes from Eclipse

To run any process in the Framework you need to give the path to either a text file listing xml files, or the path to a single xml file. When a process is executed the function *ReadXMLProcesses* reads the xml coded commands and creates the process object, that is then sent to the function *RunProcesses* that identifies and executes the process.

```
from geoimagine.kartturmain.readXMLprocesses import ReadXMLProcesses, RunProcesses

if __name__ == "__main__":

    verbose = True

    projFN = '/path/to/projectfile/single_xml_file.xml'

    #or

    projFN = '/path/to/projectfile/list_of_xml_files.txt'

    procLL = ReadXMLProcesses(projFN,verbose)

    RunProcesses(procLL,verbose)
```

The code snippet above can be saved as a PyDev module (<span class='file'>.py</span> file) on its own. You can thus build up complete projects as python modules, and in principle store them anywhere in your PyDev project. The Framework contains several predefined modules for specific processing under the package <span class='package'>projects</span>.

### Run single xml file

If your project file is a single <span class='file'>.xml</span> file, the Framework will run all the included \<process\> tags.

```
<?xml version='1.0' encoding='utf-8'?>
<samplexml>
	#In a single xml file you are restricted to run only one project and one region
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur-trmm' siteid = '*' plotid = '*' system = 'ancillary'></userproj>
	#In a single xml file you are restricted to run only one time period
	<period startyear = "1998" startmonth='01' endyear = "2017" endmonth='12' timestep='M'></period>

	<process processid = 'processX'>
		<parameters param1='value1' param2='value2'></parameters>
		<srcpath volume = "srcvolume" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "dstvolume" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<band  source = "source" product = "product" folder = "folder" band = "band" prefix = "prefix" suffix = "suffix">
			</band>
		</srccomp>
		<dstcomp>
			<band  source = "source" product = "product" folder = "folder" band = "band" prefix = "prefix" suffix = "suffix">
			</band>
		</dstcomp>
	</process>

	<process processid = 'processY'>
		<parameters param1='value1' param2='value2'></parameters>
		<srcpath volume = "srcvolume" hdrfiletype = 'tif' datfiletype = 'tif'></srcpath>
		<dstpath volume = "dstvolume" hdrfiletype = 'tif' datfiletype = 'tif'></dstpath>
		<srccomp>
			<band  source = "source" product = "product" folder = "folder" band = "band" prefix = "prefix" suffix = "suffix">
			</band>
		</srccomp>
	</process>

</samplexml>
```

When running a single xml file you are restricted to a single location and a single time period with a temporal resolution. If your project includes for instance temporal resampling or extraction of data from a larger to a smaller region, you need to divide your project into several xml files.

### Run list of xml file

If your project file is a text (<span class='file'>.txt</span>) file, the Framework expects a simple ASCII (readable text) file with links to Framework crafted xml files (empty lines and lines starting with # are ignored). As each xml file is treated separately, you can run different projects, regions and time periods in each of the separate xml files.

```
# file: list_of_xml_files.txt
# You can list any number of xml file that will be
# executed in order of appearance

# XML for importing data
import_data.xml

# XML for processing dataset
process_data.xml

# XML for exporting data
export_data.xml
```

### Examples

The blog posts on processing of different data sources (e.g. [GRACE](../../blog/blog-GRACE/), [SMAP](../../blog/blog-SMAP), [FAO refevap](../../blog/blog-FAO-refevap), [TRMM](../../blog/blog-TRMM) etc.) contain complete examples for how to run both single and chained processes. But before you can actually run any processes you need to setup the Framework [database connections](../setup-dblink/), [define and setup the database](../setup-db/), and [setup the processes](../setup-processes/).
