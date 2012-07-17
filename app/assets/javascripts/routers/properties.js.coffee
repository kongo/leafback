class Leafback.Routers.Properties extends Backbone.Router
  routes:
    "properties/:id": "show"
    ""              : "index"
    "properties"    : "index"
    "properties/"   : "index"

  initialize: ->
    @route /properties\/?\?(.*)/, "index", @index # properties?page=10&source=public
    @collection = new Leafback.Collections.Properties(window.data['properties'])
    @collection.setPageInfo(window.data['properties_page_info']) if window.data['properties_page_info']?

  index: (params)->
    params = _.strToParams(params)
    @collection.setPage(params["page"]) if params["page"]?
    view = new Leafback.Views.PropertiesIndex(collection: @collection)
    $("#index-container").html(view.render().el)
    @slideTo($("#index-container"))
  
  show: (id)->
    @model    = new Leafback.Models.Property(id: id)
    view      = new Leafback.Views.PropertiesShow(model: @model)
    @model.on("change", -> view.render())

    if window.data['property']?
      @model.set(window.data['property'])
    else
      @model.fetch()

    $("#show-container").html(view.render().el)
    @slideTo($("#show-container"))