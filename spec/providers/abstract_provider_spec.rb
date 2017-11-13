require_relative '../rails_helper'

describe PanelProvider do
    it 'should not be able to calculate price' do
        provider = PanelProvider.new
        expect { provider.calculate_price }.to raise_error(NotImplementedError, 'Abstract method called!')
    end
end