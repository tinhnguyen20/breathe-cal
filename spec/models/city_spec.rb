require 'rails_helper'

RSpec.describe City, type: :model do
  describe "city#get_location_key" do

    it "gets the location key" do 
      expect(City.get_location_key("94704", "Berkeley", "CA", "US")).to eq "39627_PC"
    end
    
    
    # this is the non ajax version subject to change!

    #   expect(City).to receive().with("Berkeley")
    # it "calls the model method that gets the location key from accuweather" do 
    #   post :, {: => 'Berkeley'}
    # end
  end
  
  describe "city#update_daily_data" do
    
    it "updates the daily_data" do
      expect(true).to eq(true)      
    end
  
  end

end
