class AddCategoryToSongs < ActiveRecord::Migration
  def change
     add_column :songs, :category, :string
  end
end
