class AddIndexesToUsers < ActiveRecord::Migration
  def change
    add_index :users, :login, unique: true
  end
end
