class GetImageJob < ActiveJob::Base
  queue_as :imagejobs

  def perform(img)
    logger.info "========================================"
    logger.info "in imagejobs: #{img.inspect}"
    img.upload
  end
end
