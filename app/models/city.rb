class City < ActiveRecord::Base
  belongs_to :client
  serialize :daily_data, JSON
  
  #THESE ARE GETTING DELETED fa
  def self.get_api_key(i)
    ["nvdxlfErdFcQssANvU52VQYNj9JauI4z", "IGE0pfTgoL1OGJKvEcnAbbqpmQGjvbpo", "5NMWDxuXmQpNLf7AQ2gj0Y8uBkLXT8q3", "CdE0YANGAu4AsDAReO0e6CZ01RwfFe9a"][i]
  end
  
  #THESE ARE GETTING DELETED fa
  def self.rescue_api(res, i, url, query, iMAX=3)
    if i == iMAX or res.code == 200
      return res
    else
      query[:apikey] = City.get_api_key(i + 1)
      return City.rescue_api(HTTParty.get(url, query: query), i + 1, url, query)
    end
  end
  def update_city_data
    location_key = self.location_key
    if self.updated_at <= Date.today.to_time.beginning_of_day or !self.daily_data
      url = "http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{location_key}"
      query = {apikey: City.get_api_key(0), language:"en-us", details: "true"}
      response = City.rescue_api(HTTParty.get(url, query: query), 0, url, query)
      self.update_attribute("daily_data" , response) 
    end
    # daily  
    # daily_data is a hash with key: dailyForecasts value: array of 5 day forecast
    # we want to get "AirAndPollen" key 
    # value of AirAndPollen -> array of hashes with Name, Value, Category, CategoryValue, 
    # the first hash in AirAndPollen also has a type. 
  end
  
  
  #save by lat long? place id? something else?
  
  # probably need a better pattern for this anyway.. 
  def self.get_loc_key(lat,lng, name)
    city = City.find_by(lat: lat, lng: lng)
    if city
      return city.location_key
    end
    url = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search"
    query = {apikey: City.get_api_key(0) ,q: "#{lat},#{lng}",language:"en-us" }
    response = City.rescue_api(HTTParty.get(url, query: query), 0, url, query)
    location_key = response["Key"]
    City.create(lat: "#{lat}", lng: "#{lng}", location_key: location_key, name: name)
    return location_key
  end
  
  # def self.get_location_key(zip, name, state, country)
  #   city = City.find_by(name: name, state: state,country: country)
  #   if city
  #     return city.location_key
  #   end
  #   if zip 
  #     if state and country
  #       url = "http://dataservice.accuweather.com/locations/v1/#{country}/#{state}/search"
  #       response = HTTParty.get(url, query: {apikey: "5NMWDxuXmQpNLf7AQ2gj0Y8uBkLXT8q3" ,q: "#{zip}",language:"en-us" } )
  #       location_key = response[0]["Key"]
  #       City.create(name: name, zip: zip, state: state, country: country, location_key: location_key )
  #       return location_key
  #     end
  #   end
  # end
  
  
  
  
  
end
