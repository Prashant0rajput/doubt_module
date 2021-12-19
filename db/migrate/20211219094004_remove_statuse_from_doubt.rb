class RemoveStatuseFromDoubt < ActiveRecord::Migration[5.2]
  def change
    remove_column :doubts, :status, :integer
  end
end
