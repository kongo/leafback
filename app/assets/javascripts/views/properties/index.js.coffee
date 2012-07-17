class Leafback.Views.PropertiesIndex extends Backbone.View

  template: JST['properties/index']
  pagingTemplate: JST['properties/paging']

  events:
    "submit #new_property": "createProperty"
    "click a.jlink": "navigateThroughLink"
    "click .pagination a": "navigateThroughLink"

  initialize: ->
    @collection.on("reset", @render, this)
    @collection.on("add", @appendProperty, this)

  render: ->
    $(@el).html(@template(collection: @collection, pagingTemplate: @pagingTemplate))
    @collection.each(@appendProperty)
    this

  appendProperty: (property)=>
    view = new Leafback.Views.Property(model: property)
    $(@el).find("table.properties tbody").append(view.render().el)

  createProperty: (event)->
    event.preventDefault()
    @collection.create street_number: $("#property_street_number").val()
    $("#new_property")[0].reset()

  navigateThroughLink: (event)->
    event.preventDefault()
    Backbone.history.navigate(event.target.attributes["href"].value, true)
    false
