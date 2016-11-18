class AddClientToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :client, index: true, foreign_key: true
  end
end
