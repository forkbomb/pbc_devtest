class CreatePanelProviders < ActiveRecord::Migration
    def change
        create_table :panel_providers do |t|
            t.string :code
            t.string :type
        end
    end
end