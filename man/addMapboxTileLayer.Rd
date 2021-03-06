% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapbox.R
\name{addMapboxTileLayer}
\alias{addMapboxTileLayer}
\title{Adds a Mapbox TileLayer using the given id/url/tilejson}
\usage{
addMapboxTileLayer(map, id, layerId = NULL, group = NULL,
  format = c("png", "png32", "png64", "png128", "png256", "jpg70", "jpg80",
  "jpg90"), options = leaflet::tileOptions())
}
\arguments{
\item{map}{The map widget}

\item{id}{Either an id or a URL or a tilejson}

\item{layerId}{An optional unique ID for the TileLayer}

\item{group}{An optional group this TileLayer belongs to}

\item{format}{Tile image format.}

\item{options}{Options for Tile Layer.}
}
\description{
Adds a Mapbox TileLayer using the given id/url/tilejson
}

