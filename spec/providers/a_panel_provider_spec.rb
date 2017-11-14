require_relative '../rails_helper'

describe Providers::APanelProvider do
    let(:body) { File.new('spec/fixtures/files/time.com.html') }
    

    before(:all) do
        @provider = Providers::APanelProvider.new
    end


    it 'should be able to calculate price' do
        stub_request(:get, "http://time.com/").to_return(body: body, status: 200)
        expect { @provider.calculate_price }.not_to raise_error
    end

    it 'should calculate price properly' do
        stub_request(:get, "http://time.com/").to_return(body: body, status: 200)
        expect(@provider.calculate_price).to eq(101)
    end

    it 'should raise error when time.com doesn\'t respond' do
        stub_request(:get, "http://time.com/").to_timeout
        expect { @provider.calculate_price }.to raise_error(Timeout::Error, 'Could not connect to remote host')
    end
end