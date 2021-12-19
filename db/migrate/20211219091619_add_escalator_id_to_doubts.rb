class AddEscalatorIdToDoubts < ActiveRecord::Migration[5.2]
  def change
    add_column :doubts, :escalator_id, :integer
  end
end
