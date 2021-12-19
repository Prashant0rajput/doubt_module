class AddStatusToDoubt < ActiveRecord::Migration[5.2]
  def change
    add_column :doubts, :status, :integer, :default => 2
  end
end
