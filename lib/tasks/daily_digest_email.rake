namespace :digest_mailer do
  desc "Send daily digest email"

  task daily_digest: :environment do
    DailyDigestWorker.perform_async
  end

end
