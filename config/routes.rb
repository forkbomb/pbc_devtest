Rails.application.routes.draw do
    get 'locations/:country_code' => 'private/private#locations'
    get 'target_groups/:country_code' => 'private/private#target_groups'
    post 'evaluate_target' => 'private/private#evaluate_target'
    
    scope 'public' do
    get 'locations/:country_code' => 'public/public#locations'
    get 'target_groups/:country_code' => 'public/public#target_groups'
    end
end
