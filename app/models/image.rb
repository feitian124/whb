class Image < ActiveRecord::Base
  belongs_to :user

  before_create :set_src

  protected
    # uploads/openid-group/openid/date/file
    def set_src
      if src.blank?
        self.src = 'src'
      else
        true
      end
    end
end
