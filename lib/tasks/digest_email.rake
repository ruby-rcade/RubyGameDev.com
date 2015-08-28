namespace :digest_email do

  desc "Send daily digest email"
  task daily_digest: :environment do
    DailyDigestWorker.perform_async
  end

  # desc "Send weekly digest email"
  # task weekly_digest: :environment do
  #   desc "Send daily digest email"
  #   WeeklyDigestWorker.perform_async
  # end

  # desc "Send monthly digest email"  
  # task monthly_digest: :environment do
  #   desc "Send daily digest email"
  #   MonthlyDigestWorker.perform_async
  # end
end
