class AddAlbumToImages < ActiveRecord::Migration
  def change
    add_reference :images, :album, index: true, foreign_key: true
  end
end
