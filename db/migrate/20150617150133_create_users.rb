class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :subscribe, default: true
      t.string :openid, index: true
      t.string :nickname
      t.integer :sex
      t.string :language, default: 'zh_CN'
      t.string :city
      t.string :province
      t.string :country
      t.string :headimgurl
      t.datetime :subscribe_time
      t.string :unionid
      t.string :remark
      t.integer :groupid, default: 0

      t.timestamps null: false
    end
  end
end
