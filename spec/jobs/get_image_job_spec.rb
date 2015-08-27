require 'rails_helper'

RSpec.describe GetImageJob, type: :job do
  include ActiveJob::TestHelper

  let(:image) { create(:image) }

  it 'enqueued_jobs' do
    GetImageJob.perform_later image
    expect(enqueued_jobs.size).to eq(1)
  end
end
