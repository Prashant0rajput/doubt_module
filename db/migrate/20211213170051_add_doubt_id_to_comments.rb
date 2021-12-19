class AddDoubtIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :doubt, foreign_key: true
  end
end
