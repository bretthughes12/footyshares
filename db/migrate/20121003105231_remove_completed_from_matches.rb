class RemoveCompletedFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :completed
  end
end
