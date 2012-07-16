class Leafback.Collections.Properties extends Backbone.Collection

  model: Leafback.Models.Property
  url:   "/properties"

  initialize: (models, options)->
    unless models?
      @fetch()