class City < ActiveRecord::Base
  serialize :daily_data, JSON
  
  def update_city_data
    location_key = self.location_key
    if self.updated_at <= Date.today.to_time.beginning_of_day or !self.daily_data
      url = "http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{location_key}"
      response = HTTParty.get(url, query: {apikey: Figaro.env.accuweather_api_key, language:"en-us", details: "true"})
      self.update_attribute("daily_data" , response) 
    end
    return self.id
    # daily  
    # daily_data is a hash with key: dailyForecasts value: array of 5 day forecast
    # we want to get "AirAndPollen" key 
    # value of AirAndPollen -> array of hashes with Name, Value, Category, CategoryValue, 
    # the first hash in AirAndPollen also has a type. 
  end
  
  
  def self.get_location_key(zip, name, state, country)
    city = City.find_by(name: name,state: state,country: country)
    if city
      return city.location_key
    end
    if zip 
      if state and country
        url = "http://dataservice.accuweather.com/locations/v1/#{country}/#{state}/search"
        response = HTTParty.get(url, query: {apikey: Figaro.env.accuweather_api_key ,q: "#{zip}",language:"en-us" } )
        location_key = response[0]["Key"]
        City.create(name: name, zip: zip, state: state, country: country, location_key: location_key )
        return location_key
      end
    end
  end
  
  
  
  
  
end
