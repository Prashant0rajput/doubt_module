class AddSolverIdToDoubt < ActiveRecord::Migration[5.2]
  def change
    add_column :doubts, :references, :user
  end
end
