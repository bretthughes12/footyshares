class AddStartingSharesToUser < ActiveRecord::Migration
  def change
    add_column :users, :starting_shares, :integer, default: 0
  end
end
