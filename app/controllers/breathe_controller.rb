class BreatheController < ApplicationController
    
  def index
    searches = params[:searches]
    @searched_cities = searches
      
    # @users = User.all
    # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    # marker.lat user.latitude
    # marker.lng user.longitude
    # end
    # @cityname = "Berkeley"
    # @cities = session[:cities] || ['berkeley', 'fremont', 'irvine']
 end
    
end
