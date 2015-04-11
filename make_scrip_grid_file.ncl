; This script generates a scrip grid file from a cism input file.

; This is currently an approximation, which can be used for testing, but should
; not be used for science. This is because we let ncl determine the corners,
; rather than determining them ourselves.

; Need to set the following arguments on the command line:
;
; - infile_name: path to input file
; - outfile_name: path to output file

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/esmf/ESMF_regridding.ncl"

infile = addfile(infile_name, "r")
lat = infile->lat
lon = infile->lon
delete(infile)

; remove degenerate time dimension from lat & lon
lat_2d = rm_single_dims(lat)
lon_2d = rm_single_dims(lon)

curvilinear_to_SCRIP(outfile_name, lat_2d, lon_2d, False)