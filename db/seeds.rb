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

lg1 = LocationGroup.create!(panel_provider: pp1, country: c1)
lg2 = LocationGroup.create!(panel_provider: pp2, country: c2)
lg3 = LocationGroup.create!(panel_provider: pp3, country: c3)
lg4 = LocationGroup.create!(panel_provider: pp1, country: c1)

tgA = TargetGroup.create!(panel_provider: pp1, name: 'A', external_id: 1, secret_code: 'A', locations: Location.create([{name: 'London'}, {name: 'Birmingham'}]))
tgB = TargetGroup.create!(panel_provider: pp2, name: 'B', external_id: 1, secret_code: 'B', locations: Location.create([{name: 'Chicago'}, {name: 'Illinois'}]))
tgC = TargetGroup.create!(panel_provider: pp3, name: 'C', external_id: 1, secret_code: 'C', locations: Location.create([{name: 'Berlin'}, {name: 'Frankfurt'}]))
tgD = TargetGroup.create!(panel_provider: pp1, name: 'D', external_id: 1, secret_code: 'D', locations: Location.create([{name: 'Manchester'}, {name: 'Chelsea'}]))

tgAA = TargetGroup.create!(parent: tgA, name: 'AA', external_id: 1, secret_code: 'AA', locations: Location.create([{name: 'Lyon'}]))
tgAAA = TargetGroup.create!(parent: tgAA, name: 'AAA', external_id: 1, secret_code: 'AAA', locations: Location.create([{name: 'Liverpool'}]))
tgAAAA = TargetGroup.create!(parent: tgAAA, name: 'AAAA', external_id: 1, secret_code: 'AAAA', locations: Location.create([{name: 'Leicester'}]))

tgBB = TargetGroup.create!(parent: tgB, name: 'BB', external_id: 1, secret_code: 'BB', locations: Location.create([{name: 'Seattle'}]))
tgBBB = TargetGroup.create!(parent: tgBB, name: 'BBB', external_id: 1, secret_code: 'BBB', locations: Location.create([{name: 'San Francisco'}]))
tgBBBB = TargetGroup.create!(parent: tgBBB, name: 'BBBB', external_id: 1, secret_code: 'BBBB', locations: Location.create([{name: 'Tennessee'}]))

tgCC = TargetGroup.create!(parent: tgC, name: 'CC', external_id: 1, secret_code: 'CC', locations: Location.create([{name: 'Dusseldorf'}]))
tgCCC = TargetGroup.create!(parent: tgCC, name: 'CCC', external_id: 1, secret_code: 'CCC', locations: Location.create([{name: 'Koln'}]))
tgCCCC = TargetGroup.create!(parent: tgCCC, name: 'CCCC', external_id: 1, secret_code: 'CCCC', locations: Location.create([{name: 'Hamburg'}]))

tgDD = TargetGroup.create!(parent: tgD, name: 'DD', external_id: 1, secret_code: 'DD', locations: Location.create([{name: 'Newcastle'}]))
tgDDD = TargetGroup.create!(parent: tgDD, name: 'DDD', external_id: 1, secret_code: 'DDD', locations: Location.create([{name: 'Tottenham'}]))
tgDDDD = TargetGroup.create!(parent: tgDDD, name: 'DDDD', external_id: 1, secret_code: 'DDDD', locations: Location.create([{name: 'Brighton'}]))