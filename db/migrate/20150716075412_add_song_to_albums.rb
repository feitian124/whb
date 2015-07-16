class AddSongToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :song, index: true, foreign_key: true
  end
end
