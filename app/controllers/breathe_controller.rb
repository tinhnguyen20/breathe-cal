require 'date'
class BreatheController < ApplicationController
  def index
    begin
      url = "http://www.baaqmd.gov/Feeds/AlertRSS.aspx"
      feed = Feedjira::Feed.fetch_and_parse url
      entry = feed.entries[0]
      @welcome_message = feed.title 
      @alert = entry.summary
    rescue
      @welcome_message = "Spare the Air Day Info"
      @alert = "Spare the Air Day info is currently unavailable"
    end
      
    if @text.nil?
      @text = "Recent Searches"
    end
    # session.clear
    # @users = User.all
    # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    # marker.lat user.latitude
    # marker.lng user.longitude
    # end
    # @cityname = "Berkeley"
    if session[:cities]
      if session[:cities].length > 5
        session[:cities] = session[:cities][session[:cities].length - 5, session[:cities].length - 1]
      end
      @cities = session[:cities]
    else
      @cities = []
      session[:cities] = []
    end
    @cities = @cities.reverse
    
    # Populate Favorite Searches
    
    # Recent searches
    
    
    @text = "Recent Searches"
    Time::DATE_FORMATS[:custom] = lambda { |time| time.strftime("%B #{time.day.ordinalize}, %Y") }
    @dt = (DateTime.now + Rational(-8,24)).to_formatted_s(:custom)
 end
    
end
