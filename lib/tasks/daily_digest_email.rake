namespace :digest_mailer do
  desc "Send digest email"

  task daily_digest: :environment do
    DailyDigestWorker.perform_async
  end
  
end
