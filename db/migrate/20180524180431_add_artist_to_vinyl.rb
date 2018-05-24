class AddArtistToVinyl < ActiveRecord::Migration[5.2]
  def change
    add_column :vinyls, :artist, :string
  end
end
