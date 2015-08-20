require "rails_helper"

describe GamedevWorker do
  it "enqueues a Gamedev job" do
    Sidekiq::Testing.fake!
    expect {
      GamedevWorker.perform_async
    }.to change(GamedevWorker.jobs, :size).by(1)
  end

  context "with succesful response" do
    it 'creates external posts' do
      VCR.use_cassette("questions") do
        Sidekiq::Testing.inline!
          expect {
            GamedevWorker.perform_async
          }.to change(ExternalPost, :count).by(25)
      end
    end
  end
end
