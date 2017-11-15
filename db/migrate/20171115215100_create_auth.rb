class CreateAuth < ActiveRecord::Migration
    def change
        create_table :auth do |t|
            t.string :uuid, unique: true
            t.string :token
        end
    end
end