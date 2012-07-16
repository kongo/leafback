class Leafback.Models.Property extends Backbone.Model

  initialize: ->
    @url = "/properties/#{@get('id')}"

  address: ->
    "#{@attributes['street_number']} #{@attributes['street_name']} #{@attributes['street_suffix']}, #{@attributes['city']}"
