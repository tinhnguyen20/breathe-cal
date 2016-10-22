class BreatheController < ApplicationController
    
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    marker.lat user.latitude
    marker.lng user.longitude
    end
    @cities = session[:cities] || ['berkeley', 'fremont', 'irvine']
 end
    
    def show
      name = params[:name]
      zip = params[:zip] 
      state = params[:state] |= "CA"
      country = params[:country] |= "US"
      City.get_location_key(zip,name,state,country)
      @city = City.find_by(name: name, zip: zip, state:state, country: country)
      @city.update_city_data
      daily_data = @city.daily_data 
      forecasts = daily_data["DailyForecasts"] 
    # daily_data is a hash with key: dailyForecasts value: array of 5 day forecast
    # we want to get "AirAndPollen" key 
    # value of AirAndPollen -> array of hashes with Name, Value, Category, CategoryValue, 
    # the first hash in AirAndPollen also has a type.
      @day_1 = forecast[0]["AirAndPollen"]
      @day_2 = forecast[1]["AirAndPollen"]
      @day_3 = forecast[2]["AirAndPollen"]
      @day_4 = forecast[3]["AirAndPollen"]
      @day_5 = forecast[4]["AirAndPollen"]
      
            
    end
    
    
    
end
