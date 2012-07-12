class Property < ActiveRecord::Base
  attr_accessible :approx_sqft, :bathrooms, :bedrooms, :city, :geo_lat, :geo_lon, :list_price, :street_name, :street_number, :street_suffix, :unit_number, :year_built, :zip_code
end
