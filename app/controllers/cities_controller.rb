class CitiesController < ApplicationController
    
    def index
    end
    
    def new
    end
  
  
    def create
      City.get_location_key(params[:city]["zip"],params[:city]["name"],params[:city]["state"],params[:city]["country"])
      city = City.find_by(params[:location_info])
      city.update_city_data
      redirect_to city_path id: city.id
    end
  
  
    def show
      @city = City.find(params[:id])
      @city.update_city_data
      @city.reload
      daily_data = @city.daily_data
      forecasts = daily_data["DailyForecasts"] 
    # daily_data is a hash with key: dailyForecasts value: array of 5 day forecast
    # we want to get "AirAndPollen" key 
    # value of AirAndPollen -> array of hashes with Name, Value, Category, CategoryValue, 
    # the first hash in AirAndPollen also has a type.
      
      # @day_1["Name"] = forecasts[0]["AirAndPollen"]["Name"]
      # @day_1["Value"] = forecasts[0]["AirAndPollen"]["Name"]
      # @day_1["Category"] = forecasts[0]["AirAndPollen"]["Name"]
      # @day_1[""] = forecasts[0]["AirAndPollen"]["Name"]
      # @day_1["Name"] = forecasts[0]["AirAndPollen"]["Name"]
      d1 = forecasts[0]["AirAndPollen"]
      d2 = forecasts[1]["AirAndPollen"]
      d3 = forecasts[2]["AirAndPollen"]
      d4 = forecasts[3]["AirAndPollen"]
      d5 = forecasts[4]["AirAndPollen"]
      @forecasts = [d1,d2,d3,d4,d5]
    end
  
end
