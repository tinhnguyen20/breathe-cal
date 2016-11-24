require 'rails_helper'

RSpec.describe Marker, type: :model do

  describe ".find_all_within_bounds" do
    it "gets the corners of the map" do
      expect(Marker).to receive(:find_all_within_bounds).with(10,20,10,10)
      Marker.find_all_within_bounds(10,20,10,10)
    end
    
  end

end
