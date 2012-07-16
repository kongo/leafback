class Leafback.Collections.Properties extends Backbone.Collection

  model: Leafback.Models.Property
  url: "/properties"

  initialize: (models, options)->
    @fetch() unless models?

  parse: (resp, xhr)->
    @currentPage  = resp["current_page"]
    @numPages     = resp["num_pages"]
    @perPage      = resp["per_page"]
    resp["models"]

  page: ->
    @currentPage

  setPage:(page) ->
    @currentPage = page
    @fetch()

  #url: ->
  #  baseUrl = "/properties"
  #  fragment = Backbone.history.fragment
  #  query = fragment.split(?)[1]