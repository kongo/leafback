class Leafback.Collections.Properties extends Backbone.Collection

  model      : Leafback.Models.Property
  baseUrl    : "/properties"
  pageParam  : "page"
  pageInfo   : {}
  currentPage: 1

  initialize: (models, options)->
    @fetch() unless models?
    window.x = @

  parse: (resp, xhr)->
    @pageInfo = {
      currentPage:  resp["current_page"]
      numPages:     resp["num_pages"]
      perPage:      resp["per_page"]
    }
    resp["models"]

  page: ->
    @currentPage

  setPage:(page) ->
    @currentPage = page
    @fetch()

  url: ->
    params = @queryParameters()
    params[@pageParam] = @currentPage
    @baseUrl + "?" + _.map(params, (v,k)-> "#{k}=#{v}").join("&")

  queryParameters: ->
    result = {};
    if window.location.search
        params = window.location.search.slice(1).split("&")
        for i in [1..params.length]
          tmp = params[i-1].split("=")
          result[tmp[0]] = unescape(tmp[1])
    result