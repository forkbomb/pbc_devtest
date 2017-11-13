class PanelProvider < ActiveRecord::Base

    def calculate_price
        raise NotImplementedError, 'Abstract method called!'
    end
    
end