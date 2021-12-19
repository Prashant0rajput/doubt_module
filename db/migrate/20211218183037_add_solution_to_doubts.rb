class AddSolutionToDoubts < ActiveRecord::Migration[5.2]
  def change
    add_column :doubts, :solution, :text
  end
end
