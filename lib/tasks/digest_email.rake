namespace :digest_mailer do
  desc "Send digest email"
  task daily_digest: :environment do
    DailyDigestWorker.perform_async
  end
  
  # task weekly_digest: do

  # end

  # task monthly_digest: do

  # end
end
