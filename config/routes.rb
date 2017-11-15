Rails.application.routes.draw do
    get 'locations/:country_code' => 'public#locations'
    get 'target_groups/:country_code' => 'public#target_groups'
end
