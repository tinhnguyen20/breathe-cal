class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :lng
      t.string :lat
      t.boolean :dog
      t.boolean :cat
      t.boolean :mold
      t.timestamps null: false
    end
  end
end
