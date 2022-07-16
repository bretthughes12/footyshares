class AddStartingSharesToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :starting_shares, :integer, default: 0
  end
end
