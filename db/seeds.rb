# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pp1 = Providers::APanelProvider.create!(code: 'a')
pp2 = Providers::ArraysPanelProvider.create!(code: 'arrays')
pp3 = Providers::NodesPanelProvider.create!(code: 'nodes')

c1 = Country.create!(panel_provider: pp1, country_code: 'UK')
c2 = Country.create!(panel_provider: pp2, country_code: 'USA')
c3 = Country.create!(panel_provider: pp3, country_code: 'DE')

lg1 = LocationGroup.create!(panel_provider: pp1, country: p1)
lg2 = LocationGroup.create!(panel_provider: pp2, country: p1)
lg3 = LocationGroup.create!(panel_provider: pp3, country: p1)
lg4 = LocationGroup.create!(panel_provider: pp1, country: p1)
