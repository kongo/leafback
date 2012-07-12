class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :street_number
      t.string :street_name
      t.integer :unit_number
      t.string :street_suffix
      t.string :city
      t.string :zip_code
      t.float :geo_lat
      t.float :geo_lon
      t.float :approx_sqft
      t.integer :year_built
      t.integer :bedrooms
      t.integer :bathrooms
      t.float :list_price

      t.timestamps
    end
  end
end
