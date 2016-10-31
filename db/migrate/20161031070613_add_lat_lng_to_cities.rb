class AddLatLngToCities < ActiveRecord::Migration
  def change
    add_column :cities, :lat, :string
    add_column :cities, :lng, :string
  end
end
