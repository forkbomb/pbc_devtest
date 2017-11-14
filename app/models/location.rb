class Location < ActiveRecord::Base
    belongs_to :target_group, foreign_key: [:external_id, :secret_code], primary_key: [:external_id, :secret_code]

    has_many :panel_providers, through: :target_group
    has_many :location_groups, through: :panel_providers
end