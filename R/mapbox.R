mapboxDependencies <- function() {
  list(
    htmltools::htmlDependency(
      "mapbox",version = "2.4.0",
      system.file("htmlwidgets/lib/mapbox", package = "leaflet.mapbox"),
      script = c('mapbox.standalone.js', 'mapbox-bindings.js'),
      stylesheet = c('leafletfix.css', 'mapbox.css')
    )
  )
}

#' Map IDs for classic Mapbox styles
#' @export
mapbox.classicStyleIds <- list(
  streets = 'mapbox.streets',
  light = 'mapbox.light',
  dark = 'mapbox.dark',
  satellite = 'mapbox.satellite',
  streets_satellite = 'mapbox.streets-satellite',
  wheatpaste = 'mapbox.wheatpaste',
  streets_basic = 'mapbox.streets-basic',
  comic = 'mapbox.comic',
  outdoors = 'mapbox.outdoors',
  run_bike_hike = 'mapbox.run-bike-hike',
  pencil = 'mapbox.pencil',
  pirates = 'mapbox.pirates',
  emerald = 'mapbox.emerald',
  high_contrast = 'mapbox.high-contrast'
)

#' adds a Toolbar to draw shapes/points on the map
#' @param map the map
#' @param access_token By default will look up for a Environment variable MAPBOX_ACCESS_TOKEN
#' @param init An optional id/url/tilejson for the basemap.
#' @param data the data for the map
#' @param width the width of the map
#' @param height the height of the map
#' @param padding the padding of the map
#' @param options the map options
#' @return A HTML widget object, on which we can add graphics layers using
#' @export
leafletMapbox <- function(
  access_token = Sys.getenv('MAPBOX_ACCESS_TOKEN'),
  init = NULL,
  data = NULL, width = NULL, height = NULL,
  padding = 0, options = leafletOptions()
) {
  if(is.null(access_token)) {
    stop("Need mapbox access token")
  }
  options$mapbox_access_token = access_token
  options$mapbox_init_arg = init
  options$mapFactory = JS("LeafletWidget.Mapbox.mapFactory")

  map <- leaflet::leaflet(data, width, height, padding, options)

  map$dependencies <- c(map$dependencies, mapboxDependencies())
  map
}

#' Adds a Mapbox TileLayer using the given id/url/tilejson
#' @param map The map widget
#' @param id Either an id or a URL or a tilejson
#' @param layerId An optional unique ID for the TileLayer
#' @param group An optional group this TileLayer belongs to
#' @param format Tile image format.
#' @param options Options for Tile Layer.
#' @export
addMapboxTileLayer <- function(
  map, id,
  layerId = NULL, group = NULL,
  format = c('png', 'png32', 'png64', 'png128', 'png256',
             'jpg70', 'jpg80', 'jpg90'),
  options = leaflet::tileOptions()) {

  format <- match.arg(format)
  options <- leaflet::filterNULL(c(format=format, options))

  invokeMethod(map, leaflet::getMapData(map),
               'addMapboxTileLayer', id,
               layerId, group,
               options)
}

