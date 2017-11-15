class Country < ActiveRecord::Base

    belongs_to :panel_provider
    has_many :location_groups

    has_many :panel_providers, through: :location_groups
    has_many :target_groups, -> { where('parent_id IS NULL') }, through: :panel_providers

    validates :country_code, uniqueness: true

end