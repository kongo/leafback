class Leafback.Routers.Properties extends Backbone.Router
  routes:
    "": "index"
    "properties/:id": "show"

  initialize: ->
    @collection = new Leafback.Collections.Properties()
    @collection.fetch()

  index: ->
    view = new Leafback.Views.PropertiesIndex(collection: @collection)
    $("#app-container").html(view.render().el)
  
  show: (id)->
    alert("Property #{id}")