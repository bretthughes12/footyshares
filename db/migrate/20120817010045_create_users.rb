class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :hashed_password
      t.string :salt
      t.string :email
      t.string :nickname
      t.boolean :admin, default: false
      t.integer :shares_remaining, default: 0

      t.timestamps
    end
  end
end
