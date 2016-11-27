class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :lng
      t.string :lat
      t.string :title
      t.boolean :dog
      t.boolean :cat
      t.boolean :mold
      t.boolean :bees
      t.boolean :perfume
      t.boolean :oak
      t.boolean :dust
      t.boolean :smoke
      t.boolean :gluten
      t.boolean :peanut
      t.timestamps null: false
    end
  end
end
