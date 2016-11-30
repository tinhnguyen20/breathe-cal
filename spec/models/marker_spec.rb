require 'rails_helper'

RSpec.describe Marker, type: :model do

  describe ".find_all_within_bounds" do
    it "returns no markers with impossible specs" do
      expect(Marker.find_all_within_bounds(10,20,20,10)).to be_empty
    end
    
    it "returns all cities within the bounds" do
      Marker.create!(lat: 15, lng: 15, cat: true)
      Marker.create!(lat: 14, lng: 14, cat: true)
      Marker.create!(lat: 30, lng: 30, cat: true)
      expect(Marker.find_all_within_bounds(20,10,20,10).length).to eq(2)
    end
    
  end

end
