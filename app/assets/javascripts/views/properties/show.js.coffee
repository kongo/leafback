class Leafback.Views.PropertiesShow extends Backbone.View

  template: JST['properties/show']

  initialize: ->

  render: ->
    @$el.html(@template(property: @model))
    this

  renderMap: ->
    map     = new L.Map(@$el.find(".map").get(0))
    marker  = new L.Marker(@place())
    p = marker.bindPopup("<b>#{@model.address()}</b><br/><br/><b>SqFt: </b>#{@model.get("approx_sqft")}<br/>"+ "<b>Year:</b> #{@model.get("year_built")}<br/><b>Price: </b>#{@model.get("list_price")}<br/>")
    p.openPopup()
    map.setView(@place(), 10).addLayer(@mapLayer()).addLayer(marker)

  place: ->
    @_place or @_place = new L.LatLng(@model.get("geo_lat"), @model.get("geo_lon"))

  mapLayer: ->
    new L.TileLayer(
      'http://{s}.tile.cloudmade.com/2491da85537149cfae567760088dae82/997/256/{z}/{x}/{y}.png',
      {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
        maxZoom: 18
      }
    )