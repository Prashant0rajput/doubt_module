class AddUserToDoubts < ActiveRecord::Migration[5.2]
  def change
    add_reference :doubts, :user, foreign_key: true
  end
end
