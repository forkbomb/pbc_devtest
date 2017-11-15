require_relative '../rails_helper'

describe PublicController do

    context 'locations' do
        it 'should return proper locations' do
            get :locations, { country_code: 'USA' }
            parsed_body = JSON.parse(response.body)
            expect(parsed_body.map {|loc| loc['name'] }).to contain_exactly('Chicago', 'Illinois') 
        end

        it 'should return nothing for unexisting country code' do
            get :locations, { country_code: 'OK' }
            expect(response.status).to eq(404)
        end
    end

    context 'target_groups' do
        it 'should return proper locations' do
            get :target_groups, { country_code: 'UK' }
            parsed_body = JSON.parse(response.body)
            expect(parsed_body.map {|tg| tg['name'] }).to contain_exactly('A', 'D') 
        end

        it 'should return nothing for unexisting country code' do
            get :target_groups, { country_code: 'OK' }
            expect(response.status).to eq(404)
        end
    end
end