class CreateVinyls < ActiveRecord::Migration[5.2]
  def change
    create_table :vinyls do |t|
      t.string :album_title
      t.text :description

      t.timestamps
    end
  end
end
