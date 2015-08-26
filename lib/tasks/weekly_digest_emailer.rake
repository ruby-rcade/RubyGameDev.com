namespace :digest_mailer do
  desc "Send weekly digest email"
  
  task weekly_digest: :environment do
    WeeklyDigestWorker.perform_async
  end
end
