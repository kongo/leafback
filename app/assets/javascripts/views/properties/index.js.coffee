class Leafback.Views.PropertiesIndex extends Backbone.View

  template: JST['properties/index']

  initialize: ->
    @collection.on("reset", @render, this)

  render: ->
    $(@el).html(@template(properties: @collection))
    this