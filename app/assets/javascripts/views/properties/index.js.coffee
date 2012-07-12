class Leafback.Views.PropertiesIndex extends Backbone.View

  template: JST['properties/index']

  render: ->
    $(@el).html(@template())
    this