namespace :digest_mailer do
  desc "Send monthly digest email"

  task monthly_digest: :enviroment do
    MonthlyDigestWorker.perform_async
  end
end
