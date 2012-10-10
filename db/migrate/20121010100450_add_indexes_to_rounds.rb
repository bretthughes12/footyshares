class AddIndexesToRounds < ActiveRecord::Migration
  def change
    add_index :rounds, :name
    add_index :rounds, :starts_at
  end
end
