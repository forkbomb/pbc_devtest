class PanelProvider < ActiveRecord::Base

    has_many :countries
    has_many :location_groups

    def calculate_price
        raise NotImplementedError, 'Abstract method called!'
    end
    
end