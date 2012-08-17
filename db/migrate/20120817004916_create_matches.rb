class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name
      t.string :venue
      t.integer :round_id
      t.boolean :allow_only_one_team, default: false, null: false

      t.timestamps
    end
  end
end
