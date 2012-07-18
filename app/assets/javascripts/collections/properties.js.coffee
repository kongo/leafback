class Leafback.Collections.Properties extends Backbone.Collection

  model      : Leafback.Models.Property
  baseUrl    : "/properties"
  pageParam  : "page"
  pageInfo   : {}
  currentPage: 1

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

  setPage:(page) ->
    return unless page > 0
    [oldPage, @currentPage] = [@currentPage, Number(page)]
    @fetch() unless oldPage == @currentPage

  url: ->
    _.locationWithParams(@baseUrl, {page: @currentPage})