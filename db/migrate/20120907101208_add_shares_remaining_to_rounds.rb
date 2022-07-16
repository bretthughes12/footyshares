class AddSharesRemainingToRounds < ActiveRecord::Migration[4.2]
  def change
    add_column :rounds, :shares_remaining, :integer, default: 0
  end
end
