class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :src
      t.string :alt
      t.string :desc

      # from wechat
      t.string :pic_url
      t.string :media_id
      t.string :msg_id

      t.timestamps null: false
    end
  end
end
