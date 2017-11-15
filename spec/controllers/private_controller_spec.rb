require_relative '../rails_helper'

describe Private::PrivateController do

    context 'without token' do
        it 'should redirect to public api for locations' do
            get :locations, { country_code: 'DE' }
            expect(response).to redirect_to controller: 'public/public', action: 'locations'
        end

        it 'should redirect to public api for target_groups' do
            get :target_groups, { country_code: 'US' }
            expect(response).to redirect_to controller: 'public/public', action: 'target_groups'
        end

        it 'should return error on other actions' do
            get :evaluate_target 
            expect(response.status).to eq(401)
        end
    end

    context 'with token' do

        before(:all) do
            @auth = Auth.create!
        end
        

        it 'should check authentication data' do
            @request.headers['Authentication-Id'] = @auth.uuid
            @request.headers['Authentication-Secret'] = 'b'
            get :evaluate_target, params: { country_code: 0, locations: [ { id: 0 } ] }
            expect(response.status).to eq(401)            
        end

        it 'should require target_group param for evaluate_target' do
            @request.headers['Authentication-Id'] = @auth.uuid
            @request.headers['Authentication-Secret'] = @auth.password
            get :evaluate_target, { country_code: 0, locations: [ { id: 0 } ] }
            expect(response.status).to eq(404)
        end

        it 'should require proper params for evaluate_target' do
            @request.headers['Authentication-Id'] = @auth.uuid
            @request.headers['Authentication-Secret'] = @auth.password
            get :evaluate_target, { target_group_id: 1, locations: [ { id: 0 } ] }
            expect(response.status).to eq(404)
        end

        it 'should require proper params for evaluate_target' do
            @request.headers['Authentication-Id'] = @auth.uuid
            @request.headers['Authentication-Secret'] = @auth.password
            get :evaluate_target, { target_group_id: 1, country_code: 0, locations: [ { id: 0 } ] }
            expect(response.status).to eq(404)
        end

        it 'should return price' do 
            @request.headers['Authentication-Id'] = @auth.uuid
            @request.headers['Authentication-Secret'] = @auth.password
            allow_any_instance_of(Providers::APanelProvider).to receive(:calculate_price).and_return(3)
            stub_request(:get, "http://time.com/").to_return(body: 'body', status: 200)
            get :evaluate_target, { target_group_id: 1, country_code: 'UK', locations: [ { id: 123, panel_size: 200 } ] }
            expect(JSON.parse(response.body)['price']).to eq(600)
        end
    end
end