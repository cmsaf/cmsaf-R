#'Determine multi-year seasonal means.
#'
#'The function determines multi-year seasonal mean values from data of a single
#'CM SAF NetCDF input file. The seasonal mean is only determined if all three
#'months of a season are available. For (north-) winter this are January.
#'February and the December of the previous year (DJF). The other seasons are
#'MAM, JJA, and SON.
#'
#'@param var Name of NetCDF variable (character).
#'@param infile Filename of input NetCDF file. This may include the directory
#'  (character).
#'@param outfile Filename of output NetCDF file. This may include the directory
#'  (character).
#'@param nc34 NetCDF version of output file. If \code{nc34 = 4} the output file will be
#'  in NetCDFv4 format (numeric). Default output is NetCDFv3.
#'@param overwrite logical; should existing output file be overwritten?
#'@param verbose logical; if TRUE, progress messages are shown
#'
#'@return A NetCDF file including a time series of multi-year seasonal means is
#'  written.
#'@export
#'
#'@family seasonal statistics
#'
#' @examples
#'## Create an example NetCDF file with a similar structure as used by CM
#'## SAF. The file is created with the ncdf4 package.  Alternatively
#'## example data can be freely downloaded here: <https://wui.cmsaf.eu/>
#'
#'library(ncdf4)
#'
#'## create some (non-realistic) example data
#'
#'lon <- seq(5, 15, 0.5)
#'lat <- seq(45, 55, 0.5)
#'time <- seq(as.Date("2000-01-01"), as.Date("2010-12-31"), "month")
#'origin <- as.Date("1983-01-01 00:00:00")
#'time <- as.numeric(difftime(time, origin, units = "hour"))
#'data <- array(250:350, dim = c(21, 21, 132))
#'
#'## create example NetCDF
#'
#'x <- ncdim_def(name = "lon", units = "degrees_east", vals = lon)
#'y <- ncdim_def(name = "lat", units = "degrees_north", vals = lat)
#'t <- ncdim_def(name = "time", units = "hours since 1983-01-01 00:00:00",
#'  vals = time, unlim = TRUE)
#'var1 <- ncvar_def("SIS", "W m-2", list(x, y, t), -1, prec = "short")
#'vars <- list(var1)
#'ncnew <- nc_create("CMSAF_example_file.nc", vars)
#'ncvar_put(ncnew, var1, data)
#'ncatt_put(ncnew, "lon", "standard_name", "longitude", prec = "text")
#'ncatt_put(ncnew, "lat", "standard_name", "latitude", prec = "text")
#'nc_close(ncnew)
#'
#'## Determine the multi-year seasonal means of the example CM SAF NetCDF
#'## file and write the output to a new file.
#'yseasmean("SIS", "CMSAF_example_file.nc", "CMSAF_example_file_yseasmean.nc")
#'
#'unlink(c("CMSAF_example_file.nc", "CMSAF_example_file_yseasmean.nc"))
yseasmean <- function(var, infile, outfile, nc34 = 3, overwrite = FALSE, verbose = FALSE) {
  yseasx_wrapper(3, var, infile, outfile, nc34, overwrite, verbose)
}
