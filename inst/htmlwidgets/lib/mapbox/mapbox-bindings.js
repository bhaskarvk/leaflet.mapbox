/* global LeafletWidget, L */
LeafletWidget.Mapbox = {};

LeafletWidget.Mapbox.mapFactory = function(el, options) {
  L.mapbox.accessToken = options.mapbox_access_token;
  var init = options.mapbox_init_arg;
  return L.mapbox.map(el, init, options);
};

LeafletWidget.methods.addMapboxTileLayer = function(id, layerId, group, options) {
  var tileLayer = L.mapbox.tileLayer(id, options);
  this.layerManager.addLayer(tileLayer, 'tile', layerId, group);
};

