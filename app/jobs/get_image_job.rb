class GetImageJob < ActiveJob::Base
  queue_as :default

  def perform(img)
    logger.info "========================================"
    logger.info "in default jobs: #{img.inspect}"
    img.upload
  end
end
