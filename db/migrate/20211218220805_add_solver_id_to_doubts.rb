class AddSolverIdToDoubts < ActiveRecord::Migration[5.2]
  def change
    add_column :doubts, :solver_id, :integer
  end
end
