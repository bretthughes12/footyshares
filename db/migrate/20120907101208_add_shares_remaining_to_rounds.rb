class AddSharesRemainingToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :shares_remaining, :integer, default: 0
  end
end
