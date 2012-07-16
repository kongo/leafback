class Leafback.Views.PropertiesIndex extends Backbone.View

  template: JST['properties/index']

  events:
    "submit #new_property": "createProperty"

  initialize: ->
    @collection.on("reset", @render, this)
    @collection.on("add", @appendProperty, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendProperty)
    this

  appendProperty: (property)=>
    view = new Leafback.Views.Property(model: property)
    $(@el).find("table.properties tbody").prepend(view.render().el)


  createProperty: (event)->
    event.preventDefault()
    @collection.create street_number: $("#property_street_number").val()
    $("#new_property")[0].reset()