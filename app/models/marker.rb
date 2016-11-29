class Marker < ActiveRecord::Base
  belongs_to :client
  
  
  def self.find_all_within_bounds(top, bottom, left, right)
    markersTop = Marker.where("lat < (?)", top)
    markersBottom = Marker.where("lat > (?)", bottom)
    markersLeft = Marker.where("lng < ?", left)
    markersRight = Marker.where("lng > ?", right)

    between = markersBottom & markersTop & markersLeft & markersRight
    return between
    # markers = Marker.where("lng < (?) AND lat < (?) AND lng > (?) AND lat > (?) ", right, top, left, bottom)
  end
      
  
  
end
