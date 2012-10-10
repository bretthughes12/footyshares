class AddIndexesToMatches < ActiveRecord::Migration
  def change
    add_index :matches, :name
    add_index :matches, :round_id
  end
end
