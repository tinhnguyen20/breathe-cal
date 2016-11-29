require 'date'
class BreatheController < ApplicationController
  def index
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
    
    url = "http://www.baaqmd.gov/Feeds/AlertRSS.aspx"
    feed = Feedjira::Feed.fetch_and_parse url
    @feed = feed
    
    Time::DATE_FORMATS[:custom] = lambda { |time| time.strftime("%B #{time.day.ordinalize}, %Y") }
    @dt = (DateTime.now + Rational(-8,24)).to_formatted_s(:custom)
 end
    
end
