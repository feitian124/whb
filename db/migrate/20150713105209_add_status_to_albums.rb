class AddStatusToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :status, :integer, default: 0
  end
end
