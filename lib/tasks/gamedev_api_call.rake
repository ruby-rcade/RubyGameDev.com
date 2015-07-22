namespace :gamedev_api_call do
  desc "TODO"
  task fetch_questions: :environment do
  	GamedevWorker.perform_async
  end

end
