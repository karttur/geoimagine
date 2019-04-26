---
layout: post
title: Database connections
modified: '2018-10-15 T18:17:25.000Z'
categories: blog
excerpt: "Setup database connections for Karttur's GeoImagine Framework"
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2018-10-15 T18:17:25.000Z'
comments: true
share: true
---
<script src="https://karttur.github.io/common/assets/js/karttur/togglediv.js"></script>

# Introduction

This post goes through the steps needed for creating a (fairly) secure link between users, processes and the postgres database of Karttur´s GeoImagine Framework.

# Prerequisites

To follow this post you must have the complete Spatial Data Integrated Development Environment (SPIDE) installed as described in the post [Install and setup spatial data IDE](https://karttur.github.io/setup-ide/). You must also have setup Karttur's GeoImagine Framework, either by [importing](../blog-import-project-eclipse/) or by [copying (drag and drop)](../blog-copy-project-eclipse/).

# Connect Python and PostgreSQL

Karttur´s GeoImagine Framework relies on a postgres database that holds information on all processes parameters as well as all data. The installation of the postgres database should already have been done as described in the blogpost [Install postgreSQL and postGIS](https://karttur.github.io/setup-ide/setup-ide/install-postgres/). Then you must also have installed and setup <span class='package'>psycopg</span> for connecting Python to postgres, plus created a security solution for the connection as desribed in the post [Connect Python and PostgreSQL using psycopg2](https://karttur.github.io/setup-ide/setup-ide/connect-with-psycopg2/).

## Principal solution

At this point you need to set the login and password of the users that will access different parts of the postgres database. In principal each schema of the database is managed by a different role (user), but with some exception and some crossover capacity granted to different roles.

At present the Framework contains the following roles (apart from the superusers):

- usermanager
- managelayout
- manageregion
- formatread
- regionread
- manageancillary
- managesentinel
- managesoilmoisture
- managelandsat
- managesmap

The actual running of the process and setting up of the roles is covered in the [next](../blog-setup-db/) post. This post only describes how to define the roles in the xml file and the <span class='file'>.netrc</span> file used for storing the passwords associated with each role.

### Defining roles

The xml file that defines the database roles is included in the [<span class='package'>setup_db</span>](../../package/package-setup_db/) package under the path [<span class='file'>doc/xmlsql/general_grant_v80_sql.xml</span>](../../../geoimagine-setup-db/doc/xmlsql/). You need to edit this file and set your own passwords for each role. If you want to change the principal system solution with one role for each schema, say to a single role dealing with everything, you can do that by giving all the rights to the same role. And then also give this role as the "HOST" in each of the modules under in the package [<span class='package'>postgresdb</span>](../../package/package-postgresdb/).

Note that the process <span class='package'>grant</span> is not definied in the databasem, but a stand alone process and can only be run from the package [<span class='package'>setup_db</span>](../../package/package-setup_db/).

<button id= "toggleTGrant" onclick="hiddencode('grant')">Hide/Show grant.xml</button>

<div id="grant" style="display:none">

{% capture text-capture %}
{% raw %}

```
<?xml version='1.0' encoding='utf-8'?>
<sql>
	<!-- SQL xml read by geomimagine subpackage db_setup -->

	<!-- GRANTS rights to various db users -->

	<process processid ='grant'>
		<parameters db = 'karttur' user='processread' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA process TO processread;
			GRANT SELECT ON ALL TABLES IN SCHEMA process TO processread;
			GRANT USAGE ON SCHEMA regions TO processread;
			GRANT SELECT ON regions.tracts, system.defregions TO processread;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='processmanage' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA process TO processmanage;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA process TO processmanage;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='userread' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA userlocale TO userread;
			GRANT SELECT ON ALL TABLES IN SCHEMA userlocale TO userread;
			GRANT USAGE ON SCHEMA regions TO userread;
			GRANT SELECT ON regions.tracts, regions.sites TO userread;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='managelayout' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA layout TO managelayout;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA layout TO ManageLayout;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='managemodis' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA modis TO managemodis;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA modis TO managemodis;
			GRANT USAGE ON SCHEMA regions TO managemodis;
			GRANT SELECT ON ALL TABLES IN SCHEMA regions TO managemodis;
			GRANT USAGE ON SCHEMA system TO managemodis;
			GRANT SELECT ON ALL TABLES IN SCHEMA system TO managemodis;
			GRANT USAGE ON SCHEMA regions TO managemodis;
			GRANT SELECT ON ALL TABLES IN SCHEMA regions TO managemodis;
			GRANT USAGE ON SCHEMA ancillary TO managemodis;
			GRANT SELECT ON ALL TABLES IN SCHEMA ancillary TO managemodis;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='manageregion' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA regions TO manageregion;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA REGIONS TO manageregion;
			GRANT USAGE ON SCHEMA system TO manageregion;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SYSTEM TO manageregion;
			GRANT USAGE ON SCHEMA ancillary TO manageregion;
			GRANT SELECT ON ALL TABLES IN SCHEMA ancillary TO manageregion;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='formatread' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA process TO formatread;
			GRANT SELECT ON process.celltypes, process.gdalformat TO formatread;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='regionread' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA regions TO regionread;
			GRANT SELECT ON ALL TABLES IN SCHEMA regions TO regionread;
			GRANT SELECT ON ALL TABLES IN SCHEMA system TO regionread;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='manageancillary' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA system TO manageancillary;
			GRANT SELECT ON ALL TABLES IN SCHEMA SYSTEM TO manageancillary;
			GRANT USAGE ON SCHEMA ancillary TO manageancillary;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ancillary TO manageancillary;
			GRANT USAGE ON SCHEMA climateindex TO manageancillary;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA climateindex TO manageancillary;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='managesoilmoisture' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA soilmoisture TO managesoilmoisture;
			GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA soilmoisture TO managesoilmoisture;
			GRANT USAGE ON SCHEMA climateindex TO manageancillary;
			GRANT SELECT ON ALL TABLES IN SCHEMA climateindex TO managesoilmoisture;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='managesentinel' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA sentinel TO managesentinel;
			GRANT SELECT, INSERT, UPDATE, DELETE  ON ALL TABLES IN SCHEMA sentinel TO managesentinel;
			GRANT USAGE ON SCHEMA regions TO managesentinel;
			GRANT SELECT ON ALL TABLES IN SCHEMA regions TO managesentinel;
			GRANT USAGE ON SCHEMA system TO managesentinel;
			GRANT SELECT ON ALL TABLES IN SCHEMA system TO managesentinel;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='managelandsat' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA landsat TO managelandsat;
			GRANT SELECT, INSERT, UPDATE, DELETE  ON ALL TABLES IN SCHEMA landsat TO managelandsat;
			GRANT USAGE ON SCHEMA regions TO managelandsat;
			GRANT SELECT ON ALL TABLES IN SCHEMA regions TO managelandsat;
			GRANT USAGE ON SCHEMA system TO managelandsat;
			GRANT SELECT ON ALL TABLES IN SCHEMA system TO managelandsat;
			GRANT USAGE ON SCHEMA ancillary TO managelandsat;
			GRANT SELECT ON ALL TABLES IN SCHEMA ancillary TO managelandsat;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='managesmap' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA smap TO managesmap;
			GRANT SELECT, INSERT, UPDATE, DELETE  ON ALL TABLES IN SCHEMA smap TO managesmap;
			GRANT USAGE ON SCHEMA regions TO managesmap;
			GRANT SELECT ON ALL TABLES IN SCHEMA regions TO managesmap;
			GRANT USAGE ON SCHEMA system TO managesmap;
			GRANT SELECT ON ALL TABLES IN SCHEMA system TO managesmap;
			GRANT USAGE ON SCHEMA ancillary TO managesmap;
			GRANT SELECT ON ALL TABLES IN SCHEMA ancillary TO managesmap;
		</command>
	</process>

	<process processid ='grant'>
		<parameters db = 'karttur' user='manageexport' pswd='abc'></parameters>
		<overwrite>N</overwrite>
		<delete>N</delete>
		<command>
			GRANT USAGE ON SCHEMA system TO manageexport;
			GRANT SELECT ON ALL TABLES IN SCHEMA system TO manageexport;
			GRANT USAGE ON SCHEMA ancillary TO manageexport;
			GRANT SELECT ON ALL TABLES IN SCHEMA ancillary TO manageexport;
			GRANT USAGE ON SCHEMA smap TO manageexport;
			GRANT SELECT  ON ALL TABLES IN SCHEMA smap TO manageexport;
			GRANT USAGE ON SCHEMA landsat TO manageexport;
			GRANT SELECT  ON ALL TABLES IN SCHEMA modis TO manageexport;
			GRANT USAGE ON SCHEMA modis TO manageexport;
			GRANT SELECT  ON ALL TABLES IN SCHEMA modis TO manageexport;
			GRANT USAGE ON SCHEMA regions TO manageexport;
			GRANT SELECT  ON ALL TABLES IN SCHEMA regions TO manageexport;
			GRANT USAGE ON SCHEMA layout TO manageexport;
			GRANT SELECT  ON ALL TABLES IN SCHEMA layout TO manageexport;
		</command>
	</process>
</sql>

```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html toggle-text=text-capture  %}
</div>

### Login and password (.netrc)

Karttur's GeoImagine Framework standard solution for database access at runtime is to read the credentials from a <span class='file'>.netrc</span> file. You have to create your own <span class='file'>.netrc</span> file that gives the same roles and passwords as you gave in the xml file above. The <span class='file'>.netrc</span> file should be in your home folder and you can edit it by using <span class='terminalapp'>pico</span>.

<span class='terminal'>$ pico .netrc</span>

<button id= "togglenetrc" onclick="hiddencode('netrc')">Hide/Show .netrc</button>

<div id="netrc" style="display:none">

{% capture text-capture %}
{% raw %}

```
machine localhost0 login superuser password abc
machine localhost1 login produser  password abc
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
machine manageexport login manageexport password abc
machine ManageUserProj login manageuserproj password abc
```
{% endraw %}
{% endcapture %}
{% include widgets/toggle-code.html toggle-text=text-capture  %}
</div>

## Before the next steps

You should now have corresponding roles, passwords and rights for operating the Framework database. In summary:

1. Roles, passwords and their granted rights are defined in an xml file.
2. Different roles are used for accessing and editing different schemas in the database. The linking of processes and database roles is hardcoded, and to change that you need to edit the modules in the <span class='package'>postgresdb</span> package.
3. At runtime the name and password of each role is accessed from a <span class='file'>.netrc</span> file that must have access codes, role names and role passwords that corresponds to the definitions in the xml file and the modules of the <span class='package'>postgresdb</span> package.

If you decided to keep the default roles, role names, passwords and codes, all the parts should correspond. If you changed the name, passwords and grants, the Framework will report errors and you can update any mistakes when you account them.
