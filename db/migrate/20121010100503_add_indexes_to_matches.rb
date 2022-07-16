class AddIndexesToMatches < ActiveRecord::Migration[4.2]
  def change
    add_index :matches, :name
    add_index :matches, :round_id
  end
end
