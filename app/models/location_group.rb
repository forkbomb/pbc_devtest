class LocationGroup < ActiveRecord::Base

    belongs_to :panel_provider
    belongs_to :country

end