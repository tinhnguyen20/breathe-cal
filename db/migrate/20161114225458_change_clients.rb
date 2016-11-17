class ChangeClients < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
  end
end
