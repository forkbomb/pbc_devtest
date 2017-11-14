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
lg2 = LocationGroup.create!(panel_provider: pp2, country: c1)
lg3 = LocationGroup.create!(panel_provider: pp3, country: c1)
lg4 = LocationGroup.create!(panel_provider: pp1, country: c1)

tgA = TargetGroup.create!(panel_provider: pp1, name: 'A')
tgB = TargetGroup.create!(panel_provider: pp2, name: 'B')
tgC = TargetGroup.create!(panel_provider: pp3, name: 'C')
tgD = TargetGroup.create!(panel_provider: pp1, name: 'D')

tgAA = TargetGroup.create!(parent: tgA, name: 'AA')
tgAAA = TargetGroup.create!(parent: tgAA, name: 'AAA')
tgAAAA = TargetGroup.create!(parent: tgAAA, name: 'AAAA')

tgBB = TargetGroup.create!(parent: tgB, name: 'BB')
tgBBB = TargetGroup.create!(parent: tgBB, name: 'BBB')
tgBBBB = TargetGroup.create!(parent: tgBBB, name: 'BBBB')

tgCC = TargetGroup.create!(parent: tgC, name: 'CC')
tgCCC = TargetGroup.create!(parent: tgCC, name: 'CCC')
tgCCCC = TargetGroup.create!(parent: tgCCC, name: 'CCCC')

tgDD = TargetGroup.create!(parent: tgD, name: 'DD')
tgDDD = TargetGroup.create!(parent: tgDD, name: 'DDD')
tgDDDD = TargetGroup.create!(parent: tgDDD, name: 'DDDD')
