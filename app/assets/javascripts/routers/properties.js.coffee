class Leafback.Routers.Properties extends Backbone.Router
  routes:
    "properties/:id": "show"
    ""              : "index"
    "properties"    : "index"
    "properties/"   : "index"

  initialize: ->
    @route /properties\/?\?(.*)/, "index", @index # properties?page=10&source=public
    @collection = new Leafback.Collections.Properties(window.data['properties'])

  index: (params)->
    params = @strToParams(params)
    @collection.setPage(params["page"]) if params["page"]?
    view = new Leafback.Views.PropertiesIndex(collection: @collection)
    $("#index-container").html(view.render().el)
  
  show: (id)->
    @model    = new Leafback.Models.Property(id: id)
    view      = new Leafback.Views.PropertiesShow(model: @model)
    @model.on("change", -> view.render())

    if window.data['property']?
      @model.set(window.data['property'])
    else
      @model.fetch()

    $("#show-container").html(view.render().el)

  strToParams: (paramStr)->
    return {} unless paramStr? and paramStr.length > 0
    _.inject(
      _.map(
        paramStr.split("&"),
        (i)-> i.split("=")
      ),
      (s, i)-> s[i[0]] = i[1] ; s;,
      {}
    )