class AddCompletedFlagToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :completed, :boolean, default: false
  end
end
