class LocationGroup < ActiveRecord::Base

    belongs_to :panel_provider
    belongs_to :country

    has_many :target_groups, through: :panel_provider
    has_many :locations, through: :target_groups

end