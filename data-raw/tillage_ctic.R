library(httr)
library(foreign)
library(rio)

base_url <- "https://water.usgs.gov/GIS/dsdl/ds573_tillage_lu01.zip"
zip_file <- file.path(DataPackageR::project_path(), "data-raw", basename(base_url))
dbf_file <- file.path(DataPackageR::project_path(), "data-raw", basename(base_url))

if(!file.exists(zip_file)){
  httr::GET(base_url, write_disk(basename(base_url), overwrite=TRUE))
}

unzip(zip_file, exdir = "data-raw")

tillage_ctic <- rio::import(dbf_file)