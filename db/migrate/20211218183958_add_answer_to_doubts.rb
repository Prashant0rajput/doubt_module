class AddAnswerToDoubts < ActiveRecord::Migration[5.2]
  def change
    add_column :doubts, :answer, :text
  end
end
