class Leafback.Routers.Properties extends Backbone.Router
  routes:
    "": "index"
    "properties/:id": "show"

  initialize: ->
    @collection = new Leafback.Collections.Properties(window.data['properties'])

  index: ->
    view = new Leafback.Views.PropertiesIndex(collection: @collection)
    $("#index-container").html(view.render().el)
  
  show: (id)->
    @model    = new Leafback.Models.Property(id: id)
    view      = new Leafback.Views.PropertiesShow(model: @model)
    @model.on("change", -> view.render())

    if window.data['property']?
      @model.set(window.data['property'])
    else
      @model.fetch()

    $("#show-container").html(view.render().el)
