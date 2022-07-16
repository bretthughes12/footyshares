class AddIndexesToUsers < ActiveRecord::Migration[4.2]
  def change
    add_index :users, :login, unique: true
  end
end
