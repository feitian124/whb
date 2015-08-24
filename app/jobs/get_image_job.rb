class GetImageJob < ActiveJob::Base
  queue_as :default

  def perform(img)
    img.upload
  end
end
