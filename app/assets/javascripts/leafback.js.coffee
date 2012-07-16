window.Leafback =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Leafback.Routers.Properties()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Leafback.init()
