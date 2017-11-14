class PanelProvider < ActiveRecord::Base

    has_many :countries

    def calculate_price
        raise NotImplementedError, 'Abstract method called!'
    end
    
end