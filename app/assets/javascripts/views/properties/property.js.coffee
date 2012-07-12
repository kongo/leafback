class Leafback.Views.Property extends Backbone.View

  template: JST['properties/property']
  tagName: "tr"

  render: ->
    $(@el).html(@template(p: @model))
    this