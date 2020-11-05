# Watershed accumulation and basin area
r.watershed -as elevation=DEM@PERMANENT accumulation=SFD_upstream basin=SFD_basin threshold=2000 --overwrite

r.watershed -a elevation=DEM@PERMANENT accumulation=MFD_upstream basin=MFD_basin threshold=2000 --overwrite

# Identify terminal water body
r.mapcalc "drain_terminal = if(isnull('DEM@PERMANENT'), 1, null())"

# Get shoreline
r.buffer input=drain_terminal output=shoreline distances=330 units=meters --overwrite

# Extract accumulated drainage for shoreline

r.mapcalc "coastline_SFD_flowacc = if((shoreline > 1), SFD_upstream, null())"
r.mapcalc "coastline_MFD_flowacc = if((shoreline > 1), MFD_upstream, null())"

# Threshold minimum drainage area

# Create reclass parameterization file
### 2000 thru 99999999 = 1 ###
### * = NULL ###

r.reclass input=coastline_SFD_flowacc output=basin_SFD_outlets rules='/Volumes/GRASS2020/GRASSsupport/reclass/reclass_flow_acc_2000.txt' --overwrite

r.reclass input=coastline_MFD_flowacc output=basin_MFD_outlets rules='/Volumes/GRASS2020/GRASSsupport/reclass/reclass_flow_acc_2000.txt' --overwrite

# Vectorize basin outlet candidates

r.to.vect input=basin_SFD_outlets output=basin_SFD_outlet_pt type=point

r.to.vect input=basin_MFD_outlets output=basin_MFD_outlet_pt type=point

# Add tables to vector databases

v.db.addcolumn map=basin_SFD_outlet_pt columns='upstream DOUBLE PRECISION'

v.db.addcolumn map=basin_SFD_outlet_pt columns='basin INT'

# or with multiple columns added in one command

v.db.addcolumn map=basin_MFD_outlet_pt columns='upstream DOUBLE PRECISION, basin INT'

# Add basin data to vector databases

v.what.rast map=basin_SFD_outlet_pt raster=SFD_upstream column=upstream

v.what.rast map=basin_SFD_outlet_pt raster=SFD_basin column=basin

v.what.rast map=basin_MFD_outlet_pt raster=MFD_upstream column=upstream

v.what.rast map=basin_MFD_outlet_pt raster=MFD_basin column=basin

# Export basin outlet candidates

mkdir -p /Volumes/GRASS2020/GRASSproject/global_drainage_basins/region/amazonia/data

v.out.ogr type=point input=basin_SFD_outlet_pt format=ESRI_Shapefile output=/Volumes/GRASS2020/GRASSproject/global_drainage_basins/region/amazonia/data/basin-SFD-outlet-pt_SRTM_hydro-amazonia_0_cgiar-250.shp --overwrite

v.out.ogr type=point input=basin_MFD_outlet_pt format=ESRI_Shapefile output=/Volumes/GRASS2020/GRASSproject/global_drainage_basins/region/amazonia/data/basin-MFD-outlet-pt_SRTM_hydro-amazonia_0_cgiar-250.shp --overwrite
