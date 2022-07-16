class RemoveCompletedFromMatches < ActiveRecord::Migration[4.2]
  def change
    remove_column :matches, :completed
  end
end
