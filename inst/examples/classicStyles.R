#' ---
#' title: "Esri Basemap Layers w/ Labels"
#' author: "Bhaskar V. Karambelkar"
#' ---

library(leaflet.mapbox)

basemaps <- mapbox.classicStyleIds

# Continental US
l <- leafletMapbox() %>% setView(-98.35,39.5,3)

purrr::walk(names(basemaps),
            function(basemap) {
              l <<- l %>% addMapboxTileLayer(
                id = mapbox.classicStyleIds[[basemap]],
                group=basemap,
                options = leaflet::tileOptions(detectRetina = TRUE))
            })

l %>%
  addLayersControl(baseGroups = names(basemaps))
