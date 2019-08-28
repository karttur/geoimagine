---
layout: post
title: Transfer data to Karttur's GeoImagine Framework
modified: '2018-10-20 T18:17:25.000Z'
categories: setup
excerpt: "Transfer data to Karttur's GeoImagine Framework"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-20 T18:17:25.000Z'
comments: true
share: true
---

# Introduction

Most processes in Karttur's GeoImagine Framework require that you have some identified source data on which to operate. Data dependent processes loop over data representing different locations in time and space (e.g. Landsat satellite images from different places and times). All the processing is then built up sequentially using the output data from the previous process as input data in the next. For example, the output from the Landsat import process can be used for constructing a vegetation index (VI), time series of VI are then used for analysing the seasonal pattern of growth, that in turn is used for studying the trend in the onset of the growing season:

Landsat image --> reflectance bands --> vegetation index --> annual growth cycle --> growing season onset --> multiyear trend in growing season onset.

If you want to transfer data to another computer or platform, or send it to someone else who also operates the Framework, it is usually not necessary to send all the data. It is enough to send the data from the stage where you want to restart the analysis. In the case above, the vegetation index should suffice for repeating the study. The two first inputs (the Landsat image itself and the reflectance bands) could thus be omitted. In order for the Framework to understand the VI data, you must loop over the transferred data (i.e. the VI in our example) and register it in the database. First after you have done that can the VI data be used as a source composition for further processing.

There is another alternative for transferring data, namely to dump the database, and then restructure/fill the new database from the dump. The process for dumping/importing the whole, or parts of, the database is described in [this](#) post. Note, however, that it is more secure to use the process [<span class='package'>updateb</span>](../../subprocess/subproc-updatedb/) as your database will then corresponds precisely with the data you have access to.

## Prerequisites

You must have setup the Karttur's GeoImagine Framework as described in the previous posts. You must also have a dataset produced by the Framework itself, that is to say, that follows the strict hierarchical folder and naming convention of the Framework as outlined in [this](../setup-xml/) post.

# Transferring data layers

Transferring data layers between different machines with Karttur's GeoImagine Framework installed is done in 3 steps:

 - Export or copy data from an existing storage
 - Define the data layers to import in an xml file
 - Run the <span class='package'>Updatedb</span> process on the destination machine

## Export / copy data

The first step when transferring data is to create a copy of the data layers you want to transfer. If you are setting up a new machine, but use the same physical storage device where you first created the data, you just skip the export/copy stage.

For copying you can use any file manager that you like, or your system file explorer. The export process of the Framework is not included in the public version at time of writing.

## Define data layers

All layers that you want to import to the Framework must be defined in an xml file. The xml file must define the temporal coverage (in the \<period\> tag), the path (in the \<dstpath\> tag) and the composition (in the \<dstcomp\> tag). For details the see the post on [Processes, compositions and XML structure](../setup-xml/). Apart form the standard composition attributes (_source_, _product_, _folder_, _band_, _prefix_ and _suffix_), also the data format and scaling must be given, including:

- celltype ("raster", "vector", "topo" or "specimen")
- scalefac (default: 1.0)
- offsetadd (dfault: 0.0)
- dataunit (must be given)
- measure ("N" [nominal], "O" [ordinal], "S" [scale], or "R" [ratio])

The example below shows how to define SMAP daily values for import to the database (with scalefac = 1 and offsetadd = 0, they have the default values and need not be stated explicitly):

```
<?xml version='1.0' encoding='utf-8'?>
<updatedb>
	<userproj userid = 'karttur' projectid = 'karttur' tractid= 'karttur' siteid = '*' plotid = '*' system = 'smap'></userproj>
	<period startyear = '2015' startmonth = '04' startday = '13' endyear = '2018' endmonth = '10' endday = '31' timestep='D'></period>

	<process processid ='updatedbSmap' dsversion = '1.3'>
		<parameters></parameters>
		<dstpath volume = "karttur3tb" hdrfiletype='tif'></dstpath>
		<dstcomp>
			<soil-moisture-am source = "SPL3SMP.005" product = "SPL3SMP" folder = "soil-moisture-am" band = "soil-moisture-am" prefix = "soil-moisture-am" suffix = "005"
			celltype = "raster" dataunit ='cm**3/cm**3' measure='R' >
			</soil-moisture-am>
			<soil-moisture-pm source = "SPL3SMP.005" product = "SPL3SMP" folder = "soil-moisture-pm" band = "soil-moisture-pm" prefix = "soil-moisture-pm" suffix = "005"
			celltype = "raster" scalefac ='1' offsetadd='0' dataunit ='cm**3/cm**3' measure='R' cellnull='0'>
			</soil-moisture-pm>
		</dstcomp>
	</process>
</updatedb>
```

## Updatedb

With the data storage device attached and the data defined and identified in an xml file as shown above, [<span class='package'>updateb</span>](../../subprocess/subproc-updatedb/) will loop over all the layers indicated. If the layer is found on the indicated path, it is inserted in the Framework database.

## Examples

Other posts in this blog include examples on how to transfer data using [<span class='package'>updateb</span>](../../subprocess/subproc-updatedb/), including for:

- [TRMM](../blog-TRMM-transfer/)
- [FAO reference evapotranspiration](../blog-FAOrefet-transfer/)
- [Vertical Water Balance](../blog-VWB-transfer/)
