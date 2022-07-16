class CreateTeams < ActiveRecord::Migration[4.2]
  def change
    create_table :teams do |t|
      t.integer :match_id
      t.string :name, null: false
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end
