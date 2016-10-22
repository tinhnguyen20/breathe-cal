require 'rails_helper'

RSpec.describe Breathe, type: :model do
  describe "Getting Allergen and Weather Data" do
    
    # non AJAX version -> will currently route to new page.
    # ok i just want to super basics
    
    it "calls the model method that performs AccuWeather API call" do 
      expect(Breathe).to receive(:find_in_accu).with("Berkeley")
      post :search_accu, {:search_terms => 'Berkeley'}
    end
    
    it "selects the city data template for rendering" do
      post :search_accu, {:search_terms => 'Berkeley'}
      expect(response.to render_template("city_info"))
    end
    
    it "makes the AccuWeather results available to that template" do
      allow(Movie).to receive(:find_in_accu).and_return(@fake_results)
      post :search_accu, {:search_terms => 'Berkeley'}
      expect(assigns(:accu_info)).to eq(@fake_result);
    end
  


  end
end
