class CreateCountries < ActiveRecord::Migration
    def change
        create_table :countries do |t|
            t.string :country_code, unique: true
            t.references :panel_provider
        end

    end
end