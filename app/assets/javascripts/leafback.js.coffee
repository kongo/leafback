window.Leafback =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Leafback.Routers.Properties()
    Backbone.history.start()

$(document).ready ->
  Leafback.init()
