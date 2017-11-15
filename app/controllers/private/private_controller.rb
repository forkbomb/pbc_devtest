class Private::PrivateController < ApplicationController

    before_filter :check_token

    def evaluate_target
        params.require(:country_code)
        params.require(:target_group_id)
        params.require(:locations)
        params.permit(locations: []).permit(:id, :panel_size)
        size = 0
        country = Country.find_by_country_code(params[:country_code])
        # target_group = TargetGroup.find(params[:target_group_id])
        params[:locations].each do |location|
            size += location[:panel_size].to_i
        end
        render json: { price: country.panel_provider.calculate_price * size }.to_json
    end

    private
    def check_token
        if !request.headers['Authentication-Id'] || !request.headers['Authentication-Secret']
            if %w(locations target_groups).include?(params[:action])
                redirect_to controller: 'public/public', action: params[:action]
            else
                render json: 'Not authorized', status: 401 and return
            end
        else
            user = Auth.find_by_uuid(request.headers['Authentication-Id'])
            render json: 'Not authorized', status: 401 and return unless user

            sha = Digest::SHA512.new
            sha << SECRET_BASE
            hash = sha.hexdigest request.headers['Authentication-Secret']
            
            render json: 'Not authorized', status: 401 and return unless hash == user.token
        end
    end

    include CommonActions
end