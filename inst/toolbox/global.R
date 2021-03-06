# Use home directory for storing config file (e.g. C:\Users\<user>\Documents
# on Windows or /home/<user> on Linux)
config_directory <- file.path(path.expand("~"), "CMSAF-Toolbox")
config_filepath <- file.path(config_directory, "config.conf")
grid_filepath <- file.path(config_directory, "myGrid.txt")

# Is a local or remote session?
isRunningLocally <- Sys.getenv('SHINY_PORT') == ""
# Test Remote
# isRunningLocally <- FALSE

operatorGroups <- c("Mathematical operators",
                    "Daily statistics",
                    "Monthly statistics",
                    "Seasonal statistics",
                    "Annual statistics",
                    "Temporal operators",
                    "Spatial operators",
                    "Selection",
                    "Data manipulation")

operators <- c()

operators[["Mathematical operators"]] <- c("Add constant to data" = "cmsaf.addc",
                                           "Divide data by constant" = "cmsaf.divc",
                                           "Multiply data with constant" = "cmsaf.mulc",
                                           "Subtract constant from data" = "cmsaf.subc",
                                           "Divide by days per month" = "divdpm",
                                           "Multiply by days per month" = "muldpm")

operators[["Daily statistics"]] <- c("Diurnal range" = "dayrange",
                                     "Multi-year daily means" = "ydaymean")

operators[["Monthly statistics"]] <- c("Monthly anomalies" = "mon.anomaly",
                                       "Monthly maxima" = "monmax",
                                       "Monthly means" = "monmean",
                                       "Monthly minima" = "monmin",
                                       "Monthly standard deviation" = "monsd",
                                       "Monthly sums" = "monsum",
                                       "Multi-monthly means" = "multimonmean",
                                       "Multi-monthly sums" = "multimonsum",
                                       "Multi-year monthly maxima" = "ymonmax",
                                       "Multi-year monthly means" = "ymonmean",
                                       "Multi-year monthly minima" = "ymonmin",
                                       "Multi-year monthly standard deviations" = "ymonsd",
                                       "Multi-year monthly sums" = "ymonsum")

operators[["Seasonal statistics"]] <- c("Seasonal anomalies" = "seas.anomaly",
                                        "Seasonal means" = "seasmean",
                                        "Seasonal sums" = "seassum",
                                        "Multi-year seasonal maxima" = "yseasmax",
                                        "Multi-year seasonal means" = "yseasmean",
                                        "Multi-year seasonal minima" = "yseasmin",
                                        "Multi-year seasonal standard deviations" = "yseassd")

operators[["Annual statistics"]] <- c("Annual anomalies" = "year.anomaly",
                                      "Annual means" = "yearmean",
                                      "Annual sums" = "yearsum")

operators[["Temporal operators"]] <- c("All-time maxima" = "timmax",
                                       "Mean of time series" = "timmean",
                                       "All-time minima" = "timmin",
                                       "Percentile over all time steps" = "timpctl",
                                       "All-time standard deviations" = "timsd",
                                       "Sum of time series" = "timsum",
                                       "Linear trends" = "trend")

operators[["Spatial operators"]] <- c("Field maximum" = "fldmax",
                                      "Field mean" = "fldmean",
                                      "Field minimum" = "fldmin",
                                      "Weighted spatial mean" = "wfldmean")

operators[["Selection"]] <- c("Remove time period" = "extract.period",
                              "Select region by longitude/latitude" = "sellonlatbox",
                              "Extract list of months" = "selmon",
                              "Extract time period" = "selperiod",
                              "Extract data at given point" = "selpoint",
                              "Extract list of years" = "selyear")

operators[["Data manipulation"]] <- c("Grid interpolation" = "remap")

operatorOptions <- c("constant", "region", "point", "useFastTrend", "dateRange", "percentile", "months", "years", "times", "method")

operatorOptionsDict <- c()
operatorOptionsDict[["constant"]] <- c("cmsaf.addc",
                                       "cmsaf.divc",
                                       "cmsaf.mulc",
                                       "cmsaf.subc")
operatorOptionsDict[["region"]] <- c("sellonlatbox")
operatorOptionsDict[["point"]] <- c("selpoint")
operatorOptionsDict[["useFastTrend"]] <- c("trend")
operatorOptionsDict[["dateRange"]] <- c("selperiod",
                                     "extract.period")
operatorOptionsDict[["percentile"]] <- c("timpctl")
operatorOptionsDict[["months"]] <- c("selmon")
operatorOptionsDict[["years"]] <- c("selyear")
operatorOptionsDict[["times"]] <- c("seltime")
operatorOptionsDict[["method"]] <- c("remap")

# default plot settings
textsize    <- 1.2
linesize    <- 1.5
bordercolor <- "gray20"
# imagewidth  <- -1         # if -1 image dimensions are taken from data
# imageheight <- -1
na.color    <- "gray80"
image_def <- 800         # default image size
ihsf      <- 0.1         # default image heigth scale factor
grid_col  <- "cornsilk2" # default color of grid lines
plot_grid <- TRUE        # plot grid lines (TRUE = yes, FALSE = no)

# data of all countries
data(countriesHigh, package = "rworldxtra")
world <- as(countriesHigh,"SpatialLines")
