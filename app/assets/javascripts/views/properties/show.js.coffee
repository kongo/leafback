class Leafback.Views.PropertiesShow extends Backbone.View

  template: JST['properties/show']

  initialize: ->

  render: ->
    $(@el).html(@template(property: @model))
    this