class ApplicationHelper
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

  paramsToStr: (params) ->
    _.inject(
      params,
      (result, value, key)-> result.push "#{key}=#{value}"; result
      []
    ).join("&")


  locationWithParams: (location, params)->
    return location unless params? and _.keys(params).length > 0
    [location, currentParams] = location.split "?"
    currentParams = @strToParams(currentParams)
    params = _.extend(currentParams, params)
    location + "?" + @paramsToStr(params)

_.extend(_, new ApplicationHelper)




class RouterHelper
  slideTo: (el)->
    $("html:not(:animated),body:not(:animated)").animate { scrollTop: $(el).offset().top}, 200

_.extend(Backbone.Router.prototype, new RouterHelper)