class City < ActiveRecord::Base
  belongs_to :client
  serialize :daily_data, JSON
  
<<<<<<< HEAD
  def self.get_accuweather_key()
    Rails.application.secrets.ACCUWEATHER_KEY
  end
  
  def self.get_resonse(resp, url, query)
    return resp
  end
      
=======
  def self.get_api_key(i)
    ["nvdxlfErdFcQssANvU52VQYNj9JauI4z", "IGE0pfTgoL1OGJKvEcnAbbqpmQGjvbpo", "5NMWDxuXmQpNLf7AQ2gj0Y8uBkLXT8q3", "CdE0YANGAu4AsDAReO0e6CZ01RwfFe9a"][i]
  end
  
  def self.rescue_api(res, i, url, query, iMAX=3)
    if i == iMAX or res.code == 200
      return res
    else
      query[:apikey] = City.get_api_key(i + 1)
      return City.rescue_api(HTTParty.get(url, query: query), i + 1, url, query)
    end
  end
>>>>>>> fbd5f81cef9a58c9e8aa48ffeff2dce15be07e6f
  def update_city_data
    location_key = self.location_key
    if self.updated_at <= Date.today.to_time.beginning_of_day or !self.daily_data
      url = "http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{location_key}"
      query = {apikey: City.get_accuweather_key(), language:"en-us", details: "true"}
      response = City.get_resonse(HTTParty.get(url, query: query), url, query)
      self.update_attribute("daily_data" , response)
    end
  end
  
  def self.get_loc_key(lat,lng, name)
    city = City.find_by(lat: lat, lng: lng)
    if city
      return city.location_key
    end
    url = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search"
    query = {apikey: City.get_accuweather_key(0), q: "#{lat},#{lng}",language:"en-us" }
    response = City.get_resonse(HTTParty.get(url, query: query), 0, url, query)
    location_key = response["Key"]
    City.create(lat: "#{lat}", lng: "#{lng}", location_key: location_key, name: name)
    return location_key
  end

end
