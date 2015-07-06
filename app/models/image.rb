class Image < ActiveRecord::Base
  belongs_to :user

  before_create :set_src

  protected
    # uploads/group/openid/date/file
    def set_src
      if src.blank?
        group = user.openid[0..2]
        date = created_at.strftime('%Y%m%d')
        self.src = "uploads/#{group}/#{user.openid}/#{date}/#{media_id}"
      end
    end
end
