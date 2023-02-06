#' Load the Salmon Recovery Regions of Washington
#'
#' This function loads the salmon recovery regions data from the ESRI Open Data Portal and returns it as a sf object.
#' The user can also choose to save the data as an ESRI Shapefile by setting the `download_files` argument to `TRUE`.
#'
#' @param download_files A logical argument to specify whether to save the data to the current working directory as an ESRI Shapefile.
#' The default value is `FALSE`.
#'
#' @return An `sf` object with the salmon recovery regions data.
#'
#' @examples
#' salmon_recovery_regions <- load_salmon_recovery_regions()
#' salmon_recovery_regions <- load_salmon_recovery_regions(download_files = TRUE)
#'
#' @export
#'
#' @importFrom sf read_sf st_write
#'
#'
load_salmon_recovery_regions <- function(download_files = FALSE) {
  salmon_recovery_regions <- sf::read_sf("https://gismanager.rco.wa.gov/arcgis/rest/services/OpenData/WA_RCO_OpenData/MapServer/3/query?outFields=*&where=1%3D1&f=geojson")
  if (!inherits(salmon_recovery_regions, "sf")) {
    warning("The salmon recovery regions ESRI rest API has changed and data could not be read as an 'sf' object.")
  }
  if (download_files) {
    file_path <- file.path(getwd(), "salmon_recovery_regions.sf")
    sf::st_write(salmon_recovery_regions, dsn = file_path, driver = "ESRI Shapefile")
  }
  return(salmon_recovery_regions)
}
