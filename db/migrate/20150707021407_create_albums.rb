class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :desc
      t.string :music
      t.string :template

      t.timestamps null: false
    end
  end
end
