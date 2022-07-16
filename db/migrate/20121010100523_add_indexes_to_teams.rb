class AddIndexesToTeams < ActiveRecord::Migration[4.2]
  def change
    add_index :teams, :name
    add_index :teams, :match_id
  end
end
