% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_salmon_recovery_regions.R
\name{load_salmon_recovery_regions}
\alias{load_salmon_recovery_regions}
\title{Load the Salmon Recovery Regions of Washington}
\usage{
load_salmon_recovery_regions(download_files = FALSE)
}
\arguments{
\item{download_files}{A logical argument to specify whether to save the data to the current working directory as an ESRI Shapefile.
The default value is \code{FALSE}.}
}
\value{
An \code{sf} object with the salmon recovery regions data.
}
\description{
This function loads the salmon recovery regions data from the ESRI Open Data Portal and returns it as a sf object.
The user can also choose to save the data as an ESRI Shapefile by setting the \code{download_files} argument to \code{TRUE}.
}
\examples{
salmon_recovery_regions <- load_salmon_recovery_regions()
salmon_recovery_regions <- load_salmon_recovery_regions(download_files = TRUE)

}
