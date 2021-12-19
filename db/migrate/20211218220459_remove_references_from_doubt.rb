class RemoveReferencesFromDoubt < ActiveRecord::Migration[5.2]
  def change
    remove_column :doubts, :references, :user
  end
end
