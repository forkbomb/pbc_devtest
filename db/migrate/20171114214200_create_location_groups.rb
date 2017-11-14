class CreateLocationGroups < ActiveRecord::Migration
    def change
        create_table :location_groups do |t|
            t.string :name
            t.references :panel_provider
            t.references :country
        end
    end
end