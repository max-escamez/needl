class AddUserToVinyls < ActiveRecord::Migration[5.2]
  def change
    add_reference :vinyls, :user, foreign_key: true
  end
end
