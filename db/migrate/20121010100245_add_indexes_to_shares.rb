class AddIndexesToShares < ActiveRecord::Migration[4.2]
  def change
    add_index :shares, [:user_id, :team_id]
  end
end
