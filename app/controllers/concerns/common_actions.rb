module CommonActions
    def self.included(base)
        base.before_filter :get_country
    end

     def locations
        locs = @country.panel_provider.location_groups.includes(:locations).map(&:locations).flatten
        render json: locs.to_json
    end

    def target_groups
        groups = @country.target_groups.uniq
        render json: groups.to_json
    end

    private
    def get_country
        @country = Country.find_by_country_code(params[:country_code])
        render json: 'No such country'.to_json, status: 404 and return unless @country
    end
end