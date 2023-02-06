#' Load Lead Entities
#'
#' This function reads lead entities data from an ESRI REST API as a simple features object and
#' saves it to the working directory as an ESRI shapefile if the download_files argument is set to TRUE.
#'
#' @param download_files A logical value indicating whether to save the lead entities data to the working directory as an ESRI shapefile.
#' @return A simple features object containing the lead entities data.
#' @export
#' @examples
#' \dontrun{
#' lead_entities <- load_lead_entities()
#' head(lead_entities)
#' lead_entities_file <- load_lead_entities(download_files = TRUE)
#' }
#' @importFrom sf read_sf st_write
#'
#'
load_lead_entities <- function(download_files = FALSE) {
  lead_entities <- sf::read_sf("https://gismanager.rco.wa.gov/arcgis/rest/services/OpenData/WA_RCO_OpenData/MapServer/4/query?where=1%3D1&outFields=*&outSR=4326&f=json")
  if (!inherits(lead_entities, "sf")) {
    warning("The lead entities ESRI rest API has changed and data could not be read as an 'sf' object.")
  }
  if (download_files) {
    file_path <- file.path(getwd(), "lead_entities.sf")
    sf::st_write(lead_entities, dsn = file_path, driver = "ESRI Shapefile")
  }
  return(lead_entities)
}

