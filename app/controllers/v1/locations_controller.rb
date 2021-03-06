module V1
  class LocationsController < BaseController
    load_and_authorize_resource

    def index
      @locations = Location.all
      @locations = @locations.near(params[:ll], params[:radius].to_f / 1000, units: :km) if params[:ll]
      @locations = @locations.by_mood(params[:mood]) if params[:mood]
      @locations = @locations.by_category(params[:category]) if params[:category]
      @locations = @locations.by_user(params[:user_id]) if params[:user_id]
      @locations = @locations.includes(:articles) if params[:include_articles]
    end

    def show
      if params[:id].to_i.to_s == params[:id]
        @location = Location.find_by!(id: params[:id])
      else
        @location = Location.find_by!(foursquare_id: params[:id])
      end
    end
  end
end
