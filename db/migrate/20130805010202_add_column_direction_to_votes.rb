class AddColumnDirectionToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :direction, :integer
  end
end
