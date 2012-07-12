class Leafback.Routers.Properties extends Backbone.Router
  routes:
    '': 'index'
    'properties/:id': 'show'

  index: ->
    view = new Leafback.Views.PropertiesIndex()
    $("#bb-container").html(view.render().el)

  show: (id)->
    alert "Property #{id}"