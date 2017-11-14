require_relative '../rails_helper'

describe Providers::ArraysPanelProvider do
    let(:body) { File.new('spec/fixtures/files/search.json') }
    

    before(:all) do
        @provider = Providers::ArraysPanelProvider.new
    end


    it 'should be able to calculate price' do
        stub_request(:get, "http://openlibrary.org/search.json?q=the+lord+of+the+rings").to_return(body: body, status: 200)
        expect { @provider.calculate_price }.not_to raise_error
    end

    it 'should calculate price properly' do
        stub_request(:get, "http://openlibrary.org/search.json?q=the+lord+of+the+rings").to_return(body: body, status: 200)
        expect(@provider.calculate_price).to eq(3)
    end
end