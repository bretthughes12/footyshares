class AddIndexesToTeams < ActiveRecord::Migration
  def change
    add_index :teams, :name
    add_index :teams, :match_id
  end
end
