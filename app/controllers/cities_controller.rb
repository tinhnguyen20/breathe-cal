class CitiesController < ApplicationController
    
    skip_before_action :verify_authenticity_token

    
    def index
    end
    
    def new
    end
  
    # so i need to mimic the create route with a number of param types. 
    # or do i
    
    # ajax POST -> city create route, with certain parameters. 
    # tell create to respond to some formats... 
    def cached_city_data
      city = City.find_by(name: params[:name])
      city.update_city_data
      @geo = [city.lat, city.lng]
      @data = [city.name, city.daily_data]
      @cached = true
      respond_to do |format|
        format.js {
          render :template => "cities/city_data.js.erb"
        }
      end
    end
    def a_in_b_as_c?(a, b, c) # a in b as c
      b.each do |i|
        if i[c] == a
          return true
        end
      end
      return false
    end
    def city_data
      if params[:geo]
        latlng = params[:geo]
        loc_key = City.get_loc_key(latlng["lat"], latlng["lng"], params[:name])
        city = City.find_by(location_key: loc_key)
      end
      city.update_city_data
      # File.open("public/temp.json","w") do |f|
      #   f.write(JSON.pretty_generate(city.daily_data))
      # end
      # puts "***************************"
      @data = [city.name, city.daily_data]
      unless a_in_b_as_c?(city.name, session[:cities], "name")
        session[:cities] << { "name" => city.name, "quality" => city.daily_data["DailyForecasts"][0]["AirAndPollen"][0]["Category"] }
      end
      respond_to do |format|
        format.js {
          render :template => "cities/city_data.js.erb"
        }
      end
      # render :json => city.daily_data.to_json
    end
    
    def city_data_back
      @text = "Recent Searches"
      if session[:cities]
        if session[:cities].length > 5
          session[:cities] = session[:cities][session[:cities].length - 5, session[:cities].length - 1]
        end 
        @cities = session[:cities].reverse
      else
        @cities = []
        session[:cities] = []
      end
      respond_to do |format|
        format.js {
          render :template => "cities/city_data_back.js.erb"
        }
      end      
    end
    
    def display_favorite_cities
      # byebug
      @text = "Favorite Cities"
      @cities = session[:favorites]
       respond_to do |format|
        format.js {
          render :template => "cities/city_data_back.js.erb"
        }
        end
    end
    
    def favorite_city
      # byebug
      city = City.find_by(name: params[:name])
      if session[:client_id]
        client = Client.find_by(id: session[:client_id])
        if session[:favorites]
          unless a_in_b_as_c?(city.name, session[:favorites], "name")
            session[:favorites] << { "name" => city.name, "quality" => city.daily_data["DailyForecasts"][0]["AirAndPollen"][0]["Category"] }
            client.cities << city
            flash.now[:notice] = "Added " + params[:name] + " to Favorite Cities!"
          else
            flash.now[:notice] = params[:name] + " is already one of your favorite cities!"
          end
        else
          session[:favorites] = []
          session[:favorites] << { "name" => city.name, "quality" => city.daily_data["DailyForecasts"][0]["AirAndPollen"][0]["Category"] }
          client.cities << city
          flash.now[:notice] = "Added " + params[:name] + " to Favorite Cities!"
        end
      else
        #need to figure out how to redirect to google oauth page
        flash.now[:notice] = "You must be logged in order to favorite a city!"
      end
      @data = [city.name, city.daily_data]
      respond_to do |format|
        format.js {
          render :template => "cities/city_data.js.erb"
        }
        end
    end
      

    
    
    
    def create
      if params[:city]
        City.get_location_key(params[:city]["zip"],params[:city]["name"],params[:city]["state"],params[:city]["country"])
        city = City.find_by(params[:location_info])
      elsif params[:geo]
        latlng = params[:geo]
        loc_key = City.get_loc_key(latlng["lat"], latlng["lng"])
        city = City.find_by(location_key: loc_key)
      end
      city.update_city_data
      respond_to do |format|
        format.html {redirect_to city_path id: city.id}
        format.json {render :json => city.daily_data.to_json}
      end
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
