class CreateBreathes < ActiveRecord::Migration
  def change
    create_table :breathes do |t|

      t.timestamps null: false
    end
  end
end
