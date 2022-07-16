class CreateShares < ActiveRecord::Migration[4.2]
  def change
    create_table :shares do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :shares, default: 0

      t.timestamps
    end
  end
end
