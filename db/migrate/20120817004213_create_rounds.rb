class CreateRounds < ActiveRecord::Migration[4.2]
  def change
    create_table :rounds do |t|
      t.string :name
      t.datetime :cutoff_at
      t.datetime :starts_at

      t.timestamps
    end
  end
end
