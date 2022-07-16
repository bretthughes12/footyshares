class AddCompletedFlagToMatches < ActiveRecord::Migration[4.2]
  def change
    add_column :matches, :completed, :boolean, default: false
  end
end
