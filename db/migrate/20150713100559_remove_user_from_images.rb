class RemoveUserFromImages < ActiveRecord::Migration
  def change
    remove_reference :images, :user, index: true
  end
end
