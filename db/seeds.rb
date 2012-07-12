# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_file = File.join(Rails.root, 'db', 'seeds.yml')
seed_data = YAML::load_file(seed_file)
Property.create(seed_data["properties"])