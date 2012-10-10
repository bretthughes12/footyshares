class AddIndexesToShares < ActiveRecord::Migration
  def change
    add_index :shares, [:user_id, :team_id]
  end
end
