class Leafback.Collections.Properties extends Backbone.Collection

  model      : Leafback.Models.Property
  baseUrl    : "/properties"
  pageParam  : "page"
  pageInfo   : {}
  currentPage: 1

  initialize: (models, options)->
    window.x = @

  parse: (resp, xhr)->
    @setPageInfo(resp)
    resp["models"]

  setPageInfo: (info)->
    _.extend(@pageInfo, {
      currentPage:  Number(info["current_page"] or info["currentPage"]),
      numPages:     Number(info["num_pages"]    or info["numPages"]),
      perPage:      Number(info["per_page"]     or info["perPage"])
    })
    @currentPage = @pageInfo['currentPage']

  page: ->
    @currentPage

  setPage:(page) ->
    return unless page > 0
    oldPage = @currentPage
    @currentPage = Number(page)
    @fetch() unless oldPage == @currentPage

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