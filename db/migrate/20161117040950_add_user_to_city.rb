class AddUserToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :user, index: true, foreign_key: true
  end
end
