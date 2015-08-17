class GetImageJob < ActiveJob::Base
  queue_as :imagejobs

  def perform(img)
    puts "in imagejobs: #{img.inspect}"
  end
end
