class AddIndexesToRounds < ActiveRecord::Migration[4.2]
  def change
    add_index :rounds, :name
    add_index :rounds, :starts_at
  end
end
