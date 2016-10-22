class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :country
      t.string :location_key
      t.string :zip
      t.text :daily_data

      t.timestamps null: false
    end
  end
end
