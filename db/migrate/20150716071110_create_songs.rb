class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string   "name"
      t.string   "desc"
      t.string   "src"
      t.string   "singer"
      t.string   "collection"
      t.integer  "duration"

      t.timestamps null: false
    end
  end
end
