class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :match_id
      t.string :name, null: false
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end
