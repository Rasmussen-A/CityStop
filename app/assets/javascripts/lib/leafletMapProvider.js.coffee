App = {}

App.MapProviders = {}

App.MapProviders.Leaflet = ->
  # Creating new map
  createMap: (elementId) ->
    @map = new L.Map(elementId)
    @addBaseMap()
    map

  addBaseMap: () ->
    cloudemadeUrl = 'http://{s}.tile.cloudmade.com/27811c2dd4ab4a1d9bc5a8ebe17a82a6/997/256/{z}/{x}/{y}.png'
    cloudemadeAttribution = 'Map data &copy; <a href="openstreetmap.org">OpenStreetMap</a> contributors, <a href="creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="cloudmade.com">CloudMade</a>'
    layer = new L.TileLayer(cloudemadeUrl, {maxZoom: 15, attribution: cloudemadeAttribution})
    @addLayerToMap(layer)

  addLayerToMap: (layer) ->
    @map.addLayer(layer)

  setViewForMap: (options) ->
    point = new L.LatLng(options.latitude, options.longitude)
    @map.setView(point, options.zoomLevel)
