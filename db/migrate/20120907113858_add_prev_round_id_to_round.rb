class AddPrevRoundIdToRound < ActiveRecord::Migration[4.2]
  def change
    add_column :rounds, :prev_round_id, :integer
  end
end
