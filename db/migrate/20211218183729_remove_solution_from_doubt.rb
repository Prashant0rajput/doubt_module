class RemoveSolutionFromDoubt < ActiveRecord::Migration[5.2]
  def change
    remove_column :doubts, :solution, :string
  end
end
