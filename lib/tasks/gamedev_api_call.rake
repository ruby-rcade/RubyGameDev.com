namespace :gamedev_api_call do
  desc "Fetch external posts from gamedev site"
  task fetch_questions: :environment do
  	GamedevWorker.perform_async
  end
end
