class CreateTargetGroups < ActiveRecord::Migration
    def change
        create_table :target_groups do |t|
            t.string :name
            t.integer :external_id
            t.string :secret_code
            t.references :parent, index: true
            t.references :panel_provider
        end

        add_index :target_groups, [:external_id, :secret_code], :unique => true
    end
end