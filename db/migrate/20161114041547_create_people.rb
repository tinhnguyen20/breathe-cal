class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps null: false
    end
  end
end
