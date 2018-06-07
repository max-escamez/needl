class AddVotesToVinyls < ActiveRecord::Migration[5.2]
  def change
    add_column :vinyls, :votes, :integer
  end
end
