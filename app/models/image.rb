class Image < ActiveRecord::Base
  belongs_to :user

  before_create :set_src

  def path
    group = user.openid[0..2]
    date = created_at.strftime('%Y%m%d')
    "#{Rails.root}/uploads/#{group}/#{user.openid}/#{date}"
  end

  protected
    # uploads/group/openid/date/file
    def set_src
      if src.blank?
        self.src = "#{path}/#{media_id}"
      end
    end
end
